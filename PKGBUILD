# Maintainer: ThatOneCalculator (Kainoa Kanter) <kainoakanter@gmail.com>
_pkgname="md4x"
pkgname="${_pkgname}-git"
pkgver=v0.0.25.r0.g86c249f
pkgrel=1
pkgdesc="Fast and small markdown parser and renderer"
arch=('any')
url="https://github.com/unjs/${_pkgname}"
license=('MIT')
depends=('glibc')
makedepends=('zig' 'git')
provides=("${_pkgname}")
conflicts=(
    "${_pkgname}"
    # "${_pkgname}-git"
    "${_pkgname}-bin"
)
source=("git+$url.git")
noextract=()
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${srcdir}/${_pkgname}" || exit
	zig build
}

package() {
    install -Dm755 "$srcdir/${_pkgname}/zig-out/bin/${_pkgname}" "$pkgdir/usr/bin/${_pkgname}"
    install -Dm644 "$srcdir/${_pkgname}"/LICENSE.md "$pkgdir/usr/share/doc/${_pkgname}"
    install -Dm644 "$srcdir/${_pkgname}"/README.md "$pkgdir/usr/share/doc/${_pkgname}"
}
