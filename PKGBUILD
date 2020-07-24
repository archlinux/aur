# $Id$
# Maintainer: Max Mazurov <fox.cpp at disroot dot org>
# Contributor: Jonas Heinrich <onny@project-insantiy.org>
pkgname='maddy'
pkgver=0.3.3
pkgrel=1
pkgdesc='Composable all-in-one mail server'
arch=('x86_64')
url='https://github.com/foxcpp/maddy'
license=('MIT')
depends=('glibc')
makedepends=('go' 'git' 'scdoc')
optdepends=(
    "bash: For rspamd-hook script"
)
source=(
    "${pkgname}-${pkgver}.tar.zst::https://github.com/foxcpp/maddy/releases/download/v${pkgver}/maddy-${pkgver}-src.tar.zst"
    "${pkgname}-${pkgver}.tar.zst.sig::https://github.com/foxcpp/maddy/releases/download/v${pkgver}/maddy-${pkgver}-src.tar.zst.sig"
    'maddy.sysusers'
    'maddy.tmpfiles'
)
backup=('etc/maddy/maddy.conf')
sha512sums=('d29beeb07dc20fec5b2bc88f830a6c5385b1091965078812f1b511deba0b54f1a61bbe411eb3cad234b29cc4b5faac9a374f351cedb80d5b8d6fc8e2d7c02e22'
            'SKIP'
            '750346110adb8caa61f537560018497f73543dc01ff26aceed2f052f281a35fdc659c9c478cc55775eadf8a3d17b511d5bed86334d1c455732dcb9a273120589'
            'f33135b81129d6ef3006d8e9f410ec0d7e44226ae640dea77d756268d0e97828d8965ac75d0d9b49604a19b8b9e0384d15007d33c4b813f359108d28a10702b5')
validpgpkeys=('3197BBD95137E682A59717B434BB2007081396F4')
build() {
    export GOPATH="$PWD/gopath"
    cd "${srcdir}/maddy-${pkgver}-src"

    ./build.sh --version "${pkgver}" --prefix /usr package

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
        install_pkg

    install -Dm 0644 "${srcdir}/maddy-${pkgver}-src/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm 0644 "${srcdir}/maddy.sysusers" "${pkgdir}/usr/lib/sysusers.d/maddy.conf"
    install -Dm 0644 "${srcdir}/maddy.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/maddy.conf"
}
