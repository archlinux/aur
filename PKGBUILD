# Maintainer: sum01 <sum01@protonmail.com>
pkgname=('vcash')
pkgver=0.6.0.4
_opensslver=1.0.2k
_boostver=1_53_0
_dbver=6.1.29.NC
_toolset="gcc-5"
pkgrel=3
pkgdesc="A decentralized currency for the internet."
arch=('i686' 'x86_64')
url="https://github.com/openvcash/vcash"
license=('AGPL3')
depends=('gcc5' 'python')
makedepends=('sed' 'coreutils' 'make')
source=("https://github.com/openvcash/vcash/archive/$pkgver.tar.gz"
"https://www.openssl.org/source/openssl-$_opensslver.tar.gz"
"https://sourceforge.net/projects/boost/files/boost/1.53.0/boost_$_boostver.tar.gz"
"http://download.oracle.com/berkeley-db/db-$_dbver.tar.gz")
sha256sums=('d72213fbecbe078e039d5a166fcba1bafe31fd17016ed4975b82894745786a2d'
'6b3977c61f2aedf0f96367dcfb5c6e578cf37e7b8d913b4ecb6643c3cb88d8c0'
'7c4d1515e0310e7f810cbbc19adb9b2d425f443cc7a00b4599742ee1bdfd4c39'
'e3404de2e111e95751107d30454f569be9ec97325d5ea302c95a058f345dfe0e')
prepare(){
  sed -i "s/gcc/$_toolset/g" "$srcdir/$pkgname-$pkgver/coin/Jamfile"
  sed -i "s/gcc/$_toolset/g" "$srcdir/$pkgname-$pkgver/database/Jamfile"
  sed -i "s/gcc/$_toolset/g" "$srcdir/$pkgname-$pkgver/crawler/Jamfile"
}
build() {
  mkdir -p "$srcdir/$pkgname"
  mv "$srcdir/$pkgname-$pkgver" "$srcdir/$pkgname/src"
  mkdir -p "$srcdir"/$pkgname/src/{coin/test,deps/{openssl,db}}/
  _threads=$(nproc)
  if [[ $_threads > 1 ]]; then
    let _threads=$_threads-1
  fi
  cd "$srcdir/openssl-$_opensslver/"
  ./config threads no-comp --prefix="$srcdir/$pkgname/src/deps/openssl/"
  make -j$_threads depend && make -j$_threads && make install && touch "$srcdir/$pkgname/src/deps/openssl/current_openssl_$_opensslver"
  cd "$srcdir/db-$_dbver/build_unix/"
  ../dist/configure --enable-cxx --disable-shared --prefix="$srcdir/$pkgname/src/deps/db/"
  make -j$_threads && make install && touch "$srcdir/$pkgname/src/deps/db/current_db_$_dbver"
  mv "$srcdir/boost_$_boostver" "$srcdir/$pkgname/src/deps/boost"
  cd "$srcdir/$pkgname/src/deps/boost/"
  ./bootstrap.sh
  sed -i "s/gcc/$_toolset/g" "$srcdir/$pkgname/src/deps/boost/project-config.jam"
  ./bjam -j$_threads link=static toolset=$_toolset cxxflags=-std=gnu++0x --with-system release &
	touch "$srcdir/$pkgname/src/deps/boost/current_boost_$_boostver"
  cd "$srcdir/$pkgname/src/coin/test/"
  ../../deps/boost/bjam -j$_threads toolset=$_toolset cxxflags=-std=gnu++0x hardcode-dll-paths=false release
  cd "$srcdir/$pkgname/src/coin/test/bin/$_toolset/release/link-static/"
  strip "$srcdir/$pkgname/src/coin/test/bin/$_toolset/release/link-static/stack"
  cp "$srcdir/$pkgname/src/coin/test/bin/$_toolset/release/link-static/stack" "$srcdir/$pkgname/vcashd"
}
package() {
  cd "$srcdir/"
  mkdir -p "$pkgdir"/usr/{lib,bin}/
  chmod 755 $pkgname/vcashd
  mv $pkgname "$pkgdir/usr/lib/$pkgname"
  ln -s /usr/lib/$pkgname/vcashd "$pkgdir/usr/bin/vcash"
}
