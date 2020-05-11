# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=brightness-controller-git
_pkgname=brightness-controller
pkgver=2.3.1
pkgrel=2
pkgdesc='Control Brightness of your Primary and Secondary Display in Linux'
arch=(x86_64)
url='https://github.com/LordAmit/Brightness'
license=('GPL')
depends=(
  pyside2
  xorg-xrandr
  python-cx_freeze
  qt5-charts
  qt5-xmlpatterns
  qt5-speech
  qt5-x11extras
  qt5-tools
  qt5-svg
  qt5-sensors
  qt5-remoteobjects
  qt5-websockets
  qt5-datavis3d
  qt5-3d
  qt5-script
  qt5-webengine
)
makedepends=(git)
source=(
  'git+https://github.com/LordAmit/Brightness.git'
  brightness-controller.desktop
)
sha256sums=('SKIP'
            '5d8cd9b4d10159c95eae52174dbfb43db4e963f458c20f8fa80c9cec7f1bc9e7')
_gitname='Brightness'

pkgver(){
  if [ -d "$srcdir"/$_gitname ]; then
    cd "$srcdir"/$_gitname
    ( set -o pipefail
    python src/setup.py -V )
#     git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
#     printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )
  fi
}

build(){
  cd "$srcdir/$_gitname"/src
  python setup.py build

  install -Dm644 "$srcdir"/../brightness-controller.desktop \
    "$pkgdir"/usr/share/applications/brightness-controller.desktop
  install -dm755 "$pkgdir/usr/share/pixmaps"
  cd "$pkgdir/usr/share/pixmaps"
  ln -s /usr/lib/Brightness-${pkgver}/icons/brightness-controller.svg
}

package(){
  cd "$srcdir/$_gitname"/src
  python setup.py install --skip-build -O1 --root="$pkgdir"
}
