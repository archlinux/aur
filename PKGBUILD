# Maintainer: Aleksej Kovura <aur-b1a3 at mekboy dot ru>

pkgname=pigz-replace-gzip-static
_pkgname=pigz
gzip_ver=1.14
pkgver=2.8
pkgrel=1
pkgdesc='Parallel gzip compressor, replaces gzip'
arch=('aarch64' 'x86_64')
url='https://www.zlib.net/pigz'
license=('custom')
makedepends=('zlib' 'musl' 'gcc' 'make' 'gzip')
optdepends=('diffutils: zdiff/zcmp support'
  'grep: zegrep/zfgrep/zforce/zgrep support'
  'less: zless support'
  'util-linux: zmore support'
  'sh: running zgrep, zless etc')
conflicts=('gzip' 'pigz')
provides=('gzip' 'pigz')
source=(https://www.zlib.net/$_pkgname/$_pkgname-$pkgver.tar.gz
  https://mirror.truenetwork.ru/gnu/gzip/gzip-${gzip_ver}.tar.gz
  makefile.patch)
sha256sums=('eb872b4f0e1f0ebe59c9f7bd8c506c4204893ba6a8492de31df416f0d5170fd0'
            '613d6ea44f1248d7370c7ccdeee0dd0017a09e6c39de894b3c6f03f981191c6b'
            'fd1d169755fe351de29461bff3063956bbecded4855c7ebed08e63a9c3ae1eb5')
prepare() {
  cd $_pkgname-$pkgver
  patch -p1 <../makefile.patch
  ln -s /usr/include/zconf.h
  ln -s /usr/include/zlib.h
  ln -s /usr/lib/libz.a
}
build() {
  make -C $_pkgname-$pkgver CFL="$CFLAGS" LDF="$LDFLAGS" -j $(nproc) pigz
}
check() {
  make -C $_pkgname-$pkgver test
}
package() {
  cd $_pkgname-$pkgver
  ./pigz pigz.1
  install -Dm644  -t "$pkgdir"/usr/share/man/man1 pigz.1.gz
  install -Dm644  -t "$pkgdir"/usr/share/licenses/$_pkgname README
  install -sDm755 -t "$pkgdir"/usr/bin pigz
  cd "$pkgdir"/usr/bin
  ln -s pigz gzip
  ln -s pigz unpigz
  cd "$pkgdir"/usr/share/man/man1/
  ln -s pigz.1.gz gzip.1.gz
  ln -s pigz.1.gz gunzip.1.gz
  cd "$srcdir"/gzip-${gzip_ver}
  ./configure --prefix="$pkgdir"/usr # "build" sh scripts to replace @STUFF@
  make install-binSCRIPTS
}
