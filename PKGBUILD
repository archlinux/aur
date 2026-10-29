# Maintainer: AlphaJack <alphajack at tuta dot io>

pkgname="cre2"
pkgver=0.3.6
pkgrel=3
pkgdesc="C language wrapper for RE2, the regular expressions library from Google"
arch=("x86_64" "aarch64")
url="https://github.com/marcomaggi/cre2"
license=("BSD-3-Clause")
depends=("gcc-libs" "glibc" "re2")
makedepends=("autoconf" "autoconf-archive" "automake" "libtool")
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('faae21540e7889b811263942726aa1edce6b8d42c37e15d8e211da8a1a3bc43b')

prepare(){
 cd "$pkgname-$pkgver"
 # current re2 is built on abseil and needs C++17, the bundled macro only knows 11 and 14
 cp /usr/share/aclocal/ax_cxx_compile_stdcxx.m4 meta/autoconf/m4_ax_cxx_compile_stdcxx.m4
 sed -i 's/AX_CXX_COMPILE_STDCXX_11(noext,mandatory)/AX_CXX_COMPILE_STDCXX(17,noext,mandatory)/' configure.ac
 # the release lacks the helper generating version.texi, skip the info manual
 sed -i '/^info_TEXINFOS/d; /^doc_cre2_TEXINFOS/d' Makefile.am
 autoreconf -fi
}

build(){
 cd "$pkgname-$pkgver"
 ./configure --prefix=/usr --disable-static
 make
}

package(){
 cd "$pkgname-$pkgver"
 make DESTDIR="$pkgdir" install
 install -D -m 644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname"
}
