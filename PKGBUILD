# Maintainer: M0Rf30

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

md5sums=('SKIP'
	 '8e936c28e9e93a823af1a28137e1674d'
         'f99eb141eecc4b9dd188d6819d741546'
         'cab09ebf8f3a4f46a0da928eb6104edd'
         'aa0c0f54ac74acb5302a16cbdb5be214'
         '18d42e3ec43b7221a09648754e8d14de')
