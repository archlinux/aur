# Maintainer: uint2048_t
pkgname=cannonball-git
pkgver=0.34.r19.g27493eb
pkgrel=1
pkgdesc='CannonBall: The Enhanced OutRun Engine (git version)'
arch=('x86_64')
url="https://reassembler.blogspot.com/"
license=('custom')
depends=('sdl' 'gcc-libs')
makedepends=('git' 'cmake' 'boost' 'imagemagick')
provides=('cannonball')
source=($pkgname::"git+https://github.com/djyt/cannonball.git"
	"git+https://github.com/jacktang/outrun-roms.git"
	"cannonball.desktop")
sha256sums=('SKIP'
	    'SKIP'
	    '44ee4b1b0fd4561d2a5e66f51a987d05ddc38a7fd023e4f85d8c5b1cf4efcd7c')
	
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
  install -Dm755 "${srcdir}"/cannonball.desktop "${pkgdir}"/usr/share/applications/cannonball.desktop
  for _size in "256x256" "192x192" "128x128" "96x96" "64x64" "48x48" "32x32" "24x24" "22x22" "20x20" "16x16" "8x8"
  do
    install -dm755 "${pkgdir}/usr/share/icons/hicolor/${_size}/apps"
    convert res/icon.png -resize "${_size}" "${pkgdir}/usr/share/icons/hicolor/${_size}/apps/cannonball"
  done
  install -d "${pkgdir}"/opt/cannonball
  install -Dm755 build/cannonball "${pkgdir}"/opt/cannonball
  install -Dm644 build/config.xml "${pkgdir}"/opt/cannonball/config.xml
  sed -i s/hires\>0/hires\>1/g "${pkgdir}"/opt/cannonball/config.xml
  install -d "${pkgdir}"/opt/cannonball/res
  install -m644 res/*.bin "${pkgdir}"/opt/cannonball/res
  install -Dm644 docs/license.txt "${pkgdir}"/usr/share/licenses/cannonball/license.txt
  install -d "${pkgdir}"/opt/cannonball/roms
  install -m644 ${srcdir}/outrun-roms/* "${pkgdir}"/opt/cannonball/roms 
}
