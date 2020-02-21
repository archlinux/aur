# maintainer: anton \ät semjonov.de

pkgname=updiprog-git
_pkgname=(${pkgname%-git})
pkgdesc="utility for programming AVR devices with UPDI interface using standard TTL serial port"

pkgver=v0.2.r2.3741ea7
pkgrel=2

arch=('x86_64')
url="https://github.com/Polarisru/$_pkgname"
license=('BSD')

depends=()
makedepends=('make' 'git')

provides=($_pkgname)
conflicts=($_pkgname)
source=(
  "$pkgname::git+$url.git"
  "Makefile"
  "001_trim_crlf_line_ending.patch"
)
sha256sums=(
  "SKIP"
  "8145eee13c59c4723ff3b8175c41ea860117fd4fd93cfd18dd176cb74d55cd8a"
  "96162427278f7403402c5c9436400f39af6dc00f015c9420cac8a05f466aa273"
)

pkgver() {
  cd "$pkgname"
  printf "%s" "$(git describe --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

prepare() {
  cd "$pkgname/"
  cp ../Makefile .
  patch --forward --strip=1 --input=../001_trim_crlf_line_ending.patch
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 LICENSE     "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

