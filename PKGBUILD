# Maintainer: Akari-chan <`echo YmJlZWRzaTRAYW5vbmFkZHkubWUK | base64 -d`>

pkgname=lsidups-git
_pkgname=${pkgname%-git}
pkgver=r99.7891cfc
pkgrel=1

pkgdesc='Find duplicates / similar images from your terminal and export them as list or json'
url='https://github.com/MahouShoujoMivutilde/lsidups'
arch=('x86_64' 'aarch64' 'i686')
license=('MIT')

makedepends=('git' 'go')

optdepends=('sxiv: visually compare images (lsidups -i dir | sxiv -i)'
            'imv: visually compare images (lsidups -i dir | imv)'
            'python-pillow: to make sorting in groups of duplicates smarter, see examples dir'
            'fd: for lsvdups script, see examples'
            'ffmpegthumbnailer: for lsvdups script, see examples')

source=("$pkgname::git+$url.git")
sha256sums=(SKIP)

provides=("$_pkgname")
conflicts=("$_pkgname")

pkgver() {
    cd "$srcdir/$pkgname"
    printf 'r%s.%s\n' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"

    CGO_ENABLED=0 go build \
        -trimpath \
        -ldflags "-s -w -X main.GitVersion=${pkgver}" \
        .
}

package() {
    cd "$srcdir/$pkgname"

    install -m 644 -D LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
    install -m 644 -D README.md "$pkgdir/usr/share/doc/$_pkgname/README.md"

    install -m 755 -D -t "$pkgdir/usr/bin" $_pkgname

    # can be used directly, but i expect those to be edited by end-user
    install -m 755 -D -t "$pkgdir/usr/share/doc/$_pkgname/examples" examples/*
}
