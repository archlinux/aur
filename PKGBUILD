# Maintainer: Albin Larsson <mail@albinlarsson.com>
# Contributor: Aleksandr Gornostal <ulauncher.app@gmail.com>

# To install, run `makepkg -is`

pkgname=ulauncher-git
pkgver=DEV
pkgrel=2
pkgdesc='Application launcher for Linux'
arch=('any')
url="http://ulauncher.io"
license=('GPL3')
depends=('gtk3' 'webkit2gtk-4.1' 'libnotify' 'libkeybinder3' 'libwnck3' 'python-cairo' 'python-gobject' 'python-levenshtein')
makedepends=('git' 'yarn' 'python-setuptools')
checkdepends=('desktop-file-utils')
optdepends=('libappindicator-gtk3: tray icon')
install="ulauncher.install"
provides=("ulauncher")
conflicts=("ulauncher")
source=("ulauncher::git+https://github.com/Ulauncher/Ulauncher.git")

sha256sums=('SKIP')

build() {
  cd ulauncher
  python setup.py build_prefs
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
