# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Kamil Bączkowski <me@kavela.ch>

pkgname=pywal-16-colors
_gitname=pywal16
pkgver=3.5.0
pkgrel=1
epoch=1
pkgdesc='Generate and change color-schemes on the fly (fork that uses 16 colors)'
arch=('any')
url="https://github.com/eylles/${_gitname}"
license=('MIT')
depends=(
  'imagemagick'
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
)
conflicts=(
  'pywal'
  'python-pywal'
)
source=("git+$url.git#tag=$pkgver")
b2sums=('SKIP')

prepare() {
  cd "$srcdir/${_gitname}"
  echo "removing support for the discontinued schemer2 which has no license..."
  rm -v 'pywal/backends/schemer2.py'
}

build() {
  cd "$srcdir/${_gitname}"
  python setup.py build
}

check() {
  cd "$srcdir/${_gitname}"
  python setup.py test
}

package() {
  cd "$srcdir/${_gitname}"
  export PYTHONHASHSEED=0
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build

  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
