# Maintainer: Albin Larsson <mail@albinlarsson.com>
# Contributor: Aleksandr Gornostal <ulauncher.app@gmail.com>

# To install, run `makepkg -is`

pkgname=ulauncher-revived-git
pkgver=DEV
pkgrel=1
pkgdesc='Application launcher for Linux'
arch=('any')
url="https://github.com/friday/Ulauncher-Revived"
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
source=("ulauncher::git+https://github.com/friday/Ulauncher-Revived.git")

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
  python setup.py build
  ./ul build-preferences
}

check() {
  cd ulauncher
  desktop-file-validate "build/share/applications/ulauncher.desktop"
}

package() {
  cd ulauncher

  install -Dm644 "build/share/applications/ulauncher.desktop" -t \
        "$pkgdir/usr/share/applications"
  
  export PYTHONHASHSEED=0
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  install -Dm644 "contrib/systemd/ulauncher.service" -t "$pkgdir/usr/lib/systemd/user"
  find $pkgdir -type d -name __pycache__ | xargs rm -rf
}
