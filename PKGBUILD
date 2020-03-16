# Maintainer: Darren Ng <$(base64 --decode <<<'ZGFycmVuMTk5NzA4MTBAZ21haWwuY29tCg==')>

# "Plagiarized" from
# https://packages.ubuntu.com/source/focal/pgtcl
# https://git.alpinelinux.org/aports/tree/main/pgtcl/APKBUILD
# https://github.com/OpenIndiana/oi-userland/blob/oi/hipster/components/tcl/pgtcl/Makefile

_pkgname=Pgtcl
pkgname=pgtcl
pkgver=2.7.1
pkgrel=2
pkgdesc="Tcl client side interface to PostgreSQL (libpgtcl)"
arch=("x86_64")
url="https://flightaware.github.io/Pgtcl/"
license=("BSD")
depends=("postgresql" "postgresql-libs" "tcl>=8.6" "tcl<8.7")
conflicts=("pgtcl-ng")
provides=("libpgtcl")
source=("$pkgname-$pkgver.tar.gz::https://github.com/flightaware/Pgtcl/archive/v$pkgver.tar.gz")
sha1sums=("edf384a2bc9ae05b9ffbc69735f7e4064c51a76e")

build() {

  cd "$_pkgname-$pkgver"

  # https://github.com/flightaware/Pgtcl/blob/master/README.Linux
  autoreconf

  # rpath
  # https://stackoverflow.com/a/8482308 

  # /usr/lib/tclConfig.sh

  ./configure \
    --prefix=/usr \
    --mandir=/usr/share/man \
    --with-tcl=/usr/lib/ \
    --with-tclinclude=/usr/include/ \
    --with-postgres-include=/usr/include/postgresql \
    --with-postgres-lib=/usr/lib/postgresql \
    --enable-64bit \
    --enable-threads \
    --enable-shared \
    --disable-rpath

  make

}

# Test HammerDB w/ pgtcl make'd but not installed
# https://wiki.tcl-lang.org/page/auto_path
# https://wiki.tcl-lang.org/page/TCLLIBPATH
# export LD_LIBRARY_PATH="/home/darren/.cache/yay/pgtcl/Pgtcl-2.7.1/tmp/usr/lib"
# export      TCLLIBPATH="/home/darren/.cache/yay/pgtcl/Pgtcl-2.7.1/tmp/usr/lib"

package() {
  cd "$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  rmdir "$pkgdir/usr/bin" || exit 1
}
