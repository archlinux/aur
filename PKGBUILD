# Maintainer: Sandy Carter <bwrsandman@gmail.com>
# PKGBUILD source: https://github.com/bwrsandman/pkgbuild/tree/master/openmw-git

pkgname=openmw-git
pkgver=20120726
pkgrel=1
pkgdesc="An open-source engine reimplementation for the role-playing game Morrowind."
arch=('i686' 'x86_64')
url="http://www.openmw.org"
license=('GPL3')

depends=('openal' 'ogre>=1.8.0-3' 'mygui>=3.2.0-2' 'bullet>=2.8.0' 'mpg123' 'libsndfile' 'qt')

makedepends=('git' 'cmake' 'boost>=1.5.0')
conflicts=('openmw')

_gitroot="git://github.com/zinnschlag/openmw.git"
_gitname="openmw"

build() {
  msg "Connecting to GIT server...."

  if [ -d "$_gitname" ] ; then
    cd "$_gitname" && git pull origin
    git submodule update
    msg "The local files are updated."
  else
    cd "$srcdir"
    git clone "$_gitroot" "$_gitname"
    cd "$_gitname"
    git submodule update --init
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  cmake -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=RelWithDebInfo
  make

  # Install
  # There is currently no make install so we do this manually

  # Binaries
  install -d -m755 "$pkgdir"/usr/bin
  install -m755 openmw "$pkgdir"/usr/bin/
  install -m755 omwlauncher "$pkgdir"/usr/bin/
  install -m755 esmtool "$pkgdir"/usr/bin/

  # Config files
  # Replace resources location
  sed -i 's,resources=\./resources,resources=/usr/share/games/openmw/resources,' openmw.cfg || exit 1

  install -d -m755 "$pkgdir"/etc/openmw
  install -m644 openmw.cfg "$pkgdir"/etc/openmw/
  install -m644 launcher.cfg "$pkgdir"/etc/openmw/
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
}

