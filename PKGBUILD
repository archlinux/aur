# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=gtkcord4
_fqpn=so.libdb.${pkgname}
pkgver=0.0.18
pkgrel=1
pkgdesc='Discord client written in go and gtk4'
arch=('x86_64' 'aarch64')
url='https://github.com/diamondburned/gtkcord4'
license=('GPL-3.0-only')
depends=('gtk4>=4.10.3' 'gobject-introspection' 'libadwaita>=1.3.2'
    'hicolor-icon-theme' 'gdk-pixbuf2' 'glib2' 'pango' 'cairo' 'glibc'
    'gcc-libs' 'graphene')
provides=('gtkcord4')
conflicts=('gtkcord4')
makedepends=('git' 'go>=1.20.3')
source=("git+https://github.com/diamondburned/gtkcord4#tag=v${pkgver}")
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
    sed -i "s/Chat;/Chat;InstantMessaging;/" "${srcdir}/${pkgname}/nix/${_fqpn}.desktop"
    install -Dm644 "${srcdir}/${pkgname}/nix/${_fqpn}.desktop" "${pkgdir}/usr/share/applications/${_fqpn}.desktop"
    install -Dm644 "${srcdir}/${pkgname}/${_fqpn}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${_fqpn}.metainfo.xml"
    install -Dm644 "${srcdir}/${pkgname}/.github/logo.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/gtkcord4.png"
    install -Dm644 "${srcdir}/${pkgname}/internal/icons/hicolor/scalable/apps/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/gtkcord4.svg"
    install -Dm644 "${srcdir}/${pkgname}/nix/${_fqpn}.service" "${pkgdir}/usr/share/dbus-1/services/${_fqpn}.service"
}

