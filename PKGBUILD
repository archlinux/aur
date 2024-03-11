# Maintainer: Albin Larsson <mail@albinlarsson.com>
# Contributor: Aleksandr Gornostal <ulauncher.app@gmail.com>

# To install, run `makepkg -is`

pkgname=ulauncher-git
pkgver=DEV
pkgrel=4
pkgdesc='Application launcher for Linux'
arch=('any')
url="http://ulauncher.io"
license=('GPL3')
depends=('gtk3' 'webkit2gtk-4.1' 'python-cairo' 'python-gobject' 'python-xlib' 'python-levenshtein')
makedepends=('git' 'yarn' 'python-setuptools')
checkdepends=('desktop-file-utils')
optdepends=('gtk-layer-shell: wayland layer shell integration', 'xapp: tray icon with suport for single click', 'libappindicator-gtk3: tray icon')
install="ulauncher.install"
provides=("ulauncher")
conflicts=("ulauncher")
source=("ulauncher::git+https://github.com/Ulauncher/Ulauncher.git")

sha256sums=('SKIP')

build() {
  cd ulauncher
  make prefs
  env PATH=$(getconf PATH) python setup.py build
}

check() {
  cd ulauncher
  desktop-file-validate "io.ulauncher.Ulauncher.desktop"
}

package() {
  cd ulauncher
  export PYTHONHASHSEED=0
  env PATH=$(getconf PATH) python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  find $pkgdir -type d -name __pycache__ | xargs rm -rf
}
