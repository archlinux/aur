# Maintainer: Darren Ng <$(base64 --decode <<<'VW4xR2ZuQGdtYWlsLmNvbQo=')>
# Contributor: Andrei Alexeyev <akari AT alienslab.net>

# # Double pound in case of being parsed
# # shellcheck -e SC2034,SC2164 -s bash PKGBUILD

_target_triplet=aarch64-apple-darwin

pkgname=theos-cctools-aarch64-git
pkgdesc="Apple cctools port for Linux (theos,ios,aarch64)"
pkgver=r321.856d7d1
pkgrel=1
arch=(x86_64)
url="https://github.com/tpoechtrager/cctools-port"
license=(custom:APSL)
depends=(
  util-linux-libs
)
makedepends=('clang>=3.4' git libdispatch tapi-git util-linux-libs)
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
