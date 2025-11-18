# Maintainer: Albin Larsson <mail@albinlarsson.com>
# Contributor: Aleksandr Gornostal <ulauncher.app@gmail.com>

# To install, run `makepkg -is`

pkgname=ulauncher-git
pkgver=DEV
pkgrel=7
pkgdesc='Application launcher for Linux'
arch=('any')
url="http://ulauncher.io"
license=('GPL3')
depends=('gtk3' 'python>=3.8' 'python-cairo' 'python-gobject')
makedepends=('git' 'python-setuptools' 'python-pip' 'python-wheel' 'make')
checkdepends=('desktop-file-utils')
optdepends=(
  'gtk-layer-shell: wayland layer shell integration'
  # Note: python-xlib is not used directly, but needed by EWMH, which is vendored
  'python-xlib: support for raising running apps (x11 only)'
  'libappindicator-gtk3: tray icon support (x11 or wayland)'
  'xapp: alternative tray icon library that supports single click to activate (x11 only)'
  'python-levenshtein: faster fuzzy search'
)
install="ulauncher.install"
provides=("ulauncher")
conflicts=("ulauncher")
source=("ulauncher::git+https://github.com/Ulauncher/Ulauncher.git")

sha256sums=('SKIP')

pkgver() {
  cd ulauncher || exit
  git describe --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ulauncher || exit
  # override the version to include the git commit ref
  echo "version = '$pkgver'" >> ulauncher/__init__.py
  env PATH="$(getconf PATH)" python -m pip wheel --no-build-isolation --no-deps .
}

check() {
  cd ulauncher || exit
  desktop-file-validate "io.ulauncher.Ulauncher.desktop"
}

package() {
  cd ulauncher || exit
  export PYTHONHASHSEED=0
  env PATH="$(getconf PATH)" python -m pip install --root-user-action=ignore --ignore-installed --root="$pkgdir" --prefix=/usr --no-deps *.whl
  find $pkgdir -type d -name __pycache__ | xargs rm -rf
}
