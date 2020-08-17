# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=lftp-git
pkgver=4.9.2.r0.g586b2562
pkgrel=2
pkgdesc="Sophisticated file transfer program"
arch=('i686' 'x86_64')
url="https://lftp.yar.ru/"
license=('GPL3')
depends=('expat' 'gnutls' 'hicolor-icon-theme' 'libidn2' 'readline')
makedepends=('git' 'gperf')
optdepends=('perl' 'sh')
provides=('lftp')
conflicts=('lftp')
backup=('etc/lftp.conf')
source=("git+https://github.com/lavv17/lftp.git"
        "autoconf_bump.patch::https://github.com/lavv17/lftp/commit/df0b2b8e4fb3f334114651d9d7b8be5f8e738375.patch")
sha256sums=('SKIP'
            '3838c1964d40fec4a8738513a40e4b593c849dfc0675dd0a45467a14285a3c9c')


prepare() {
  cd "lftp"

  patch -Np1 -i "$srcdir/autoconf_bump.patch"
}

pkgver() {
  cd "lftp"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "lftp"

  ./bootstrap
  ./configure \
    --prefix="/usr" \
    --disable-static
  make -k || true  # ignore errors temporarily
}

check() {
  cd "lftp"

  make check
}

package() {
  cd "lftp"

  make DESTDIR="$pkgdir" install
  rm -rf "$pkgdir/usr/lib"
}
