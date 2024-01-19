# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>
# Contributor: Thermi <noel[ at ] familie-kuntze.de>
# Submitter: nullie

pkgname=lsyncd
pkgver=2.3.1
pkgrel=7
pkgdesc="Live Syncing (Mirror) Daemon"
arch=(x86_64)
url="https://github.com/lsyncd/lsyncd"
license=(GPL-2.0-or-later)
depends=(
  glibc
  lua53
  rsync
)
makedepends=(
  asciidoc
  cmake
)
checkdepends=(
  lua53-posix
  openssh
)

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "lsyncd.service"
  "lsyncd.sysusers"
  "use-lua53.patch"
)
sha256sums=(
  '501f70368da8c43d3da81bf9bbb22f43dfcbc9f96b03c745842f326723c091c7'
  '254a7632ad70416e4be7df17ec902d69d927e2e09b7de8e68b07e6f65d22ccbc'
  'f3d6b6c1411de9f6c9a2980e41dcfb87ede9c02005ebb881878f399f062d825f'
  'ef55721553bdac0e3441ced58b9df1bb0d24f97513e66c12c3e94a477ba89115'
)

_archive="$pkgname-$pkgver"

prepare() {
  cd "$_archive"

  patch --forward --strip=1 --input="$srcdir/use-lua53.patch"
}

build() {
  cd "$_archive"

  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -Wno-dev
  cmake --build build
}

check() {
  cd "$_archive"

  # Lua dependency lua-crontab is not packaged. Link:
  # https://luarocks.org/modules/agladysh/lua-crontab
  sed --in-place '/cron-rsync.lua/d' CMakeLists.txt

  # SSH tests not functional if BUILDDIR is outside of home directory.
  sed --in-place '/exclude-rsyncssh.lua/d' CMakeLists.txt
  sed --in-place '/churn-rsyncssh.lua/d' CMakeLists.txt

  cmake --build build --target run-tests
}

package() {
  cd "$_archive"

  DESTDIR="$pkgdir" cmake --install build

  install -Dm664 -t "$pkgdir/usr/share/man/man1" "$pkgdir/man1/lsyncd.1"
  rm -rf "$pkgdir/man1"

  install -Dm644 -t "$pkgdir/usr/lib/systemd/system" "$srcdir/lsyncd.service"
  install -Dm644 -t "$pkgdir/usr/lib/sysusers.d" "$srcdir/lsyncd.sysusers"

  install -dm755 "$pkgdir/usr/share/doc/$pkgname"
  cp --archive --no-preserve=ownership "$pkgdir/usr/doc/examples" "$pkgdir/usr/share/doc/$pkgname/examples"
  rm -rf "$pkgdir/usr/doc"
}
