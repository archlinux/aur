# Maintainer: Ephemeral <theepehemral.txt@gmail.com>

# shellcheck disable=SC2034
_pkgname=waybar-lyric
pkgname=${_pkgname}-git
pkgver=0.14.1.r0.g0f6b7c1
pkgrel=1
pkgdesc="A waybar module for song lyric"
arch=('x86_64')
url="https://github.com/Nadim147c/waybar-lyric"
license=('AGPL-3.0-only')
makedepends=('go' 'git')
provides=("$_pkgname")
conflicts=("$_pkgname" "${_pkgname}-bin")
depends=("glibc")
source=("${_pkgname}::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}" || exit

    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/${_pkgname}" || exit

    env GOPATH="$srcdir/go" \
        GOCACHE="$srcdir/go-cache" \
        GOMODCACHE="$srcdir/go/pkg/mod" \
        GOENV=off \
        CGO_ENABLED=0 \
        VERSION="$pkgver" \
        make build
}

package() {
    cd "$srcdir/${_pkgname}" || exit
    make install PREFIX="$pkgdir/usr/"
}
