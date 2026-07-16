# Maintainer: vantroy <vantroy@gmail.com>
#
# Source build (the plain package name): compiles the tagged release with the
# system Zig. A prebuilt binary package would be named zigoku-bin.
#
# Why the dependency handling below looks unusual: `zig build` normally fetches
# vaxis/zigimg/uucode over the network, but a clean-chroot build() has none. So
# the three Zig deps are declared as git sources (fetched in makepkg's download
# phase, where network is allowed), remapped in prepare() into a dir named by
# each dep's Zig content-hash, then resolved by `zig build --system` with
# fetching disabled. Builds cleanly with an empty ZIG_GLOBAL_CACHE_DIR.
#
# sqlite is not vendored: on Linux the build links the system libsqlite3
# (bundle-sqlite defaults off), so it's a runtime depends, not a build input.

pkgname=zigoku
pkgver=0.4.5
pkgrel=1
pkgdesc="Terminal anime browser & player"
arch=('x86_64' 'aarch64')
url="https://github.com/vantroy/zigoku"
license=('GPL-3.0-or-later')
depends=('sqlite' 'glibc' 'mpv')
# mpv is a runtime shell-out, not a linked lib, so namcap can't see it; it's
# declared by hand. sqlite + glibc are the actual ldd deps.
makedepends=('zig>=0.16' 'git')
# zigoku pins minimum_zig_version = 0.16.0. Zig is pre-1.0 and ships breaking
# changes between minors; if a future extra/zig outruns what this release builds
# against, pin makedepends to the matching version until the pkgver catches up.

# Zig content-hashes: these name the dirs `zig build --system` looks for, and
# come verbatim from each dep's build.zig.zon (zigoku's for vaxis+uucode, vaxis's
# for zigimg). Bump them in lockstep with the #commit pins in source=() below.
_vaxis_hash='vaxis-0.6.0-BWNV_GL1CQAHFfQHs_adjb8BKJyqW6njxz1IZr5yf-fW'
_zigimg_hash='zigimg-0.1.0-8_eo2oyaFwBZwJpmqPkCfVXWBrHcqbYwmrp1I6bTD3lI'
_uucode_hash='uucode-0.2.0-ZZjBPlK5VADj7fdoq7G8LIHzD5o6FSkcBXXrRWr4jnrA'

source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "vaxis::git+https://github.com/vantroy/libvaxis.git#commit=fbe8f695b2e68b4881fa7cd7dde65266f810f97b"
  "zigimg::git+https://github.com/zigimg/zigimg.git#commit=d695acd97c02e57bb151e8f659d1280f5cd6ca70"
  "uucode::git+https://github.com/jacobsandlund/uucode.git#commit=2826a37a4562284fdacd8fa029d49509cc9bffcd"
)
# git sources pin by commit, so their integrity anchor is the SHA, not a checksum.
sha256sums=(
  'e2173059255c11f4a3b60a96e14625abb74e8c0efe84b6e1da644d6a063df7d5'
  'SKIP'
  'SKIP'
  'SKIP'
)

prepare() {
  # Remap each vendored dep to the content-hash dir name `--system` expects.
  mkdir -p "$srcdir/zig-pkg"
  mv "$srcdir/vaxis"  "$srcdir/zig-pkg/$_vaxis_hash"
  mv "$srcdir/zigimg" "$srcdir/zig-pkg/$_zigimg_hash"
  mv "$srcdir/uucode" "$srcdir/zig-pkg/$_uucode_hash"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  # --system: fetching off, deps resolved from the vendored dir (chroot-safe).
  # -Dcpu=baseline: portable across the arch, never baking in the builder's CPU.
  # ReleaseSafe + -Dstrip: matches the release artifacts (safety checks kept).
  zig build \
    --system "$srcdir/zig-pkg" \
    -Dcpu=baseline \
    -Doptimize=ReleaseSafe \
    -Dstrip \
    --prefix "$srcdir/out"
}

package() {
  install -Dm755 "$srcdir/out/bin/zigoku" "$pkgdir/usr/bin/zigoku"
  install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  # Bundled libwebp is BSD-3 + patent grant; its notices must ship too.
  install -Dm644 "$srcdir/$pkgname-$pkgver/src/c/webp/COPYING" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE.libwebp"
  install -Dm644 "$srcdir/$pkgname-$pkgver/src/c/webp/PATENTS" \
    "$pkgdir/usr/share/licenses/$pkgname/PATENTS.libwebp"
}

# Zig strips via -Dstrip; keep makepkg's GNU strip off the finished binary
# (it has mangled Zig output before). See release.yml, which strips the same way.
# !debug: nothing to split out of an already-stripped binary, so skip the debug
# package, else devtools leaves an empty /usr/src/debug/zigoku (namcap W).
options=('!strip' '!debug')
