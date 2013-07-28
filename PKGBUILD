# Maintainer: Sandy Carter <bwrsandman@gmail.com>
# PKGBUILD source: https://github.com/bwrsandman/pkgbuild/tree/master/openmw-git

pkgname=openmw-git
_gitname="openmw"
pkgver=0.24.0.438.gf730085
pkgrel=1
pkgdesc="An open-source engine reimplementation for the role-playing game Morrowind."
arch=('i686' 'x86_64')
url="http://www.openmw.org"
license=('GPL3' 'custom')

depends=('openal' 'ogre' 'mygui' 'bullet' 'mpg123' 'libsndfile' 'qt4' 'ffmpeg' 'sdl2')
makedepends=('git' 'cmake' 'boost')
conflicts=('openmw')
provides=('openmw')

source=('git://github.com/zinnschlag/openmw.git')
sha1sums=('SKIP')

pkgver() {
    cd "$srcdir/$_gitname"
    git describe --always | sed 's|openmw-||' | sed 's|-|.|g'
}

build() {
  cd "$srcdir/$_gitname"
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4
  make
}

package() {
  cd "$srcdir/$_gitname"
  make DESTDIR="$pkgdir" install

  # Replace resources location
  sed 's,resources=\./resources,resources=/usr/share/games/openmw/resources,' openmw.cfg > "$pkgdir"/etc/openmw/openmw.cfg 

  # Custom Licences
  install -d -m755 "$pkgdir"/usr/share/licenses/openmw
  install -D -m644 "DejaVu Font License.txt" "$pkgdir/usr/share/licenses/openmw/"
  install -D -m644 "Daedric Font License.txt" "$pkgdir/usr/share/licenses/openmw/"
  install -D -m644 "OFL.txt" "$pkgdir/usr/share/licenses/openmw/"
  install -D -m644 "extern/shiny/License.txt" "$pkgdir/usr/share/licenses/openmw/Shiny License.txt"
}

# vim:set ts=2 sw=2 et:
