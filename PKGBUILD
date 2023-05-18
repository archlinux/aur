# Maintainer:
# Contributor: Benawi Adha <benawiadha@gmail.com>
# Contributor: Spencer Muise <smuise@spencermuise.ca>

_pkgname=epy-ereader
pkgname="$_pkgname-git"
pkgver=r286.c7a87f3
pkgrel=1
pkgdesc="CLI Ebook Reader"
arch=('any')
url='https://github.com/wustho/epy'
license=("GPL3")
provides=("$_pkgname")
conflicts=(${provides[@]})
depends=(
  'python'
)
makedepends=(
  'git'
  'python-build'
  'python-installer'
  'python-poetry'
  'python-setuptools'
  'python-wheel'
)
source=(
  "$_pkgname"::"git+$url"

  "Downloads.png"::"https://static.pepy.tech/personalized-badge/epy-reader?period=month&units=none&left_color=grey&right_color=brightgreen&left_text=downloads/month"
  "screenshot.png"::"https://raw.githubusercontent.com/wustho/epy/master/screenshot.png"
  "image.png"::"https://user-images.githubusercontent.com/108401269/198876974-c8420de1-b256-42fd-9a09-3a69c5019608.png"
)
sha256sums=(
  'SKIP'
  'SKIP'

  'edb914542d56192ab1d9d4d9b60cab9785e19744651076021f7fd737bd12d9cf'
  '7c690a566598cb5ba1f2389860b95707b18f89e4cf45fe1bc049237eefbfd57e'
)

prepare() {
  cd "$srcdir/$_pkgname"

  _images=(
    "Downloads"
    "screenshot"
    "image"
  )
  for i in ${_images[@]} ; do
    sed -Ei -e "s@\\!\\[$image\\]\\([^\\)]+\\)@![$image]($image.png)@" "README.md"
  done
}

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"

  python -m build --no-isolation --wheel
}

package() {
  cd "$srcdir/$_pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" "README.md"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" "$srcdir/Downloads.png"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" "$srcdir/screenshot.png"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" "$srcdir/image.png"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "LICENSE"
}
