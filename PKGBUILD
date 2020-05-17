pkgname=nsis2
pkgver=2.51
pkgrel=1
pkgdesc='A professional open source system to create Windows installers'
arch=('x86_64')
url='http://nsis.sourceforge.net'
license=('custom:zlib')
depends=('gcc-libs')
makedepends=('python2-scons' 'mingw-w64-gcc')
provides=('nsis')
conflicts=('nsis')
options=(!strip)
source=(http://downloads.sourceforge.net/project/nsis/NSIS%202/$pkgver/nsis-$pkgver-src.tar.bz2
        nsis-2.43-64bit-fixes.patch
        nsis-2.45-static-libgcc.patch
        nsis-2.46-missing-unistd-include.patch
        nsis-2.46-static-libstdc++.patch
        nsis-add-mingw-w64-support.patch
        nsis-948074.patch)
md5sums=('002538226a72a38ba1abb0d5d4ffdc45'
         '9eead3b78da54e3afda8f6a5b663aea9'
         '28f1002dd3c6a57cd3e1f8bb09c81fc5'
         'c4f912f0ca7fa455948f9f6a73314d93'
         '3d41bf574cd3bed0c4f14afca9bc4819'
         'd72c910fa1e9b8372fadf1ba905139ab'
         '9b94bfb75b4dcfd3872c7fa2573d2ee5')

prepare() {
  cd "$srcdir/nsis-$pkgver-src"
  # http://pkgs.fedoraproject.org/cgit/mingw-nsis.git/tree/
  patch -p1 -i "$srcdir/nsis-2.43-64bit-fixes.patch"
  patch -p1 -i "$srcdir/nsis-2.45-static-libgcc.patch"
  patch -p1 -i "$srcdir/nsis-2.46-missing-unistd-include.patch"
  patch -p1 -i "$srcdir/nsis-2.46-static-libstdc++.patch"
  patch -p1 -i "$srcdir/nsis-add-mingw-w64-support.patch"

  # https://bugzilla.redhat.com/show_bug.cgi?id=948074
  patch -p1 -i "$srcdir/nsis-948074.patch"

  # https://github.com/kichik/nsis/pull/4
  sed -i "s|__attribute__((__stdcall__))|\"__attribute__((__stdcall__))\"|g" SCons/Config/gnu

  # https://github.com/kichik/nsis/pull/12
  sed -i "s|const char \*const version;|extern const char \*const version;|g" Docs/src/bin/halibut/halibut.h

  # stub_bzip2-x86-ansi/decompress.o:decompress.c:(.text+0x445): undefined reference to `memmove'
  sed -i "s|defenv\['NODEFLIBS_FLAG'\] =|#defenv\['NODEFLIBS_FLAG'\] =|g" SCons/Config/gnu
}

build() {
  cd "$srcdir/nsis-$pkgver-src"
  scons2 VERSION=$pkgver PREFIX=/usr PREFIX_CONF=/etc SKIPUTILS='NSIS Menu' STRIP_CP=false
}

package() {
  cd "$srcdir/nsis-$pkgver-src"
  scons2 VERSION=$pkgver PREFIX=/usr PREFIX_CONF=/etc SKIPUTILS='NSIS Menu' STRIP_CP=false PREFIX_DEST="$pkgdir" install
  install -Dm644 ${srcdir}/nsis-$pkgver-src/Docs/src/license.but "$pkgdir/usr/share/licenses/nsis/LICENSE"
}
