# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
# Contributor: Mick Elliot <micke at sfu dot ca>
pkgname=ncbi-toolkit
pkgver=25.2.0
_pkgver=${pkgver//./_}
pkgrel=2
pkgdesc="Applications, scripts and C++ libraries for the analysis of biological data"
arch=('i686' 'x86_64')
url="https://ncbi.github.io/cxx-toolkit/"
license=('custom')
depends=('python' 'pcre' 'sqlite' 'lzo' 'libtiff' 'giflib' 'libxpm'
         'mariadb-libs' 'libpng' 'gnutls' 'libxml2' 'libxslt')
optdepends=('fltk' 'wxgtk' 'fcgi')
makedepends=('autoconf' 'cpio')
provides=('blast+-bin')
conflicts=('blast+-bin')
source=(https://ftp.ncbi.nlm.nih.gov/toolbox/ncbi_tools++/2021/Sep_30_2021/ncbi_cxx--$_pkgver.tar.gz
        LICENSE)
sha256sums=('9f824a92750e64e7b9be98d82b84414ab4f7e5d73392dadbb87c94ff5ccf9111'
            '78bbf3f310ff43f1b5f711e7221d51da1e6f055831bd6c6941e0650bf1261df2')

build() {
  # https://ncbi.github.io/cxx-toolkit/pages/ch_config#ch_config.UNIX
  FLAGS="\
    --without-debug \
    --with-bin-release \
    --with-dll \
    --without-static \
    --with-optimization \
    --with-autodep \
    --with-mt \
    --prefix=/usr \
    --with-build-root=$srcdir/build
    --without-bdb \
    --without-internal \
    --without-boost" # current version in repo not compatible

  if [ $CARCH = "x86_64" ]; then
    FLAGS="$FLAGS --with-64"
  fi

  cd "$srcdir/ncbi_cxx--$_pkgver"
  rm -f "$srcdir"/build/inc/ncbiconf_unix.h # in case of previous build
  ./configure $FLAGS
  make
}

package() {
  cd "$srcdir/ncbi_cxx--$_pkgver"
  install -Dm644 "$srcdir"/LICENSE "$pkgdir"/usr/share/licenses/$pkgname/license
  make prefix="$pkgdir"/usr libdir="$pkgdir"/usr/lib install
  find "$pkgdir"/usr/bin -name "*test*" -delete
}
