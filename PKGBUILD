# Maintainer: xiota / aur.chaotic.cx

_pkgname="baca-ereader"
pkgname="$_pkgname-git"
pkgver=0.1.17.r0.g13ee794
pkgrel=4
pkgdesc="TUI Ebook Reader"
url="https://github.com/wustho/baca"
license=("GPL-3.0-only")
arch=('any')

provides=("$_pkgname")
conflicts=(
  "$_pkgname"
  'baca' # baca-cli
)

depends=(
  'python-appdirs'
  'python-beautifulsoup4'
  'python-peewee'
  'python-rich'

  ## AUR
  'python-climage'
  # 'python-kdtree'
  'python-markdownify'
  'python-imghdr' # aur/python-deadlib
  'python-textual'
  'python-thefuzz'
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

_pkgsrc="$_pkgname"
source=(
  "$_pkgsrc"::"git+$url.git"
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
  for i in ${_images[@]}; do
    sed -Ei -e "s@\\!\\[$image\\]\\([^\\)]+\\)@![$image]($image.png)@" "README.md"
  done

  # convert readme to epub
  pandoc -t epub --metadata title="Baca eReader Readme" -o README.epub README.md

  # textual > 0.16.0 mouse scrolling glitch
  # https://github.com/wustho/baca/issues/10
  local _textual_version=$(python -c 'from importlib.metadata import version; print(version("textual"))')
  if [[ $(vercmp "$_textual_version" 0.16.0) -gt 0 ]]; then
    sed -E -e 's@^(\s*self)\.screen\.(scroll_(up|down))@\1.\2@g' \
      -i "src/baca/components/contents.py"
  fi

  # markdownify >= 1.0.0 perpetual wait for image conversion
  local _markdownify_version=$(python -c 'from importlib.metadata import version; print(version("markdownify"))')
  if [[ $(vercmp "$_markdownify_version" 1.0.0) -ge 0 ]]; then
    sed -E -e '/convert_img/s@convert_as_inline@parent_tags@' \
      -i "src/baca/utils/html_parser.py"
  fi
}

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgsrc"
  python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
  cd "$_pkgsrc"
  python -m installer --destdir="$pkgdir" dist/*.whl

  # documents
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" "README.md"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" "README.epub"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" "$srcdir/baca_fit.png"
  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" "$srcdir/pretty_yes_no_cap.png"
}
