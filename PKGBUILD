# Maintainer: txtsd <aur.archlinux@ihavea.quest>

pkgname=gtkcord4
pkgver=0.0.9
pkgrel=1
pkgdesc='Discord client written in go and gtk4'
arch=('x86_64' 'aarch64')
url='https://github.com/diamondburned/gtkcord4'
license=('GPL3')
depends=('gtk4' 'gobject-introspection')
provides=('gtkcord4')
conflicts=('gtkcord4')
makedepends=('git' 'go')
source=("git+https://github.com/diamondburned/gtkcord4#tag=v${pkgver}")
sha256sums=('SKIP')

build() {
    # add config flags per https://wiki.archlinux.org/index.php/Go_package_guidelines
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -modcacherw"

    # check if user has already set their GoLang path
    if [[ -z "${GOPATH}" ]]; then
        export GOPATH="${srcdir}/go"
    fi
    cd "${pkgname}"
    go mod tidy
    go build -trimpath
}

package() {
    cd "${pkgname}"
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 "${srcdir}/${pkgname}/LICENSE.md" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    sed -i "s/Chat;/Chat;InstantMessaging;/" "${srcdir}/${pkgname}/nix/xyz.diamondb.gtkcord4.desktop"
    install -Dm644 "${srcdir}/${pkgname}/nix/xyz.diamondb.gtkcord4.desktop" "${pkgdir}/usr/share/applications/gtkcord4.desktop"
    install -Dm644 "${srcdir}/${pkgname}/xyz.diamondb.gtkcord4.metainfo.xml" "${pkgdir}/usr/share/metainfo/gtkcord4.metainfo.xml"
    install -Dm644 "${srcdir}/${pkgname}/internal/icons/png/logo.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/gtkcord4.png"
    install -Dm644 "${srcdir}/${pkgname}/internal/icons/svg/logo.svg" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/gtkcord4.png"
}

