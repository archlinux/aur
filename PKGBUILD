# Maintainer: Albert Mikaelyan <tahvok at gmail dot com>

pkgname=gridcoinresearchd-staging
pkgver=3.5.8.8.r847.c7aabaf
pkgrel=1
pkgdesc="GridCoin is a cryptocurrency that helps science via BOINC - daemon"
depends=('boost-libs' 'libzip' 'miniupnpc' 'curl' 'boinc')
makedepends=('boost' 'git' 'db')

replaces=('gridcoinresearch-daemon-git')
conflicts=('gridcoinresearch-daemon-git' 'gridcoinresearchd' 'gridcoinresearchd-git' 'gridcoinresearchd-dev')

arch=('i686' 'x86_64' 'armv7h')
url="http://gridcoin.us"
license=('custom:gridcoin')

_sourcename="${pkgname%d-staging}"

source=('gridcoinresearch::git+https://github.com/gridcoin/Gridcoin-Research.git#branch=staging'
        '0001-Openssl-1.1.0-185.patch')

sha256sums=('SKIP'
          '6aec7fc3612444cdf5b837c82177268f29aba4f9b6bb4a8c47a7d6fca831b42c')

pkgver() {
  cd "$srcdir/$_sourcename"

  printf "%s.r%s.%s" \
    "$(grep CLIENT_VERSION src/clientversion.h | awk '{print $NF}' | sed ':a;N;$!ba;s/\n/./g')" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  mkdir -p "$srcdir/$_sourcename/src/obj"

  chmod 755 "$srcdir/$_sourcename/src/leveldb/build_detect_platform"

  cd "$srcdir/$_sourcename"
  patch -Np1 -i "$srcdir/0001-Openssl-1.1.0-185.patch"
}

build() {
  cd "$srcdir/$_sourcename/src"

  make -f makefile.unix DEBUGFLAGS="" USE_UPNP=1
}

package() {
  cd "$srcdir/$_sourcename/src"

  install -Dm755 gridcoinresearchd "$pkgdir/usr/bin/gridcoinresearchd"
  install -Dm644 ../COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

