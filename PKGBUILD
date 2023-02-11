# Maintainer: Alisson Lauffer <alissonvitortc@gmail.com>
# Co-Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=gtkcord4-libadwaita-git
_pkgname=gtkcord4
pkgver=r176.e20b928
pkgrel=1
pkgdesc='Discord client written in go and gtk4 (with libadwaita)'
arch=('x86_64' 'aarch64')
url='https://github.com/diamondburned/gtkcord4'
license=('GPL3')
depends=('gtk4' 'gobject-introspection' 'libadwaita')
provides=('gtkcord4')
conflicts=('gtkcord4')
makedepends=('git' 'go')
source=('git+https://github.com/diamondburned/gtkcord4')
sha256sums=('SKIP')

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
    go build -o build -tags libadwaita
}

package() {
    cd "${_pkgname}/build"
    install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
    install -Dm644 "${srcdir}/${_pkgname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
    sed -i "s/Chat;/Chat;InstantMessaging;/" "${srcdir}/${_pkgname}/nix/xyz.diamondb.gtkcord4.desktop"
    install -Dm644 "${srcdir}/${_pkgname}/nix/xyz.diamondb.gtkcord4.desktop" "${pkgdir}/usr/share/applications/gtkcord4.desktop"
    install -Dm644 "${srcdir}/${_pkgname}/xyz.diamondb.gtkcord4.metainfo.xml" "${pkgdir}/usr/share/metainfo/gtkcord4.metainfo.xml"
    install -Dm644 "${srcdir}/${_pkgname}/internal/icons/png/logo.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/gtkcord4.png"
    install -Dm644 "${srcdir}/${_pkgname}/internal/icons/svg/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/gtkcord4.png"
}
