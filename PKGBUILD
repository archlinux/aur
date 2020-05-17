pkgname=nsis
pkgver=3.05
pkgrel=1
pkgdesc='A professional open source system to create Windows installers'
arch=('x86_64')
url='http://nsis.sourceforge.net'
license=('custom:zlib')
depends=('gcc-libs')
makedepends=('scons' 'mingw-w64-gcc' 'mingw-w64-zlib')
options=(!strip)
source=(http://downloads.sourceforge.net/project/nsis/NSIS%203/$pkgver/$pkgname-$pkgver-src.tar.bz2)
sha256sums=('b6e1b309ab907086c6797618ab2879cb95387ec144dab36656b0b5fb77e97ce9')

prepare() {
  cd "$srcdir/$pkgname-$pkgver-src"
  curl -L https://github.com/kichik/nsis/pull/9.patch | patch -p1
  curl -L https://github.com/kichik/nsis/pull/12.patch | patch -p1

  # stub_bzip2-x86-ansi/decompress.o:decompress.c:(.text+0x445): undefined reference to `memmove'
#   sed -i "s|defenv\['NODEFLIBS_FLAG'\] = '-nostdlib -Wl,--exclude-libs,msvcrt.a'|defenv\['NODEFLIBS_FLAG'\] = '-nostdlib -lmsvcrt'|g" SCons/Config/gnu
  sed -i "s|ole32|ole32 msvcrt|g" Source/exehead/SConscript
}

build() {
  cd "$srcdir/$pkgname-$pkgver-src"
  scons VERSION=$pkgver PREFIX=/usr PREFIX_CONF=/etc SKIPUTILS='NSIS Menu' STRIP_CP=false ZLIB_W32=/usr/i686-w64-mingw32/ NSIS_MAX_STRLEN=8192 NSIS_CONFIG_LOG=yes
}

package() {
  cd "$srcdir/$pkgname-$pkgver-src"
  scons VERSION=$pkgver PREFIX=/usr PREFIX_CONF=/etc SKIPUTILS='NSIS Menu' STRIP_CP=false ZLIB_W32=/usr/i686-w64-mingw32/ NSIS_MAX_STRLEN=8192 NSIS_CONFIG_LOG=yes PREFIX_DEST="$pkgdir" install
  install -Dm644 ${srcdir}/$pkgname-$pkgver-src/Docs/src/license.but "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
