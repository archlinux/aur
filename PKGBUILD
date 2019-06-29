# Maintainer: Aleksandr Gornostal <ulauncher.app@gmail.com>

# To install, run `makepkg -is`

pkgname=ulauncher-git
pkgver=DEV
pkgrel=1
pkgdesc='Application launcher for Linux'
arch=('any')
url="http://ulauncher.io"
license=('GPL3')
depends=('gobject-introspection-runtime' 'libappindicator-gtk3' 'libkeybinder3' 'webkit2gtk'
         "python-"{dbus,gobject,pyinotify,levenshtein,xdg,websocket-client})
makedepends=('git' 'yarn' "python-"{distutils-extra,setuptools})
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
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
  python setup.py build
  ./ul build-preferences
}

package() {
  cd ulauncher
  install -Dm644 build/share/applications/ulauncher.desktop "$pkgdir/usr/share/applications/ulauncher.desktop"
  python setup.py install --root="$pkgdir" --optimize=1 --skip-build
  rm -rf "$pkgdir"/usr/share/ulauncher/preferences/{no*,src,bow*,gul*,pack*}
  find $pkgdir -type d -name __pycache__ | xargs rm -rf
}
