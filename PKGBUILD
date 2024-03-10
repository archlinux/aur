# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=dissent
_fqpn=so.libdb.${pkgname}
pkgver=0.0.21
pkgrel=1
pkgdesc='Discord client written in go and gtk4'
arch=('x86_64' 'aarch64')
url='https://github.com/diamondburned/dissent'
license=('GPL-3.0-only')
depends=('gtk4>=4.10.3' 'gobject-introspection' 'libadwaita>=1.3.2'
    'hicolor-icon-theme' 'gdk-pixbuf2' 'glib2' 'pango' 'cairo' 'glibc'
    'gcc-libs' 'graphene')
provides=('dissent')
conflicts=('dissent')
makedepends=('git' 'go>=1.20.3')
source=("git+https://github.com/diamondburned/dissent#tag=v${pkgver}")
sha256sums=('SKIP')

prepare() {
    cd "${pkgname}"
    mkdir -p build
}

build() {
    cd "${pkgname}"
    # https://wiki.archlinux.org/index.php/Go_package_guidelines
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOPATH="${srcdir}/go"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build
}

package() {
    cd "${pkgname}/build"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${pkgname}/nix/${_fqpn}.desktop" "${pkgdir}/usr/share/applications/${_fqpn}.desktop"
    install -Dm644 "${srcdir}/${pkgname}/${_fqpn}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${_fqpn}.metainfo.xml"
    cp -r "${srcdir}/${pkgname}/internal/icons/hicolor/" "${pkgdir}/usr/share/icons/"
    cp -r "${srcdir}/${pkgname}/internal/icons/scalable/" "${pkgdir}/usr/share/icons/hicolor/"
    cp -r "${srcdir}/${pkgname}/internal/icons/symbolic/" "${pkgdir}/usr/share/icons/hicolor/"
    install -Dm644 "${srcdir}/${pkgname}/nix/${_fqpn}.service" "${pkgdir}/usr/share/dbus-1/services/${_fqpn}.service"
}

