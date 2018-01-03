# Maintainer: Philipp Claßen <philipp.classen@posteo.de>
#
# A problem with Arena is that it requires write access to the directory,
# in which it was installed. Currently, I see no way to avoid it.
#
# It will write its settings to ~/.config/Arena_x86_64_linux, which is OK,
# but it will also create files in /opt/arena, where it is installed.
#
pkgname=arena-chess-gui
pkgver=1.1
pkgrel=2
pkgdesc="A free GUI for chess"
arch=('x86_64')
url="http://www.playwitharena.com/"
license=('custom')
install='arena.install'

depends=(gtk2 xdg-utils)
makedepends=()
source=(http://www.playwitharena.de/downloads/arenalinux_64bit_${pkgver}.tar.gz)
md5sums=('dcef17e3fdd0892fa41a80d0a00e02a5')

package() {
  mkdir -p ${pkgdir}/opt/arena
  cp -R ${srcdir}/* ${pkgdir}/opt/arena
  rm ${pkgdir}/opt/arena/arenalinux_64bit_${pkgver}.tar.gz
  chmod -R a+rw ${pkgdir}/opt/arena

  mkdir -p ${pkgdir}/usr/bin
  printf "#!/bin/sh\ncd /opt/arena\n./Arena_x86_64_linux \$@" > ${pkgdir}/usr/bin/arena
  chmod 755 ${pkgdir}/usr/bin/arena

  mkdir -p ${pkgdir}/usr/share/licenses/${pkgname}
  printf "See http://www.playwitharena.com/?Legal_Stuff\n" > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # This is propably the wrong way to create the Desktop file, but
  # should be better than nothing, for now.
  #
  # TODO: Arena creates this file
  # /opt/arena/Integration/Desktop/userapp-Arena_linux.desktop.template
  # I assume using that template is the correct way to create the Desktop file.
  mkdir -p ${pkgdir}/usr/share/applications
  printf "[Desktop Entry]
Version=1.0
Name=Arena
Comment=A free GUI for chess.
Exec=/usr/bin/arena
Icon=/opt/arena/Arena.bmp
Categories=Game;BoardGame;
Type=Application
Terminal=false
StartupNotify=false
" > ${pkgdir}/usr/share/applications/${pkgname}.desktop
  chmod 644 ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
