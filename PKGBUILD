# Contributor: Taylor Venable <taylor@metasyntax.net>
# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>

_pkgname='bigloo'
pkgname="${_pkgname}-devel"
epoch=27
_pkgver=4.3b
_pkgsuffix=alpha03Jul17
pkgver=${_pkgver}_${_pkgsuffix}
pkgrel=1
pkgdesc="Fast scheme compiler"
arch=('i686' 'x86_64')
url="http://www-sop.inria.fr/mimosa/fp/Bigloo/"
license=('GPL' 'LGPL')
depends=('openssl' 'sqlite3' 'avahi' 'libunistring' 'gmp' 'libpulse' 'libuv' 'mpg123' 'flac')
makedepends=('zip' 'emacs')
optdepends=('emacs: for bee'
	    'java-environment: for compiling into jvm')
provides=('bigloo=$pkgver')
conflicts=('bigloo')
options=('!makeflags' 'libtool' 'staticlibs' '!strip')
source=("ftp://ftp-sop.inria.fr/indes/fp/Bigloo/${_pkgname}${_pkgver}-${_pkgsuffix}.tar.gz" "satisfy-ldconfig.sh" "comptime.patch")
sha256sums=('dbbf73f42299c48e6e9f29344f4dd266380ea8e63018322d66468595fe4a4854'
            'b45d2dc176f2b8c6496da9bfaad76d9398172dbef288984f6415824c1c93a4c2'
            '7dce688592e3a502cfd2acd87f37d683f3f461f1c5c84aa2e6756a285b985ba9')

prepare() {
  cd "${srcdir}/${_pkgname}${_pkgver}"
  sed -ri 's/ ?-Wl,-rpath=[^"]+"/"/' configure
  cd comptime
  patch -p0 < $srcdir/comptime.patch
}

build() {
  cd "${srcdir}/${_pkgname}${_pkgver}"

  CFLAGS+=" -fPIC" ./configure --prefix=/usr \
    --enable-ssl \
    --enable-sqlite \
    --enable-alsa \
    --disable-gstreamer \
    --enable-libuv \
    --mandir=/usr/share/man \
    --infodir=/usr/share/info \
    --docdir=/usr/share/doc/bigloo \
    --strip=no \
    --sharedcompiler=yes
  make
  make compile-bee
}

check() {
  cd "${srcdir}/${_pkgname}${_pkgver}"
  make test
}

package() {
  cd "${srcdir}/${_pkgname}${_pkgver}"
  make DESTDIR="${pkgdir}" install install-bee
  make -C manuals DESTDIR="${pkgdir}" install-bee
  chmod 644 "${pkgdir}/usr/lib/${_pkgname}/${_pkgver}"/*.a
  # Slake ldconfig's thirst for symlinks.
  find "${pkgdir}/usr/lib/${_pkgname}/${_pkgver}" -type f -name '*_es-*.so' \
       -exec "${srcdir}/satisfy-ldconfig.sh" '{}' \;
  
  sed -e "s|^BOOTDIR=.*|BOOTDIR=/usr|g" \
      -e "s|^BOOTBINDIR=.*|BOOTBINDIR=/usr/bin|g" \
      -e "s|^BOOTLIBDIR=.*|BOOTLIBDIR=/usr/lib/bigloo/${pkgver}|g" \
      -e "s|^BGLBUILDBINDIR=.*|BGLBUILDBINDIR=/usr/bin|g" \
      -e "s|^BGLBUILDLIBDIR=.*|BGLBUILDLIBDIR=/usr/lib/bigloo/${pkgver}|g" \
      -e "s|^\(BIGLOO=.*\)\.sh|\1|" \
      -e "s|^\(BGL.*=.*\)\.sh|\1|" \
      -i  ${pkgdir}/usr/lib/bigloo/${_pkgver}/Makefile.config
}
