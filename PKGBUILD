# Maintainer: Mark Collins <tera_1225 hat hotmail ðot com>
# Contributor: Wilhelm Schuster <aur [aT] rot13 _dot_ io>
pkgname=wget2-no-docs
_name=wget2
pkgver=2.1.0
pkgrel=1
pkgdesc="Updated version of wget URL retrieval tool, no docs (avoids pandoc makedep)"
arch=('i686' 'x86_64')
url="https://gitlab.com/gnuwget/wget2"
license=('GPL-3.0-only')
depends=(
  'glibc'
  'pcre2'
  'libidn2'
  'zstd'
  'brotli'
  'xz'
  'zlib'
  'gpgme'
  'bzip2'
  'libnghttp2'
  'libpsl'
  'gnutls'
  'lzip'
  'ca-certificates'
)
checkdepends=('libmicrohttpd')
makedepends=(
  'gperf'
  'python'
  'doxygen'
)
conflicts=("$_name-git" "$_name")
provides=("$_name")
source=("https://ftp.gnu.org/gnu/wget/${_name}-${pkgver}.tar.gz"{,.sig})
sha256sums=('a05dc5191c6bad9313fd6db2777a78f5527ba4774f665d5d69f5a7461b49e2e7'
            'SKIP')
validpgpkeys=("1CB27DBC98614B2D5841646D08302DB6A2670428")

build() {
  cd "${srcdir}"/${_name}-${pkgver}

  ./configure --prefix=/usr --sysconfdir=/etc \
    --with-openssl=no \
    --with-ssl=gnutls \
    --without-libhsts \
    --without-libidn \
    --without-pcre \
    --without-docs
  make
}

check() {
  cd "${srcdir}"/${_name}-${pkgver}

  make check
}


package() {
  cd "${srcdir}"/${_name}-${pkgver}

  make DESTDIR="$pkgdir/" install

  # AFAICT wget2_noinstall is meant run `make check` before installing
  # wget2 itself. Normally, wget2 links to libwget, which is located
  # in /usr/lib and thus can't be resolved before wget2 is actually
  # installed.
  rm -f "$pkgdir/usr/bin/wget2_noinstall"
}

