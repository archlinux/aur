# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=gtkcord4-git
_pkgname=gtkcord4
_fqpn=so.libdb.${_pkgname}
pkgver=r280.9c86416
pkgrel=1
pkgdesc='Discord client written in go and gtk4'
arch=('x86_64' 'aarch64')
url='https://github.com/diamondburned/gtkcord4'
license=('GPL3')
depends=('gtk4' 'gobject-introspection' 'libadwaita')
provides=('gtkcord4')
conflicts=('gtkcord4')
makedepends=('git' 'go')
source=('git+https://github.com/diamondburned/gtkcord4'
        "${_fqpn}.service")
sha256sums=('SKIP'
            'f57c464e1aaa9eab28f6303fdff43a5c1299b27278948769a3d24009213aa105')

pkgver() {
    cd "${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${_pkgname}"
    mkdir -p build
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
    sed -i "s/Chat;/Chat;InstantMessaging;/" "${srcdir}/${_pkgname}/nix/${_fqpn}.desktop"
    install -Dm644 "${srcdir}/${_pkgname}/nix/${_fqpn}.desktop" "${pkgdir}/usr/share/applications/${_fqpn}.desktop"
    install -Dm644 "${srcdir}/${_pkgname}/${_fqpn}.metainfo.xml" "${pkgdir}/usr/share/metainfo/${_fqpn}.metainfo.xml"
    install -Dm644 "${srcdir}/${_pkgname}/.github/logo.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/gtkcord4.png"
    install -Dm644 "${srcdir}/${_pkgname}/internal/icons/hicolor/scalable/apps/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/gtkcord4.svg"
    install -Dm644 "${srcdir}/${_fqpn}.service" "${pkgdir}/usr/share/dbus-1/services/${_fqpn}.service"
}

