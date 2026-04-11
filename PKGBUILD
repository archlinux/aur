# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Kamil Bączkowski <me@kavela.ch>
# Contributor: Guillaume BOEHM <aur@mail.gboehm.com>

_gitname=pywal16
pkgname=python-${_gitname}
pkgver=3.8.15
pkgrel=1
epoch=1
_dirname=${_gitname}-${pkgver}
_archive_name=${_gitname}-${pkgver}-${pkgrel}-${epoch}.tar.gz
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
source=("${_archive_name}::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('cd3e4588c453b844dd222d861b52b7a7c88a3396b3e104300ef1db27b9492b1d')

prepare() {
  cd "$srcdir/${_dirname}"
  echo "removing support for the discontinued schemer2 which has no license..."
  rm -v 'pywal/backends/schemer2.py'
}

build() {
  cd "$srcdir/${_dirname}"
  python setup.py build
}

package() {
  cd "$srcdir/${_dirname}"
  export PYTHONHASHSEED=0
  python setup.py install --prefix=/usr --root="$pkgdir/" --optimize=1 --skip-build

  install -Dm644 LICENSE.md -t "$pkgdir/usr/share/licenses/$pkgname"
}
