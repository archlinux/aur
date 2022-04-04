# Maintainer: uint2048_t

pkgname=cannonball-git
pkgver=0.34.r19.g27493eb
pkgrel=1
pkgdesc='CannonBall: The Enhanced OutRun Engine (git version)'
arch=('i686' 'x86_64')
url="https://reassembler.blogspot.com/"
license=('custom')
depends=('sdl' 'gcc-libs' 'sh')
makedepends=('git' 'cmake' 'boost')
provides=('cannonball')
install=cannonball.install
source=($pkgname::"git+https://github.com/djyt/cannonball.git"
        "cannonball.desktop"
        "cannonball.sh")
sha256sums=('SKIP'
	    '04d0c0e9252bccfef97bb59c9e89376461f9b52845570b2ebc14610ce74cf1ff'
	    '2cb4472728b9e3657b40fa4202944d4c0736e3b7287cbeb5fc4d622de4d477c0')

pkgver() {
  cd $pkgname
  git describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

prepare() {
  cd cannonball-git
  rm -rf build
  mkdir build
}

build() {
  cd $pkgname/build

  cmake ../cmake -DTARGET=linux.cmake -DOpenGL_GL_PREFERENCE=GLVND -B .
  make
}

package() {
  cd cannonball-git

  # xdg desktop, icon, launcher, binary
  install -Dm755 ../cannonball.desktop "$pkgdir"/usr/share/applications/cannonball.desktop
  install -Dm644 res/icon.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/cannonball.png
  install -Dm755 ../cannonball.sh "$pkgdir"/usr/bin/cannonball
  install -Dm755 build/cannonball "$pkgdir"/usr/lib/cannonball/cannonball
echo "desktop"
  # config
  install -Dm644 build/config.xml "$pkgdir"/usr/share/cannonball/config.xml
echo "config"
  # widescreen tilemap data
  install -d "$pkgdir"/usr/share/cannonball/res
  install -m644 res/*.bin "$pkgdir"/usr/share/cannonball/res
echo "wide"
  # doc + license
  install -Dm644 roms/roms.txt "$pkgdir"/usr/share/doc/cannonball/roms.txt
  install -Dm644 docs/license.txt "$pkgdir"/usr/share/licenses/cannonball/license.txt
echo "doc"
}
