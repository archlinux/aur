# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gmssl-git
pkgver=2.0.r28.g25d4ff1
pkgrel=1
pkgdesc="Chinese national cryptographic algorithms and protocols"
arch=('i686' 'x86_64')
url="http://gmssl.org/"
license=('custom')
depends=('perl')
makedepends=('git')
provides=('gmssl')
conflicts=('gmssl' 'openssl')
options=('staticlibs')
source=("git+https://github.com/guanzhi/GmSSL.git"
        "ca-dir.patch::https://git.archlinux.org/svntogit/packages.git/plain/trunk/ca-dir.patch?h=packages/openssl")
sha256sums=('SKIP'
            'SKIP')


prepare() {
  cd "GmSSL"

  patch -Np0 -i "$srcdir/ca-dir.patch"
}

pkgver() {
  cd "GmSSL"

  git describe --long --tags | sed 's/^gmssl-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "GmSSL"

  ./config --prefix="/usr" --openssldir="/etc/ssl" --libdir="lib"
  make
}

check() {
  cd "GmSSL"

  #make test
}

package() {
  cd "GmSSL"

  make DESTDIR="$pkgdir" MANSUFFIX="ssl" install_sw install_ssldirs install_man_docs
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
