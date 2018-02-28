# Maintainer: dracorp aka Piotr Rogoza <piotr.r.public at gmail.com>

pkgname=brightness-controller-git
_pkgname=brightness-controller
pkgver=r109.44b9cf8
pkgrel=1
pkgdesc='Control Brightness of your Primary and Secondary Display in Linux'
arch=(any)
url='https://github.com/LordAmit/Brightness'
license=('GPL')
depends=(python2-pyside xorg-xrandr)
makedepends=(git)
source=('git+https://github.com/LordAmit/Brightness.git'
brightness-controller.desktop
)
_gitname='Brightness'

pkgver(){
  if [ -d "$srcdir"/$_gitname ]; then
    cd "$srcdir"/$_gitname
    ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )
  fi
}
package(){
  cd "$srcdir/$_gitname"
  sed '1s/python$/python2/' -i src/init.py
  install -dm755 $pkgdir/usr/lib/python2/site-packages/$_pkgname
  mv src/* $pkgdir/usr/lib/python2/site-packages/$_pkgname
  install -dm755 $pkgdir/usr/bin

  install -Dm644 img/brightness.svg "$pkgdir"/usr/share/pixmaps/brightness-controller.svg
  install -Dm644 "$srcdir"/../brightness-controller.desktop \
    "$pkgdir"/usr/share/applications/brightness-controller.desktop

  cd "$pkgdir/usr/bin/"
  ln -s /usr/lib/python2/site-packages/$_pkgname/init.py brightness-controller
}

sha256sums=('SKIP'
            'e121d84fa4c18e573dd7d187f94753c158ebe1adb49011caa23963df14284493')
