# Maintainer: sum01 <sum01@protonmail.com>
pkgname=('vcash')
pkgver=0.6.0.4
_opensslver=1.0.2k
_boostver=1_53_0
_dbver=6.1.29.NC
_toolset="gcc-5"
pkgrel=4
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
sha512sums=('95bf29d81aa4bebf37814c34b7fdc8ef2c1e2f2bfb7dc25036c4cc035e1121eba172bbe5c3c402f4db6293bf714ca3f7e1b870deaaf56243d407a02857e4dd6e'
'0d314b42352f4b1df2c40ca1094abc7e9ad684c5c35ea997efdd58204c70f22a1abcb17291820f0fff3769620a4e06906034203d31eb1a4d540df3e0db294016'
'1787ba1b156d5a40f027b401815e7bc5137f3aa52c8d457115154455b976f8abbb88dbb89d5876b23ddbf5761ad0d69f6b3d8267e7e885e6a73db69e15c3a75e'
'7c36bc78d7210dcb7735e421bfc6e21eda3235636f772ba9353cfdac04382fd98346a16684c663af23e01014b996ad0eb8a13d5f318cb22b764066a34c00b44b')
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
