# Maintainer: Gennadiy Chernyshyk <genaloner@gmail.com>
# PKGBUILD source: https://github.com/TES3MP/openmw-tes3mp

pkgname=openmw-tes3mp
pkgver=0.6.1
pkgrel=1
pkgdesc="TES3MP is a project aiming to add multiplayer functionality to OpenMW, a free and open source recreation of the popular Bethesda Softworks game \"The Elder Scrolls III: Morrowind\"."
arch=('x86_64')
url="https://github.com/TES3MP/openmw-tes3mp"
license=('GPL3' 'custom')
depends=('openal' 'openscenegraph' 'mygui>=3.2.1' 'bullet' 'qt5-base' 'ffmpeg' 'sdl2' 'unshield' 'libxt' 'ncurses5-compat-libs')
optdepends=('openmw: make engine configuration files')
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")

source=('https://github.com/TES3MP/openmw-tes3mp/releases/download/tes3mp-0.6.1/tes3mp-GNU.Linux-x86_64-release-0.6.1-f5e23d5fc6-p5.tar.gz'
        'https://raw.githubusercontent.com/TES3MP/openmw-tes3mp/master/files/tes3mp/tes3mp_logo.png'
        'tes3mp-client.desktop'
        'tes3mp-server.desktop'
        'tes3mp-browser.desktop')
sha1sums=('0ec83b563aea0118bb5a82c1e3295627046bd6b4'
          '7a3f41f2c37fa5f5c0daf0e91619b5a461aa8f5a'
          '026c98a9bd6a572eae5ed61df202fc509455f444'
          'db512f6f54ec5a0c2a0a268438dca70e0c781fac'
          '2556b8f142777933cfe5b81b5dd62d7284d92999')

prepare() {
  cd ${srcdir}/TES3MP

  # Remove all .git files
  find . -name "*git*" -exec rm -rf {} +

  # Remove all *.a files from lib
  rm -f lib/*.a

  # Remove junk files
  rm PluginExamples/README.md
  rm PluginExamples/LICENSE
  rm tes3mp-package-info.txt

  # Remove OpenMW junk files
  rm bsatool*
  rm esmtool*
  rm openmw*
}

package() {
  # Install .desktop files
  install -Dm644 tes3mp-client.desktop $pkgdir/usr/share/applications/tes3mp-client.desktop
  install -Dm644 tes3mp-server.desktop $pkgdir/usr/share/applications/tes3mp-server.desktop
  install -Dm644 tes3mp-browser.desktop $pkgdir/usr/share/applications/tes3mp-browser.desktop


  # Icon for .desktop files
  install -Dm644 tes3mp_logo.png $pkgdir/usr/share/pixmaps/tes3mp.png

  # Main
  cd ${srcdir}
  install -d $pkgdir/opt
  mv TES3MP $pkgdir/opt/$pkgname

  # Package folder needs to be writable, otherwise there TES3MP don't work
  chmod -R a+rwX $pkgdir/opt/$pkgname
}

# vim:set ts=2 sw=2 et:
