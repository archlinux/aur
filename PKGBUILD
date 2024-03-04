# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=dissent-git
_pkgname=dissent
_fqpn=so.libdb.${_pkgname}
pkgver=r466.8d59853
pkgrel=1
pkgdesc='Discord client written in go and gtk4'
arch=('x86_64' 'aarch64')
url='https://github.com/diamondburned/dissent'
license=('GPL-3.0-only')
depends=('gtk4' 'gobject-introspection' 'libadwaita' 'graphene' 'glibc' 'glib2'
    'cairo' 'gcc-libs' 'gdk-pixbuf2' 'pango' 'hicolor-icon-theme')
provides=('dissent')
conflicts=('dissent')
makedepends=('git' 'go')
source=('git+https://github.com/diamondburned/dissent')
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${_pkgname}"
    mkdir -p build
    sed -i "s/so.libdb.Dissent/so.libdb.Dissent.Devel/" "${srcdir}/${_pkgname}/nix/${_fqpn}.desktop"
}

build() {
    cd "${_pkgname}"
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
    cd "${_pkgname}/build"
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    install -Dm644 "${srcdir}/${_pkgname}/nix/${_fqpn}.desktop" "${pkgdir}/usr/share/applications/${_fqpn}.desktop"
    install -Dm644 "${srcdir}/${_pkgname}/${_fqpn}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${_fqpn}.metainfo.xml"
    cp -r "${srcdir}/${_pkgname}/internal/icons/hicolor/" "${pkgdir}/usr/share/icons/"
    cp -r "${srcdir}/${_pkgname}/internal/icons/scalable/" "${pkgdir}/usr/share/icons/hicolor/"
    cp -r "${srcdir}/${_pkgname}/internal/icons/symbolic/" "${pkgdir}/usr/share/icons/hicolor/"
    install -Dm644 "${srcdir}/${_pkgname}/nix/${_fqpn}.service" "${pkgdir}/usr/share/dbus-1/services/${_fqpn}.service"
}

