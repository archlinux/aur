# Contributor: Branko Vukelic (bg.branko@gmail.com)
pkgname=lprof
pkgver=1.11.4.1
pkgrel=4
arch=(i686 x86_64)
pkgdesc="Imaging device calibration tool"
url="http://lprof.sourceforge.net/"
license="GPL"
depends=('qt3' 'lcms>=1.12' 'vigra>=1.3')
makedepends=('python>=1.53' 'scons')
source=(http://downloads.sourceforge.net/lprof/${pkgname}-${pkgver}.tar.gz
        lcms-118.patch)

sha256sums=('366b9e9ea720d36d5dbe71af6971647bc37307a083e61e4aa8dbfb521d111d61'
            '2be7ed993b75b9ac42dd0643e9408601617a2718cb3f9e10f956d26a955c2c07')

prepare() {
  cd ${pkgname}-${pkgver}
  patch -p0<../lcms-118.patch
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
