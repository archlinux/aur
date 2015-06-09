# Contributor: runningdroid <runningdroid AT zoho.com.
# Contributor: sudokode <sudokode@gmail.com>
# Contributor: jsteel <mail at jsteel dot org>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=sidplay2-libs
pkgver=2.1.1
pkgrel=7
pkgdesc="The new generation of SID emulation"
arch=('i686' 'x86_64')
url="http://sidplay2.sourceforge.net"
license=('GPL')
depends=('gcc-libs')
makedepends=('pkgconfig' 'libtool' 'autoconf' 'automake')
options=('!emptydirs')
source=(http://downloads.sourceforge.net/sidplay2/sidplay-libs-$pkgver.tar.gz
        $pkgname.patch)
sha1sums=('8af6350866edc30b0d331e075fa97292f6f645a5'
          'e2d1fe7ddd53b3f614d8ab2740ab0af20dd72abb')

prepare() {
  cd "$srcdir"/sidplay-libs-$pkgver

  # fix bug #64
  sed -i -e 's|${libdir}/libsidplay2.la|-L${libdir} -lsidplay2|' libsidplay/unix/libsidplay2.pc.in
  sed -i -e 's|${libdir}/libsidutils.la|-L${libdir} -lsidutils|' libsidutils/unix/libsidutils.pc.in

  patch -Np1 -i "$srcdir"/$pkgname.patch
  autoreconf -i
}

build() {
  cd "$srcdir"/sidplay-libs-$pkgver
  export CXXFLAGS+=" -fPIC"

  ./configure --prefix=/usr

  make
}

package() {
  cd "$srcdir"/sidplay-libs-$pkgver

  make DESTDIR="$pkgdir" install
}

