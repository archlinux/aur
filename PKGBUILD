# Maintainer: Maarten de Boer <maarten@cloudstek.nl>

pkgname=teleport
pkgver=6.2.0
pkgrel=2
pkgdesc="Modern SSH server for teams managing distributed infrastructure"
arch=('i386' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/gravitational/teleport"
license=('Apache')
depends=()
makedepends=('go>=1.14.0')
provides=('tctl' 'tsh')
install=teleport.install

_webassets_ref=8c2812c169fa6bd5f31c13160bd93ef8b317bbc9

source=("${pkgname}-${pkgver}.tar.gz::https://github.com/gravitational/teleport/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}-webassets-${_webassets_ref}.tar.gz::https://github.com/gravitational/webassets/archive/${_webassets_ref}.tar.gz"
        "teleport.service"
        "teleport@.service"
        "teleport.install")

sha256sums=('bf479d580dc0f9187493645b6e3aa7e5458e46ff4c632169fc688946a6265ba2'
            '14445b0864d759347c1f53dc144a346b1974b8ded49031d7f0b7227f5d49d407'
            '10ac25cea1b5c193d7f968ca28a1da0e54b847f29c2a0186b46fd853194be38a'
            '4bc17fdde981f91c5d9972ae0555ee5e8b63a6b67e007c28f83ada80823980fd'
            '367253397479419feb4572778f3bd5bbd573058070550bdbcf01d045efa6397a')

prepare() {
    mv "${srcdir}/${pkgname}-${pkgver}" "${srcdir}/${pkgname}"
    rm -Rf "${srcdir}/${pkgname}/webassets"
    mv "${srcdir}/webassets-${_webassets_ref}" "${srcdir}/${pkgname}/webassets"

    install -m755 -d "${srcdir}/go/src/github.com/gravitational"
    ln -sf "${srcdir}/${pkgname}" "${srcdir}/go/src/github.com/gravitational/teleport"
}

build() {
    export GOPATH="${srcdir}/go"

    # See: https://wiki.archlinux.org/index.php/Go_package_guidelines
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

    cd "${GOPATH}/src/github.com/gravitational/teleport"

    make

    rm -Rf "${srcdir}/go"
    unset GOPATH
}

package() {
    cd "${srcdir}/${pkgname}"

    # Install binaries
    install -Dm755 build/teleport "${pkgdir}/usr/bin/teleport"
    install -Dm755 build/tctl "${pkgdir}/usr/bin/tctl"
    install -Dm755 build/tsh "${pkgdir}/usr/bin/tsh"

    # Install services
    install -Dm644 ${srcdir}/teleport.service "${pkgdir}/usr/lib/systemd/system/teleport.service"
    install -Dm644 ${srcdir}/teleport@.service "${pkgdir}/usr/lib/systemd/system/teleport@.service"

    # Copy example files
    install -dm755 "${pkgdir}/usr/share/teleport"
    cp -r examples "${pkgdir}/usr/share/teleport/"
}
