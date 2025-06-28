# Maintainer: Matt Quintanilla <matt @ matt quintanilla . xyz>
# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Kamil Bączkowski <me@kavela.ch>

_gitname=pywal16
pkgname=python-${_gitname}-git
pkgver=r1317.62c3c02
pkgrel=1
pkgdesc='Generate and change color-schemes on the fly (fork that uses 16 colors)'
arch=('any')
url="https://github.com/eylles/${_gitname}"
license=('MIT')
depends=(
  'imagemagick'
  'python-colorama'
  'python-setuptools'
  'procps'  # part of Arch 'base', but better to define all direct deps
  'python'
  'sh'      # bash is part of Arch 'base', but better to define all direct deps
)
makedepends=(
  'git'
  'python-setuptools'
)
optdepends=(
  'colorz: alternative color backend'
  'python-colorthief: alternative color backend'
  'python-fast-colorthief: alternative color backend (faster fork of colorthief)'
  'python-haishoku: alternative color backend'
  'xorg-xrdb: save colors to X db for new terminals to use'
  'bspwm: reload bspwm colors'
  'i3-wm: reload i3 colors'
  'kitty: reload kitty colors'
  'polybar: reload polybar colors'
  'python2: reload GTK2 themes'
  'sway: reload sway colors'
  "feh: set wallpaper for X (pywal's #1 choice)"
  "xwallpaper: set wallpaper for X (pywal's #2 choice)"
  "nitrogen: set wallpaper for X (pywal's #3 choice)"
  "bgs: set wallpaper for X (pywal's #4 choice)"
  "hsetroot: set wallpaper for X (pywal's #5 choice)"
  "habak: set wallpaper for X (pywal's #6 choice)"
  "imagemagick: set wallpaper for X (pywal's #7 fallback choice)"
)
provides=(
  'pywal'
  'python-pywal'
  'python-pywal16'
)
conflicts=(
  'pywal'
  'python-pywal'
  'python-pywal16'
)
source=(${pkgname}::git+${url})
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


prepare() {
  cd "$srcdir/${pkgname}"
  echo "removing support for the discontinued schemer2 which has no license..."
  rm -v 'pywal/backends/schemer2.py'
}

build() {
  cd "$srcdir/${pkgname}"
  python setup.py build
}

package() {
  cd "$srcdir/${pkgname}"
  export PYTHONHASHSEED=0
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build

  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}

