# Maintainer:

_fontname="twemoji"
_pkgname="ttf-$_fontname"
pkgname="$_pkgname-git"
pkgver=15.1.0.r5.ga6909cf5
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

source=(
  'jdecked.twemoji'::'git+https://github.com/jdecked/twemoji.git'
  'git+https://github.com/13rac1/twemoji-color-font.git'
  'git+https://github.com/13rac1/scfbuild.git'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "jdecked.twemoji"
  git describe --long --tags --abbrev=7 --exclude='*[a-zA-Z][a-zA-Z]*' \
    | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "twemoji-color-font"
  ln -s "$srcdir/scfbuild" SCFBuild

  rm -r "assets/twemoji-svg"
  mv "$srcdir/jdecked.twemoji/assets/svg" "assets/twemoji-svg"

  sed -E -e 's&^(\s*)convert &\1magick &' \
    -e 's/package: regular-package linux-package deb-package macos-package windows-package/package: linux-package/' \
    -i Makefile
}

build() {
  cd "twemoji-color-font"
  sed -E 's&^(\s*VERSION :=) [0-9\.]+$&\1 '"${pkgver%%.r*}"'&' -i Makefile
  make
}

package() {
  cd "twemoji-color-font/build/TwitterColorEmoji-SVGinOT-Linux-${pkgver%%.r*}"
  install -Dm644 "TwitterColorEmoji-SVGinOT.ttf" -t "$pkgdir/usr/share/fonts/TTF/"
  install -Dm644 LICENSE* -t "$pkgdir/usr/share/licenses/$pkgname/"
}
