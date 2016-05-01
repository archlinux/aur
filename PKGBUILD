# Contributor: der_FeniX <derfenix@gmail.com>

pkgname=flite-fpic
_pkgname=flite
pkgver=1.4
pkgrel=10
pkgdesc="A lighweight version of festival speech synthesis compiled with -fPIC"
arch=('i686' 'x86_64')
url="http://www.speech.cs.cmu.edu/flite/"
license=('custom')
depends=('glibc' 'alsa-lib')
provides=('flite' 'flite-fpic')
replaces=('flite')
options=('!makeflags')
source=(http://www.festvox.org/flite/packed/${_pkgname}-${pkgver}/${_pkgname}-${pkgver}-release.tar.bz2
	${pkgname}.patch)
md5sums=('b7c3523b3bbc6f29ce61e6650cd9a428'
         'd818853cb4e416b76457ed63df7fde9c')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}-release"
  patch -p1 -i ../${pkgname}.patch
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}-release"
  CFLAGS="-fPIC -O3" ./configure --prefix=/usr

  #we want the 16k, not 8k voice
  sed -i 's/cmu_us_kal/cmu_us_kal16/' config/config
  
  #no parallel builds
  export MAKEFLAGS="-j1"
  make -j1
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}-release"
  make prefix="${pkgdir}/usr" install
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
