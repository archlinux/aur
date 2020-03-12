# $Id$
# Maintainer: Max Mazurov <fox.cpp at disroot dot org>
# Contributor: Jonas Heinrich <onny@project-insantiy.org>
# Contributor: Max Mazurov <fox.cpp at disroot dot org>
pkgname='maddy'
pkgver=0.1.1
pkgrel=1
pkgdesc='Composable all-in-one mail server'
arch=('x86_64')
url='https://github.com/foxcpp/maddy'
license=('MIT')
depends=('glibc')
makedepends=('go' 'git' 'scdoc')
source=(
    "${pkgname}-${pkgver}.tar.zst::https://github.com/foxcpp/maddy/releases/download/v${pkgver}/maddy-v${pkgver}-src.tar.zst"
    "${pkgname}-${pkgver}.tar.zst.asc::https://github.com/foxcpp/maddy/releases/download/v${pkgver}/maddy-v${pkgver}-src.tar.zst.asc"
    '0001-build.sh-Fix-ensure_go-routine-to-handle-missing-pat.patch'
    '0002-build.sh-Remove-PKGDIR-cleanup.patch'
    'maddy.sysusers'
    'maddy.tmpfiles'
)
backup=('etc/maddy/maddy.conf')
sha512sums=(
    '355ba95c7b9bcad3b0e20c41755b1332dba3f0489e1e7c3640b1df32c70efe9ab86129336ecfe6bff330267d916aac021dedf06ad9489e994250cca98607a874'
    'SKIP'
    'd688f26186cfb8447797041c8d804901f925d3b6a7ea38b3d8708c1fa3718f167146e1c45078609344bc641ca9eb56ad9d4bd19822c9a84b1f0842d8a6b9da94'
    'c0bdbd9ff8443416619b611446c03542fca7cce39ed9b09481377262d61f026af60bc4b23641c58ee2a3a49662d540a4d4d3b04ce0e8247e38080f3c02ed433e'
    '750346110adb8caa61f537560018497f73543dc01ff26aceed2f052f281a35fdc659c9c478cc55775eadf8a3d17b511d5bed86334d1c455732dcb9a273120589'
    'f33135b81129d6ef3006d8e9f410ec0d7e44226ae640dea77d756268d0e97828d8965ac75d0d9b49604a19b8b9e0384d15007d33c4b813f359108d28a10702b5'
)
validpgpkeys=('3197BBD95137E682A59717B434BB2007081396F4')

prepare() {
    cd "${srcdir}/maddy-v${pkgver}-src"

    # XXX: Remove for 0.2.0.
    patch -Np1 -i ../0001-build.sh-Fix-ensure_go-routine-to-handle-missing-pat.patch
    patch -Np1 -i ../0002-build.sh-Remove-PKGDIR-cleanup.patch
}

build() {
    export GOPATH="$PWD/gopath"
    cd "${srcdir}/maddy-v${pkgver}-src"

    ./build.sh --version "v${pkgver}" --prefix /usr package
}

check() {
    export GOPATH="$PWD/gopath"
    cd "${srcdir}/maddy-v${pkgver}-src"

    # There is one racy test in 0.1.1 that breaks from time to time.
    # XXX: Reenable for 0.2.0.
    #go test ./...

    cd tests/
    ./run.sh
}

package() {
    export GOPATH="$PWD/gopath"
    cd "${srcdir}/maddy-v${pkgver}-src"

    ./build.sh \
        --version "v${pkgver}" \
        --prefix /usr \
        --destdir "${pkgdir}" \
        install_pkg

    install -Dm 0644 "${srcdir}/maddy.sysusers" "${pkgdir}/usr/lib/sysusers.d/maddy.conf"
    install -Dm 0644 "${srcdir}/maddy.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/maddy.conf"
}
