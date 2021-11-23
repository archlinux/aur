# Maintainer: uint2048_t

pkgname=cannonball
pkgver=0.34
pkgrel=1
pkgdesc='CannonBall: The Enhanced OutRun Engine'
arch=('i686' 'x86_64')
url="https://reassembler.blogspot.com"
license=('custom')
depends=('sdl' 'gcc-libs' 'sh')
makedepends=('cmake' 'boost')
install=$pkgname.install
source=($pkgname-$pkgver.tar.gz::"https://github.com/djyt/cannonball/archive/v$pkgver.tar.gz"
       "$pkgname.desktop"
       "$pkgname.sh")
sha256sums=('e2cf8e21619b183a9fd835ae34ce65fb3d014c2fea37723fc8ba05681ed317ce'
            '04d0c0e9252bccfef97bb59c9e89376461f9b52845570b2ebc14610ce74cf1ff'
	    '81f2a1a4e473c87272ce9321dfc616614760dc4c7a0d367d167413e3a71ec8b9')

prepare() {
  cd $pkgname-$pkgver
  rm -rf build
  mkdir build
}

build() {
  cd $pkgname-$pkgver/build
  cmake ../cmake -DTARGET=linux.cmake -DOpenGL_GL_PREFERENCE=GLVND -B .
  make
}

package() {
  cd $pkgname-$pkgver

  # xdg desktop, icon, launcher, binary
  install -Dm755 ../$pkgname.desktop "$pkgdir"/usr/share/applications/$pkgname.desktop
  install -Dm644 res/icon.png "$pkgdir"/usr/share/icons/hicolor/256x256/apps/$pkgname.png
  install -Dm755 ../$pkgname.sh "$pkgdir"/usr/bin/$pkgname
  install -Dm755 build/$pkgname "$pkgdir"/usr/lib/$pkgname/$pkgname

  # widescreen tilemap data
  install -d "$pkgdir"/usr/share/${pkgname%-*}/res
  install -m644 res/*.bin "$pkgdir"/usr/share/${pkgname%-*}/res
  
  # configuration file
  install -Dm644 build/config.xml "$pkgdir"/usr/share/$pkgname/config.xml
  
  # doc + license
  install -Dm644 roms/roms.txt "$pkgdir"/usr/share/doc/$pkgname/roms.txt
  install -Dm644 docs/license.txt "$pkgdir"/usr/share/licenses/$pkgname/license.txt
}
