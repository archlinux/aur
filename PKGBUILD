# Maintainer: Darren Ng <$(base64 --decode <<<'VW4xR2ZuQGdtYWlsLmNvbQo=')>
# Contributor: Andrei Alexeyev <akari AT alienslab.net>

# # Double pound in case of being parsed
# # shellcheck -e SC2034,SC2164 -s bash PKGBUILD

_target_triplet=aarch64-apple-darwin

pkgname=theos-cctools-aarch64-git
pkgdesc="Apple cctools port for Linux (theos,ios,aarch64)"
pkgver=r262.3051881
pkgrel=3
arch=(x86_64)
url="https://github.com/tpoechtrager/cctools-port"
license=(custom:APSL)
depends=(
  #
  theos
  #
  'clang>=3.4'
  llvm
  util-linux-libs
  #
  libbsd              # aarch64-apple-darwin-vtool -> /usr/lib/libbsd.so.0
  tapi-git            # .tdb stubs
  uuid                # ld64 -random_uuid support
  xar-tpoechtrage-git # ld64 -bitcode_bundle support
  #
)
makedepends=(git)
# "theos-git" optionally depends on "theos-ios-toolchain"
provides=(
  theos-ios-toolchain{,-git}
  "$_target_triplet"-binutils{,-git}
  theos-cctools-aarch64
)
conflicts=(${provides[*]})
source=("git+https://github.com/tpoechtrager/cctools-port.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/cctools-port/"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
cd "$srcdir/cctools-port/cctools/ld64/src/ld/"
patch --verbose Snapshot.cpp <<"EOP"
--- Snapshot.cpp
+++ Snapshot.cpp
@@ -16,7 +16,7 @@
 #include <sys/stat.h>
 #include <libgen.h>
 #include <time.h>
-#include <Block.h>
+#include <BlocksRuntime/Block.h>
 
 #include "Snapshot.h"
 #include "Options.h"
EOP
}

build() {
  cd "$srcdir/cctools-port/cctools"
  autoupdate -v
  # configure.ac:479: warning: AC_C_BIGENDIAN should be used with AC_CONFIG_HEADERS
  NOCONFIGURE=1 ./autogen.sh
  # Target triplet parsed by "$srcdir/cctools-port/cctools/config.sub"
  ./configure \
    \
    --prefix=/usr/ \
    --libexecdir=/usr/lib/$pkgname/ \
    --mandir=/usr/share/man/ \
    \
    --target="$_target_triplet" \
    \
    --enable-lto-support \
    --enable-xar-support \
    --enable-tapi-support \
    --with-llvm-config=/usr/bin/llvm-config \
    --with-libxar \
    --with-libtapi
  make
}

# makepkg --noextract --holdver --install --repackage
package() {

  # Install
  cd "$srcdir/cctools-port/cctools"
  make DESTDIR="$pkgdir" install
  install -v -Dm644 APPLE_LICENSE "$pkgdir/usr/share/licenses/$pkgname/APPLE_LICENSE"

  # Compat symlinks to make theos happy
  local _symlinkdir="$pkgdir/opt/theos/toolchain/linux/iphone/bin"
  mkdir -pv "$_symlinkdir"
  cd "$pkgdir/usr/bin"
  for _i in *; do
    ln -sfv "/usr/bin/$_i" "$_symlinkdir/${_i#${_target_triplet}-}"
  done

}
