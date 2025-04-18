# Maintainer: xiota / aur.chaotic.cx
# Contributor: Benawi Adha <benawiadha@gmail.com>
# Contributor: Spencer Muise <smuise@spencermuise.ca>

_pkgname="epy-ereader"
pkgname="$_pkgname-git"
pkgver=2023.6.11.r0.g6b0e9fe
pkgrel=3
pkgdesc="CLI Ebook Reader"
url='https://github.com/wustho/epy'
license=('GPL-3.0-only')
arch=('any')

depends=(
  'python'
  'python-imghdr'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-poetry'
  'python-wheel'
)

provides=(
  "$_pkgname"
  'epy'
)
conflicts=(
  "$_pkgname"
  'epy'
)

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$url.git"
  "screenshot.png"::"https://raw.githubusercontent.com/wustho/epy/master/screenshot.png"
  "image.png"::"https://user-images.githubusercontent.com/108401269/198876974-c8420de1-b256-42fd-9a09-3a69c5019608.png"
)
sha256sums=(
  'SKIP'
  'edb914542d56192ab1d9d4d9b60cab9785e19744651076021f7fd737bd12d9cf'
  '7c690a566598cb5ba1f2389860b95707b18f89e4cf45fe1bc049237eefbfd57e'
)

prepare() {
  cd "$_pkgsrc"
  for i in image screenshot; do
    sed -Ei -e "s@\\!\\[$image\\]\\([^\\)]+\\)@![$image]($image.png)@" "README.md"
  done
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 \
    | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 "README.md" -t "$pkgdir/usr/share/doc/$pkgname/"
  install -Dm644 "$srcdir"/{image,screenshot}.png -t "$pkgdir/usr/share/doc/$pkgname/"

  install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
