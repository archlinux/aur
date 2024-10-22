# Maintainer:

_fontname="twemoji"
_pkgname="ttf-$_fontname"
pkgname="$_pkgname-git"
pkgver=15.1.0.r6.g0dfa4d0
pkgrel=1
pkgdesc="Unicode emoji color OpenType-SVG font"
url="https://github.com/jdecked/twemoji"
license=('CC-BY-4.0' 'MIT')
arch=('any')

makedepends=(
  'fontforge'
  'git'
  'imagemagick'
  'inkscape'
  'nodejs'
  'potrace'
  'python-fonttools'
  'python-setuptools'
  'python-yaml'
  'svgo'
)

provides=(
  'emoji-font'
  'ttf-twemoji'
  'ttf-twemoji-color'
)
conflicts=(
  'ttf-twemoji'
  'ttf-twemoji-color'
)

_pkgsrc="jdecked.twemoji"
_pkgsrc_tcf="13rac1.twemoji-color-font"
_pkgsrc_scf="13rac1.scfbuild"
source=(
  "$_pkgsrc"::"git+https://github.com/jdecked/twemoji.git"
  "$_pkgsrc_tcf"::"git+https://github.com/13rac1/twemoji-color-font.git"
  "13rac1.scfbuild"::"git+https://github.com/13rac1/scfbuild.git"
  '0001-fix-make-parallelism.patch'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  '5c92883010449928703763f82b1287cdb348862bf08d88c73f103389a626ece0'
)

pkgver() {
  cd "$_pkgsrc"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgsrc_tcf"
  ln -s "$srcdir/$_pkgsrc_scf" SCFBuild

  rm -r "assets/twemoji-svg"
  mv "$srcdir/$_pkgsrc/assets/svg" "assets/twemoji-svg"

  patch -Np1 -i '../0001-fix-make-parallelism.patch'
}

build() {
  cd "$_pkgsrc_tcf"
  sed -E 's&^(\s*VERSION :=) [0-9\.]+$&\1 '"${pkgver%%.r*}"'&' -i Makefile
  make -j8
}

package() {
  cd "$_pkgsrc_tcf/build/TwitterColorEmoji-SVGinOT-Linux-${pkgver%%.r*}"
  install -Dm644 "TwitterColorEmoji-SVGinOT.ttf" -t "$pkgdir/usr/share/fonts/TTF/"
  install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname/"
}
