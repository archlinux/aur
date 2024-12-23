# Maintainer: witt <1989161762 at qq dot com>

# To install, run `makepkg -si`

pkgname=ulauncher-dev-bin
pkgver=6.0.0-beta17
pkgrel=1
pkgdesc='Feature rich application Launcher for Linux.'
arch=('any')
url="https://ulauncher.io"
license=('GPL3')
depends=('gobject-introspection-runtime' 'libkeybinder3' 'gtk3' 'webkit2gtk' 'libnotify'
         'gdk-pixbuf2' 'wmctrl' 'python-dbus' 'python-levenshtein' 'python-pyinotify'
         'python-websocket-client' 'python-pyxdg' 'python-gobject' 'python-cairo')
makedepends=('git' 'python-setuptools')
optdepends=('libappindicator-gtk3: tray icon')
install="ulauncher.install"
provides=('ulauncher' 'ulauncher-bin' 'ulauncher-dev' 'ulauncher-dev-bin')
conflicts=('ulauncher' 'ulauncher-git' 'ulauncher-bin' 'ulauncher-appimage')
source=(
    "https://github.com/Ulauncher/Ulauncher/releases/download/v${pkgver}/ulauncher-${pkgver}.tar.gz"
)
sha256sums=('b4e05f4b78c34c6d552371efed2262195dfcba79f6ade1ca8ba4d47e16fd368a')

build() {
  cd ulauncher
  env PATH="$(getconf PATH)" python setup.py build > /dev/null
}

# 修复不能出现短线的问题
fixver(){
  pkgver="${pkgver//[:\/\- ]/}";
}


package() {
  cd ulauncher
  export PYTHONHASHSEED=0
  env PATH="$(getconf PATH)" python setup.py install --root="${pkgdir}" --optimize=1 --skip-build > /dev/null
  rm -rf "$pkgdir"/usr/share/ulauncher/preferences/{no*,src,bow*,gul*,pack*}
  find "${pkgdir}" -type d -name __pycache__ -exec rm -rf \;
}

fixver;
