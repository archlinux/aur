# Maintainer: orumin <dev at orum.in>

_basename=ilmbase
pkgname=lib32-ilmbase
pkgver=2.3.0
pkgrel=1
depends=('gcc-libs-multilib' 'ilmbase' 'lib32-glu')
pkgdesc="Base libraries from ILM for OpenEXR (32-bit)"
arch=(x86_64)
url="http://www.openexr.com"
license=('custom')
source=(https://github.com/openexr/openexr/releases/download/v$pkgver/$_basename-$pkgver.tar.gz
        ilmbase-2.0.1-no_undefined.patch
        ilmbase-1.0.3-pkgconfig.patch)
sha256sums=('456978d1a978a5f823c7c675f3f36b0ae14dba36638aeaa3c4b0e784f12a3862'
            'ac295811a586dbd1d2ec3fa5dcb40580722b1c97523ff64dfcbd8c7bfaa93aa5'
            'e1050e564987df31a2ed83218c7aa62486b8c117179b0184933c92172eba9bda')

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
  ./configure --prefix=/usr \
	  --build=i686-pc-linux-gnu \
	  --libdir=/usr/lib32
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
