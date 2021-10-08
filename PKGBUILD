# Maintainer: Albin Larsson <mail@albinlarsson.com>
# Contributor: Aleksandr Gornostal <ulauncher.app@gmail.com>

# To install, run `makepkg -is`

pkgname=ulauncher-git
pkgver=DEV
pkgrel=1
pkgdesc='Application launcher for Linux'
arch=('any')
url="http://ulauncher.io"
license=('GPL3')
depends=('gobject-introspection-runtime' 'libkeybinder3' 'gtk3' 'webkit2gtk' 'libnotify'
         'gdk-pixbuf2' 'python-dbus' 'python-levenshtein' 'python-pyinotify'
         'python-websocket-client' 'python-pyxdg' 'python-gobject' 'python-cairo')
makedepends=('git' 'yarn' 'python-setuptools' 'python-distutils-extra')
checkdepends=('desktop-file-utils')
optdepends=('libappindicator-gtk3: tray icon' 'wmctrl: fix window focus on Wayland')
install="ulauncher.install"
provides=("ulauncher")
conflicts=("ulauncher")
source=("ulauncher::git+https://github.com/Ulauncher/Ulauncher.git")

sha256sums=('SKIP')

pkgver() {
  cd ulauncher
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd ulauncher
  sed -i "s/%VERSION%/${pkgver%.*.*}/g" setup.py
  find -iname "*.py" | xargs sed -i 's=\(^#! */usr/bin.*\)python3 *$=\1python='
}

build() {
  cd ulauncher
  env PATH=$(getconf PATH) python setup.py build
  ./ul build-preferences
}

check() {
  cd ulauncher
  desktop-file-validate "build/share/applications/ulauncher.desktop"
}

package() {
  cd ulauncher
  export PYTHONHASHSEED=0
  env PATH=$(getconf PATH) python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  rm -rf "$pkgdir"/usr/share/ulauncher/preferences/{no*,src,bow*,gul*,pack*}
  find $pkgdir -type d -name __pycache__ | xargs rm -rf
}
