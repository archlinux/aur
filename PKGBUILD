# $Id$
# Maintainer: Max Mazurov <fox.cpp at disroot dot org>
# Contributor: Jonas Heinrich <onny@project-insantiy.org>
pkgname='maddy'
pkgver=0.5.0
pkgrel=1
pkgdesc='Composable all-in-one mail server'
arch=('x86_64')
url='https://github.com/foxcpp/maddy'
license=('GPL3')
depends=('glibc')
makedepends=('go' 'git' 'scdoc')
optdepends=()
source=(
    "${pkgname}-${pkgver}.tar.zst::https://foxcpp.dev/maddy-builds/${pkgver}/maddy-${pkgver}-src.tar.zst"
    "${pkgname}-${pkgver}.tar.zst.sig::https://foxcpp.dev/maddy-builds/${pkgver}/maddy-${pkgver}-src.tar.zst.sig"
    'maddy.sysusers'
    'maddy.tmpfiles'
)
backup=('etc/maddy/maddy.conf')
sha512sums=('28702a13bebaf5f77934bc5883c75e364d54c73bafc0dae30c8cef4e6019225dc96848c24a8c63aac35524b90b46bd1b6931f593aa6a215d2e40e4a2c55ea654'
            'SKIP'
            '750346110adb8caa61f537560018497f73543dc01ff26aceed2f052f281a35fdc659c9c478cc55775eadf8a3d17b511d5bed86334d1c455732dcb9a273120589'
            'f33135b81129d6ef3006d8e9f410ec0d7e44226ae640dea77d756268d0e97828d8965ac75d0d9b49604a19b8b9e0384d15007d33c4b813f359108d28a10702b5')
validpgpkeys=('3197BBD95137E682A59717B434BB2007081396F4')
build() {
    export GOPATH="$PWD/gopath"
    cd "${srcdir}/maddy-${pkgver}-src"

    ./build.sh --version "${pkgver}" --prefix /usr build

    # Module cache is read-only by default. Fix its permissions so it will be
    # easier to clean build directory.
    chmod -R +w ${GOPATH}
}

check() {
    export GOPATH="$PWD/gopath"
    cd "${srcdir}/maddy-${pkgver}-src"

    go test ./...

    cd tests/
    ./run.sh

    chmod -R +w ${GOPATH}
}

package() {
    export GOPATH="$PWD/gopath"
    cd "${srcdir}/maddy-${pkgver}-src"

    ./build.sh \
        --version "v${pkgver}" \
        --prefix /usr \
        --destdir "${pkgdir}" \
        install

    install -Dm 0644 "${srcdir}/maddy.sysusers" "${pkgdir}/usr/lib/sysusers.d/maddy.conf"
    install -Dm 0644 "${srcdir}/maddy.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/maddy.conf"
}
