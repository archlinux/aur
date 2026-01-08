# Maintainer: Ephemeral <theepehemral.txt@gmail.com>

# shellcheck disable=SC2034
_pkgname=rong
pkgname=${_pkgname}-git
pkgver=4.2.1.r8.gb5481f6
pkgrel=1
pkgdesc="A Material You and Base16 color generator"
arch=('x86_64')
url="https://github.com/Nadim147c/rong"
license=('GPL-3.0-only')
makedepends=('go' "git" 'just')
provides=("$_pkgname")
conflicts=("${_pkgname}" "${_pkgname}-bin")
depends=("glibc" "ffmpeg")
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
        just build
}

package() {
    cd "$srcdir/${_pkgname}" || exit
    env PREFIX="$pkgdir/usr/" just install
}
