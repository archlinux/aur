# Maintainer: Javier Tia <floss@jetm.me>
# Based on the Arch Linux sccache PKGBUILD by Maxime Gauduin <alucryd@archlinux.org>

# sccache with the sccache-dist changes that make distributed compilation work for
# OpenEmbedded/Yocto and kernel builds. The upstream release is the source and the
# changes are applied on top as a patch in prepare(), so a release that no longer takes
# the patch fails the build there instead of shipping a silently different sccache.
#
#   0001  jetm/sccache carry: the net diff of the rebased carry branch against the
#         release, git diff v0.20.1 <carry> from fork/followup/carry-review-items. It is a
#         merge result, not a commit series, and a single file of about 438 KB, under the
#         488 KiB the AUR rejects above. It holds the work behind mozilla/sccache#2776 and
#         #2777 and the scheduler, packaging and rust/gcc dist fixes not yet sent upstream,
#         then the review and defect fixes on top.
#
#         It also holds mozilla/sccache#2795 (open, by Benjamin Leggett), which makes sources
#         with .incbin or .include directives hash the files they pull in: without it a kernel
#         build is served the previous build's certs/system_certificates.o. That replaces an
#         earlier narrower carry fix, adds a clippy::question_mark fix for Rust 1.99, and makes
#         the scan skip comments: with the dist client's -frewrite-includes a kernel header
#         comment naming ".include <...>" otherwise made nearly every kernel compile
#         non-cacheable. Drop those parts when #2795 or an equivalent lands in a release; the
#         rebase then conflicts on src/compiler/c.rs.
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
pkgver=0.20.1
pkgrel=1
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
  0001-jetm-carry.patch
)
source=(
  "$_upstream-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
  "${_patches[@]}"
)
# Same order as source=(): the release tarball, then 0001-jetm-carry.patch.
# updpkgsums rewrites this array on every bump and drops any comment inside
# it, so the labels live up here instead.
sha256sums=('1568b19b3e9bcf911986670dbf92264100974319ddde0b1ccaeecfa82b953632'
            '3559bccd20eab692f01457ca90dfdffe34d5be7eb69fb592b3b440a9cce2fa1a')

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
