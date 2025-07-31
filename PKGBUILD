# Maintainer: Albin Larsson <mail@albinlarsson.com>
# Contributor: Aleksandr Gornostal <ulauncher.app@gmail.com>

# To install, run `makepkg -is`

pkgname=ulauncher-git
pkgver=DEV
pkgrel=6
pkgdesc='Application launcher for Linux'
arch=('any')
url="http://ulauncher.io"
license=('GPL3')
# Note: python-xlib is not used directly, but needed by EWMH, which is vendored
depends=('gtk3' 'webkit2gtk-4.1' 'python>=3.8' 'python-cairo' 'python-gobject' 'python-xlib')
makedepends=('git' 'python-setuptools' 'python-pip' 'python-wheel' 'make' 'nodejs' 'yarn')
checkdepends=('desktop-file-utils')
optdepends=('gtk-layer-shell: wayland layer shell integration' 'xapp: tray icon library - single click support' 'libappindicator-gtk3: tray icon library' 'python-levenshtein: fuzzy search performance')
install="ulauncher.install"
provides=("ulauncher")
conflicts=("ulauncher")
source=("ulauncher::git+https://github.com/Ulauncher/Ulauncher.git")

sha256sums=('SKIP')

build() {
  cd ulauncher || exit
  make prefs
  env PATH="$(getconf PATH)" python -m pip wheel --no-build-isolation --no-deps .
}

check() {
  cd ulauncher || exit
  desktop-file-validate "io.ulauncher.Ulauncher.desktop"
}

pkgver() {
  cd ulauncher || exit
  git describe --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd ulauncher || exit
  export PYTHONHASHSEED=0
  env PATH="$(getconf PATH)" python -m pip install --root-user-action=ignore --ignore-installed --root="$pkgdir" --prefix=/usr --no-deps *.whl
  find $pkgdir -type d -name __pycache__ | xargs rm -rf
}
