# Maintainer: xiota / aur.chaotic.cx

_pkgname="baca-ereader"
pkgname="$_pkgname-git"
pkgver=0.1.16.r1.gd32fb2f
pkgrel=2
pkgdesc="TUI Ebook Reader"
arch=('any')
url="https://github.com/wustho/baca"
license=("GPL3")

provides=("$_pkgname")
conflicts=("$_pkgname")

depends=(
  'python-appdirs'
  'python-beautifulsoup4'
  'python-fuzzywuzzy'
  'python-peewee'
  'python-rich'

  # AUR
  'python-climage'
    # 'python-kdtree'
  'python-markdownify'
  'python-textual'
)
makedepends=(
  'git'
  'pandoc' # convert readme to epub
  'python-build'
  'python-importlib-metadata' # prepare
  'python-installer'
  'python-poetry-core'
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

  # fix docs
  _images=(
    "baca_fit"
    "pretty_yes_no_cap"
  )
  for i in ${_images[@]} ; do
    sed -Ei -e "s@\\!\\[$image\\]\\([^\\)]+\\)@![$image]($image.png)@" "README.md"
  done

  # convert readme to epub
  pandoc -t epub --metadata title="Baca eReader Readme" -o README.epub README.md

  # textual > 0.16.0 mouse scrolling glitch
  # https://github.com/wustho/baca/issues/10
  local _textual_version=$(python -c 'from importlib.metadata import version; print(version("textual"))')
  if [[ $(vercmp "$_textual_version" 0.16.0) -gt 0 ]] ; then
    sed -E -e 's@^(\s*self)\.screen\.(scroll_(up|down))@\1.\2@g' \
      -i "src/baca/components/contents.py"
  fi

  # AttributeError: module 'climage.climage' has no attribute '_color_types'
  # https://github.com/wustho/baca/issues/13
  local _climage_version=$(python -c 'from importlib.metadata import version; print(version("climage"))')
  if [[ $(vercmp "$_climage_version" 0.2.0) -ge 0 ]] ; then
    sed -E -e 's@climage\._color_types@climage.color_types@g' \
      -i  "src/baca/components/contents.py"
  fi
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

  # documents
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" "README.md"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" "README.epub"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" "$srcdir/baca_fit.png"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" "$srcdir/pretty_yes_no_cap.png"

  # license
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "LICENSE"
}
