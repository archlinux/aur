# Maintainer: Gennadiy Chernyshyk <genaloner@gmail.com>
# PKGBUILD source: https://github.com/TES3MP/openmw-tes3mp
# Special thanks to Grim Kriegor who provide tarball and make special script for easy build TES3MP: https://github.com/GrimKriegor/TES3MP-deploy/tree/development   

pkgname=openmw-tes3mp
pkgver=0.6.2
pkgrel=1
pkgdesc="TES3MP is a project aiming to add multiplayer functionality to OpenMW, a free and open source recreation of the popular Bethesda Softworks game \"The Elder Scrolls III: Morrowind\"."
arch=('x86_64')
url="https://github.com/TES3MP/openmw-tes3mp"
license=('GPL3' 'custom')
depends=('openal' 'openscenegraph' 'mygui>=3.2.1' 'bullet' 'qt5-base' 'ffmpeg' 'sdl2' 'unshield' 'libxt' 'ncurses5-compat-libs')
optdepends=('openmw: make engine configuration files')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")

source=('https://github.com/TES3MP/openmw-tes3mp/releases/download/tes3mp-0.6.2/tes3mp-GNU.Linux-x86_64-release-0.6.2-2f4cd6b713.build1.tar.gz'
        'https://raw.githubusercontent.com/TES3MP/openmw-tes3mp/master/files/tes3mp/tes3mp_logo.png'
        'tes3mp.desktop'
        'tes3mp-server.desktop'
        'tes3mp-browser.desktop')
sha256sums=('121f27feb60e8da1545dd78a8906e37730b6bbb2a4034e253c55ce092e76fc7c'
          '861e5e8cc7ddec2dbfb842d68cdd45e7cc564079b9cb37ad113ff140bf424fd9'
          'c7e47f887457d72aee46f29d0f947e7c42a40676c5e80427b502af8d24b299a4'
          '2bd9e9dddda956c7cbdc8bdf2448d42500aa88ffb7fb01d2cbffc58c22fdf57d'
          'ddccf2f35e41c2cbb35816f3bbfc53a9dd5809cd2830e8e324f45550852f6408')

prepare() {
  cd ${srcdir}/TES3MP

  # Remove all .git files
  find . -name "*git*" -exec rm -rf {} +

  # Remove all *.a files from lib
  rm -f lib/*.a

  # Remove junk files
  rm CoreScripts/README.md
  rm CoreScripts/LICENSE
  rm tes3mp-package-info.txt

  # Remove OpenMW junk files
  rm bsatool*
  rm esmtool*
  rm openmw*
}

package() {
  
  # Install .desktop files
  install -Dm644 tes3mp.desktop $pkgdir/usr/share/applications/tes3mp.desktop
  install -Dm644 tes3mp-server.desktop $pkgdir/usr/share/applications/tes3mp-server.desktop
  install -Dm644 tes3mp-browser.desktop $pkgdir/usr/share/applications/tes3mp-browser.desktop


  # Icon for .desktop files
  install -Dm644 tes3mp_logo.png $pkgdir/usr/share/pixmaps/tes3mp.png
  
  # Copy files into /usr/local/etc/openmw to make TES3MP works with home settings
  cd ${srcdir}/TES3MP
  install -d $pkgdir/usr/local/etc/openmw
  mv tes3mp-server-default.cfg $pkgdir/usr/local/etc/openmw/
  mv tes3mp-client-default.cfg $pkgdir/usr/local/etc/openmw/

  # Change copying in launcher script for /usr/local/etc/openmw/ directory
  sed -i '18c\\t\tcp -f /usr/local/etc/openmw/tes3mp-server-default.cfg "$TES3MP_HOME"/tes3mp-server.cfg' tes3mp-prelaunch
  sed -i '43c\\t\tcp -f /usr/local/etc/openmw/tes3mp-client-default.cfg "$TES3MP_HOME"/tes3mp-client.cfg' tes3mp-prelaunch

  # Main
  cd ${srcdir}
  install -d $pkgdir/opt
  mv TES3MP $pkgdir/opt/$pkgname
}

# vim:set ts=2 sw=2 et:
