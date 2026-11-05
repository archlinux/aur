# Maintainer: Javier Tia <floss@jetm.me>
# Based on the Arch Linux sccache PKGBUILD by Maxime Gauduin <alucryd@archlinux.org>

# sccache with the sccache-dist changes that make distributed compilation work for
# OpenEmbedded/Yocto and kernel builds. The upstream release is the source and the
# changes are applied on top as a patch in prepare(), so a release that no longer takes
# the patch fails the build there instead of shipping a silently different sccache.
#
#   0001, 0002  jetm/sccache carry-cleanups: v0.19.0 plus 72 commits, split in two files
#         in commit order (part1 = the first 38, part2 = the last 34) because the AUR
#         rejects any file over 488 KiB and the whole carry is 653 KiB. They apply in order
#         in prepare(). The work behind mozilla/sccache#2776 and #2777 and the scheduler,
#         packaging and rust/gcc dist fixes not yet sent upstream, then the review and defect
#         fixes on top of carry/0.19.0. Regenerate by taking
#         git format-patch --stdout <release>..<rebased carry branch>
#         and cutting it at a commit boundary so each part stays well under 450000 bytes.
#
#         The last two commits (the end of part2) are mozilla/sccache#2795 (open, by Benjamin Leggett), which
#         makes sources with .incbin or .include directives hash the files they pull in:
#         without it a kernel build is served the previous build's certs/system_certificates.o.
#         They replace an earlier narrower carry fix. Drop both when #2795 or an equivalent
#         lands in a release; the rebase then conflicts on src/compiler/c.rs, which is expected.
#
# On a new upstream release: rebase the carry branch onto it, regenerate 0001 and
# rebuild. A patch that fails to apply stops the build, which is how to find out what
# the release changed.
#
# Open upstream speedup PRs were measured on top of this on the kernel build and left
# out: #2718 (fifo jobserver), #2938, #2940, #2936 and #2901 gave no gain (cold 519-538 s
# against 499-508 s without them; warm 480 s against 478 s). Their patches are in git
# history at 9accb64 if a later release makes them worth another look.
#
# It conflicts with and provides sccache, so it replaces the distro package.

pkgname=sccache-jetm
_upstream=sccache
_target=x86_64-unknown-linux-gnu
pkgver=0.19.0
pkgrel=6
pkgdesc='Shared compilation cache - build with distributed-compile fixes'
arch=(x86_64)
url=https://github.com/mozilla/sccache
license=(Apache-2.0)
depends=(
  gcc-libs
  glibc
  openssl
)
makedepends=(
  cargo
  patch
)
optdepends=(
  'memcached: Memcached support'
  'valkey: Redis support'
)
provides=("sccache=$pkgver")
conflicts=(sccache)
options=(!lto)
_patches=(
  0001-jetm-carry-part1.patch
  0002-jetm-carry-part2.patch
)
source=(
  "$_upstream-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "${_patches[@]}"
)
# Same order as source=(): the release tarball, then the two carry patch parts.
# updpkgsums rewrites this array on every bump and drops any comment inside
# it, so the labels live up here instead.
sha256sums=('2da079033cd19fd8e2a09f56f9a7d9d1a72d591ff3acdc47d95b920145cf2671'
            'd3a01041e9f79eea85be1e572926ab1e7277c1f635d28e4d0464d6347911dbf2'
            'c9d83dd54f54d2a7bfcf3468beb8d46c418c0aa03cfd34856641ae92e0376c41')

prepare() {
  cd "$_upstream-$pkgver"
  local p
  for p in "${_patches[@]}"; do
    msg2 "applying $p"
    patch -Np1 -i "$srcdir/$p"
  done
  cargo fetch --locked
}

build() {
  cd "$_upstream-$pkgver"

  # Use debug
  export CARGO_PROFILE_RELEASE_DEBUG=2 CARGO_PROFILE_RELEASE_STRIP=false

  # Use LTO
  export CARGO_PROFILE_RELEASE_LTO=true CARGO_PROFILE_RELEASE_CODEGEN_UNITS=1

  # Cluster fix: target znver4 (Zen 4) so the binary runs on both the Zen 5
  # scheduler/build host and the Zen 4 build node. A native (znver5) build
  # SIGILLs on Zen 4. znver5 is ISA-backward-compatible with znver4.
  #
  # --target keeps RUSTFLAGS off build scripts and proc macros, which run on the
  # build host. Without it they are compiled for znver4 too and SIGILL on any
  # other CPU, as the GitHub runner did on the first CI build.
  RUSTFLAGS="${RUSTFLAGS} -C target-cpu=znver4" \
    cargo build --release --frozen --features all,dist-server --target "$_target"
}

package() {
  cd "$_upstream-$pkgver"
  install -Dt "$pkgdir/usr/bin" "target/$_target/release/"sccache{,-dist}
  install -Dt "$pkgdir/usr/share/doc/$pkgname" -m644 README.md docs/*
}

# vim:set sw=2 sts=-1 et:
