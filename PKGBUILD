
_pkgname="baca-ereader"
pkgname="$_pkgname-git"
pkgver=0.1.13.r0.g7bc856f
pkgrel=1
pkgdesc="TUI Ebook Reader"
arch=('any')
url="https://github.com/wustho/baca"
license=("GPL3")
provides=("$_pkgname")
conflicts=(${provides[@]})
depends=(
  'python-appdirs'
  'python-beautifulsoup4'
  'python-fuzzywuzzy'
  'python-peewee'
  'python-rich'

  # AUR
  'python-markdownify'
  'python-textual'
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
  "baca_fit.png"::"https://user-images.githubusercontent.com/43810055/227891952-45df1c36-5113-4793-84b6-249725d3ba19.png"
  "pretty_yes_no_cap.png"::"https://user-images.githubusercontent.com/43810055/228417623-ac78fb84-0ee0-4930-a843-752ef693822d.png"
)
sha256sums=(
  'SKIP'
  '0ba4c5e919d4db2704b7810c7790b2a73d8367e0db983a64cc7fa292c1ba1dd8'
  '4039932020078108773333842b308f1b3f34af6bcb4ac9a54649ada5ace18c90'
)

prepare() {
  cd "$srcdir/$_pkgname"

  _images=(
    "baca_fit"
    "pretty_yes_no_cap"
  )
  for i in ${_images[@]} ; do
    sed -Ei -e "s@\\!\\[$image\\]\\([^\\)]+\\)@![$image]($image.png)@" "README.md"
  done
}

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"

  python -m build --no-isolation --wheel
}

package() {
  cd "$srcdir/$_pkgname"

  python -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" "README.md"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" "$srcdir/baca_fit.png"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" "$srcdir/pretty_yes_no_cap.png"

  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "LICENSE"
}
