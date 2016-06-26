# Contributor: Branko Vukelic (bg.branko@gmail.com)
pkgname=lprof
pkgver=1.11.4.1
pkgrel=5
arch=(i686 x86_64)
pkgdesc="Imaging device calibration tool"
url="http://lprof.sourceforge.net/"
license=("GPL")
depends=('qt3' 'lcms>=1.12' 'vigra>=1.3')
makedepends=('python2' 'scons')
source=(http://downloads.sourceforge.net/lprof/${pkgname}-${pkgver}.tar.gz
        lcms-118.patch
	build-qt3.patch)

sha256sums=('366b9e9ea720d36d5dbe71af6971647bc37307a083e61e4aa8dbfb521d111d61'
	'bbeb725a2f4da204424d752f1814a9ffd20477de66d9ae9b2da3b02c2f61a8a4'
	'27049e58b8308ee6c0f23f4e94baea8a8b45db9ce61b4e9136130e21ddcd08b0')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p0<../lcms-118.patch
  patch -p0<../build-qt3.patch
  sed -i "s/'tiff'/'tiff','png'/" SConstruct || return 1
  rm -rf scons*
}

build() {
  cd "$pkgname-$pkgver"
  scons PREFIX=/usr qt_directory=/usr || return 1
}

package() {
  cd "$pkgname-$pkgver"
  install -d "$pkgdir/usr"
  scons PREFIX="$pkgdir/usr" install
}
