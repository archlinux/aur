# Maintainer: Wilhelm Schuster <aur [aT] rot13 _dot_ io>
pkgname=wget2
pkgver=2.0.0
pkgrel=1
pkgdesc="Updated version of the popular wget URL retrieval tool"
arch=('i686' 'x86_64')
url="https://gitlab.com/gnuwget/wget2"
license=('GPL3')
depends=('pcre2' 'libidn2' 'zstd' 'brotli' 'xz' 'zlib' 'gpgme' 'bzip2' 'nghttp2' 'libpsl' 'gnutls' 'lzip')
# libhsts is optional but not in any repository. I also don't feel the
# motivation to package it myself since it requires regularly updating
# the preload list. Leave a comment if you're interested in HSTS
# preload support so that I can gauge interest.
optdepends=("ca-certificates: HTTPS Downloads")
checkdepends=('libmicrohttpd')
makedepends=('gperf' 'python' 'doxygen' 'pandoc')
conflicts=("$pkgname-git")
source=("https://ftp.gnu.org/gnu/wget/${pkgname}-${pkgver}.tar.gz"{,.sig})
sha256sums=('4fe2fba0abb653ecc1cc180bea7f04212c17e8fe05c85aaac8baeac4cd241544'
            'SKIP')
validpgpkeys=("1CB27DBC98614B2D5841646D08302DB6A2670428")

build() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  ./configure --prefix=/usr --sysconfdir=/etc \
    --with-openssl=no \
    --with-ssl=gnutls \
    --without-libhsts \
    --without-libidn \
    --without-pcre
  make
}

check() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  make check
}


package() {
  cd "${srcdir}"/${pkgname}-${pkgver}

  make DESTDIR="$pkgdir/" install

  # AFAICT wget2_noinstall is meant run `make check` before installing
  # wget2 itself. Normally, wget2 links to libwget, which is located
  # in /usr/lib and thus can't be resolved before wget2 is actually
  # installed.
  rm -f "$pkgdir/usr/bin/wget2_noinstall"
}

# vim:set ts=2 sw=2 tw=0 et:
