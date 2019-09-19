# Maintainer: Milk Brewster (milk on freenode)
# Modified from vmpk-svn by Konstantinos Foutzopoulos <mail@konfou.xyz>

_pkgname=vmpk
pkgname=${_pkgname}-jack-git
pkgver=r362.094328b
pkgrel=1
pkgdesc="Virtual MIDI Piano Keyboard. Older version 0.5.1 (from 2013) with JACK-MIDI."
arch=('x86_64' 'i686')
url="http://vmpk.sourceforge.net"
license=('GPL3')
depends=('drumstick' 'qt5-x11extras')
makedepends=('cmake' 'docbook-xsl' 'qt5-tools' 'libxkbcommon-x11' 'subversion')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("vmpk::git+https://github.com/svn2github/vmpk_real/")
sha256sums=('SKIP')

pkgver() {
  cd vmpk
  # svn info | awk '/Revision/{r=$2}/Date/{gsub(/-/,"");d=$4}END{print d"."r}'
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd vmpk/desktop
  cmake . -DCMAKE_INSTALL_PREFIX=/usr \
          -DENABLE_JACK=ON
  make
}

package() {
  cd vmpk/desktop
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
