# Maintainer: Maarten de Boer <maarten@cloudstek.nl>

pkgname=teleport
pkgver=6.0.2
pkgrel=1
pkgdesc="Modern SSH server for teams managing distributed infrastructure"
arch=('i386' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/gravitational/teleport"
license=('Apache')
depends=('bash' 'python')
makedepends=('go>=1.14.0')
provides=('tctl' 'tsh')
install=teleport.install

_webassets_ref=69750d0b9b8bbc3f0b56dc41f036f6a9e295c62a

source=("${pkgname}.tar.gz::https://github.com/gravitational/teleport/archive/refs/tags/v${pkgver}.tar.gz"
        "${pkgname}-webassets.tar.gz::https://github.com/gravitational/webassets/archive/${_webassets_ref}.tar.gz"
        "teleport.service"
        "teleport@.service"
        "teleport.install")

sha256sums=('c08eb20ea4dd668c445522ddd96f220aebbd9b5d01209d2f87b4052b06aa36b2'
            'c2e2d71f95f163c15db42b8ea6811017d5dd7020bb416bbe864e3bdb8d2fdf7c'
            '10ac25cea1b5c193d7f968ca28a1da0e54b847f29c2a0186b46fd853194be38a'
            '4bc17fdde981f91c5d9972ae0555ee5e8b63a6b67e007c28f83ada80823980fd'
            'cff4e3c69677210bdde9a781146df06fba3a62cef72ed6854cd1923a05444435')

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
