# Maintainer: fossdd <fossdd@tutanota.com>
pkgname=gtranslate-git
_pkgname=${pkgname%-git}
pkgver=r44.b0c5f2c
pkgrel=1
pkgdesc="Better front-end for Google Translate"
url='https://sr.ht/~yerinalexey/gtranslate'
license=(GPL-3.0)
arch=(x86_64)
depends=()
makedepends=(go)
conflicts=()
provides=(gtranslate)
source=("git+https://git.sr.ht/~yerinalexey/gtranslate")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$srcdir"
  patch --verbose --ignore-whitespace --fuzz 3 --forward --strip=1 --input="../default-directories.patch"
}

build() {
  cd "$_pkgname"
  go build
}

package() {
  cd "$_pkgname"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "static/style.css" "$pkgdir/usr/local/share/$_pkgname/static/style.css"
  install -Dm644 "templates/error.html" "$pkgdir/usr/local/share/$_pkgname/templates/error.html"
  install -Dm644 "templates/index.html" "$pkgdir/usr/local/share/$_pkgname/templates/index.html"
}
