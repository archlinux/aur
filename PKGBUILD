# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=gmssl-git
pkgver=r705.gf0dc2dce
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
        "ca-dir.patch::https://raw.githubusercontent.com/archlinux/svntogit-packages/packages/openssl/trunk/ca-dir.patch")
sha256sums=('SKIP'
            'SKIP')


prepare() {
  cd "GmSSL"

  patch -Np0 -i "$srcdir/ca-dir.patch"
  sed -i "s#'File::Glob' => qw/glob/;#'File::Glob' => qw/:glob/;#g" "Configure"
  sed -i "s#'File::Glob' => qw/glob/;#'File::Glob' => qw/:glob/;#g" "test/build.info"
}

pkgver() {
  cd "GmSSL"

  _rev=$(git rev-list --count --all)
  _hash=$(git rev-parse --short HEAD)
  printf "r%s.g%s" "$_rev" "$_hash"
}

build() {
  cd "GmSSL"

  ./config \
    --prefix="/usr" \
    --openssldir="/etc/ssl" \
    --libdir="lib"
  make
}

check() {
  cd "GmSSL"

  #make test
}

package() {
  cd "GmSSL"

  make \
    DESTDIR="$pkgdir" \
    MANSUFFIX="ssl" \
    install_sw \
    install_ssldirs \
    install_man_docs
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/gmssl"
}
