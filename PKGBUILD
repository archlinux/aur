# $Id$
# Maintainer: Max Mazurov <fox.cpp at disroot dot org>
# Contributor: Jonas Heinrich <onny@project-insantiy.org>
pkgname='maddy'
pkgver=0.5.2
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
sha512sums=('1cc96187a411e964091182b8e4b81ac30120dfdaa0356ac9aa127a168fdcd44b297e789e49309c4cc18b6cfdfce9f0a4eba63895d9134d4d296f0351ccc1d699'
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

    sed -i 's!/usr/local/bin!/usr/bin!g' "${pkgdir}/usr/lib/systemd/system/maddy.service" "${pkgdir}/usr/lib/systemd/system/maddy@.service"
    install -Dm 0644 "${srcdir}/maddy.sysusers" "${pkgdir}/usr/lib/sysusers.d/maddy.conf"
    install -Dm 0644 "${srcdir}/maddy.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/maddy.conf"
}
