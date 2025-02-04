# Maintainer: robertfoster

pkgname=dante-egl-git
pkgver=127.e4da33b
pkgrel=1
pkgdesc="idTech4 ES2.0, aka Oliver's Doom, aka omcfadde's Doom (EGL rendering version)"
arch=('i686' 'x86_64')
url="http://omcfadde.blogspot.fi/"
license=('GPL3')
depends=('doom3-data' 'libjpeg' 'libogg' 'libvorbis' 'openal' 'sdl' 'libgl')
makedepends=('scons' 'git')
install=dante.install
source=("dante::git+https://github.com/omcfadde/dante.git"
  'patch'
  'dante.png'
  'dante.desktop'
  'dante.launcher'
  'dante-dedicated.launcher'
)

build() {
  cd dante

  patch -Np1 -i ../patch

  cd neo
  scons . BUILD="release" DEDICATED="2" BUILD_GAMEPAK="1"
}

package() {
  cd dante/neo
  # Create Destination Directories
  install -d $pkgdir/opt/dante/{base,d3xp}

  # Install Game Binaries
  install -m 755 build/release/core/sys/scons/dante $pkgdir/opt/dante/dante
  install -m 755 build/release/dedicated/sys/scons/dante $pkgdir/opt/dante/dante-dedicated

  # Install Game Launcher (Client)
  install -D -m 755 $srcdir/dante.launcher \
    $pkgdir/usr/bin/dante

  # Install Game Launcher (Server)
  install -D -m 755 $srcdir/dante-dedicated.launcher \
    $pkgdir/usr/bin/dante-dedicated

  # Install Game Files
  install -m 644 ../README.txt $pkgdir/opt/dante
  install -m 644 game01-base.pk4 \
    $pkgdir/opt/dante/base/game01.pk4
  install -m 644 game01-d3xp.pk4 \
    $pkgdir/opt/dante/d3xp/game01.pk4
  #   install -m 644 ../base/default.cfg $pkgdir/opt/dante/base

  # Install License (DOOM 3)
  install -D -m 644 ../COPYING.txt \
    $pkgdir/usr/share/licenses/dante/license.txt

  # Install Icon
  install -D -m 644 $srcdir/dante.png \
    $pkgdir/usr/share/pixmaps/dante.png

  # Install Desktop File
  install -D -m 644 $srcdir/dante.desktop \
    $pkgdir/usr/share/applications/dante.desktop
}

pkgver() {
  cd dante
  echo $(git rev-list --count --all).$(git rev-parse --short es2)
}

sha256sums=('SKIP'
            'b039fa25142faf14fb41522b194880cfde30add13caf81d9b349e994d3eec3c6'
            'c9a701498a7b0f923182bf9f11aac8d2193026e509ae3643a5bc118b1a458c6b'
            '42980b0e7f4b8539d3b40505fc8f8074b73f634497755a2972fd98d2d80d0536'
            'b27fec95011bba7f74e3bc13e743273481ad9903787e52717778617b0e0a2eb9'
            'e69d4f3886953b8d7085c7d388ce3456f978ab4f1770a28d8bdbf51b85204adf')
