# Maintainer: Dawson Dias <thexerothermicsclerodermoid@gmail.com>

pkgname=gtkcord4-libadwaita-git
_pkgname=gtkcord4
pkgver=r89.1a27ce2
pkgrel=1
pkgdesc='Discord client written in go and gtk4'
arch=('any')
url='https://github.com/diamondburned/gtkcord4'
license=('GPL3')
depends=('gtk4' 'gobject-introspection')
provides=('gtkcord4')
conflicts=('gtkcord4')
makedepends=('git' 'go')
source=('git+https://github.com/diamondburned/gtkcord4'
        'gtkcord4.desktop')
sha256sums=('SKIP'
            '93a0b3698e44d2f4af3a9276b31ce0889b79858d5992e25af5bc1b258d8f2b88')

pkgver() {
    cd "$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    # add config flags as per https://wiki.archlinux.org/index.php/Go_package_guidelines
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -modcacherw"

    # check if user has already set their GoLang path
    if [[ -z "${GOPATH}" ]]; then
        export GOPATH="${srcdir}/go"
    fi
    cd "$_pkgname"
    go mod tidy
    go build -trimpath -tags libadwaita
}

package() {
    cd "$_pkgname"
    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    # install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    # install -Dm644 logo.png "$pkgdir/usr/share/icons/hicolor/256x256/apps/gtkcord.png"
}

