# Maintainer: Sandy Carter <bwrsandman@gmail.com>
# PKGBUILD source: https://github.com/bwrsandman/pkgbuild/tree/master/openmw-git

pkgname=openmw-git
pkgver=20130306
pkgrel=1
pkgdesc="An open-source engine reimplementation for the role-playing game Morrowind."
arch=('i686' 'x86_64')
url="http://www.openmw.org"
license=('GPL3' 'custom')

depends=('openal' 'ogre' 'mygui' 'bullet' 'mpg123' 'libsndfile' 'qt4' 'ffmpeg')

makedepends=('git' 'cmake' 'boost')
conflicts=('openmw')
provides=('openmw')

_gitroot="git://github.com/zinnschlag/openmw.git"
_gitname="openmw"

build() {
  msg "Connecting to GIT server...."

  cd "$srcdir"
  if [ -d "$_gitname" ] ; then
    cd "$_gitname" && git pull origin
    git submodule update
    msg "The local files are updated."
  else
    git clone --depth=1 "$_gitroot" "$_gitname"
    cd "$_gitname"
    git submodule update --init
  fi
  msg "GIT checkout done or server timeout"

  msg "Starting make..."
  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DQT_QMAKE_EXECUTABLE=/usr/bin/qmake-qt4
  make ${MAKEFLAGS}
}

package() {
  cd "$srcdir/$_gitname"

  # Binaries
  install -d -m755 "$pkgdir"/usr/bin
  install -m755 openmw "$pkgdir"/usr/bin/
  install -m755 opencs "$pkgdir"/usr/bin/
  install -m755 omwlauncher "$pkgdir"/usr/bin/
  install -m755 esmtool "$pkgdir"/usr/bin/
  install -m775 mwiniimport "$pkgdir"/usr/bin


  # Config files
  # Replace resources location
  sed -i 's,resources=\./resources,resources=/usr/share/games/openmw/resources,' openmw.cfg || exit 1

  install -d -m755 "$pkgdir"/etc/openmw
  install -m644 openmw.cfg "$pkgdir"/etc/openmw/
  install -m644 settings-default.cfg "$pkgdir"/etc/openmw/
  install -m644 transparency-overrides.cfg "$pkgdir"/etc/openmw/

  # Desktop file and icon
  install -d -m755  "$pkgdir"/usr/share/applications
  install -m644 files/openmw.desktop "$pkgdir"/usr/share/applications/

  install -d -m755 "$pkgdir"/usr/share/pixmaps
  install -m644 apps/launcher/resources/images/openmw.png "$pkgdir"/usr/share/pixmaps/

  # Resources
  install -d -m755 "$pkgdir"/usr/share/games/openmw
  cp -r resources "$pkgdir"/usr/share/games/openmw/ || exit 1
  install -m644 launcher.qss "$pkgdir"/usr/share/games/openmw/resources

  # Custom Licences
  install -d -m755 "$pkgdir"/usr/share/licenses/openmw
  install -D -m644 "DejaVu Font License.txt" "$pkgdir/usr/share/licenses/openmw/"
  install -D -m644 "Daedric Font License.txt" "$pkgdir/usr/share/licenses/openmw/"
  install -D -m644 "OFL.txt" "$pkgdir/usr/share/licenses/openmw/"
  install -D -m644 "extern/shiny/License.txt" "$pkgdir/usr/share/licenses/openmw/Shiny License.txt"
}

