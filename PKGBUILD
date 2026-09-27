# Maintainer: Alexandre Bury <alexandre.bury@gmail.com>
#
# The client alone: a typed CLI for the HTTP API with no server, worker or
# build machinery. Separate from the other packages rather than a split
# package for the same reason they are separate from each other -- makepkg
# cannot build one half of a split, which the container images need -- and
# because its install closure is one binary plus gcc-libs.

pkgname=aurcache-cli
pkgver=0.6.0
pkgrel=2
pkgdesc="Typed CLI for the AURCache API"
arch=(x86_64 aarch64 armv7h)
url="https://github.com/gyscos/AURCache"
license=(GPL-3.0-or-later)
# The TLS stack is rustls over aws-lc-rs/ring (see aurcache-server), so
# nothing links libssl; gcc-libs is what the binary actually links (`ldd` on
# the built artifact, not guesswork).
depends=(gcc-libs)
makedepends=(cargo git)
# !lto because makepkg's LTO puts `-flto=auto` into CFLAGS, which the `cc` crate
# passes to the C in `aws-lc-sys` and `ring`. That yields GCC LTO bytecode in
# their static archives, and rustc links with `ld.lld`, which cannot read it --
# the build then fails at link with undefined `aws_lc_*` symbols and no error
# from the build script. Rust's own LTO is cargo's business regardless.
# !strip because stripping is done by cargo (see common.sh); makepkg would use
# the host's binutils, which cannot strip a foreign binary.
# !debug because debug packaging works by splitting out what `strip` removes;
# with !strip it produces nothing but an empty /usr/src/debug the package would
# then own for no reason.
options=(!strip !lto !debug)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')

_srcdir="AURCache-$pkgver"

prepare() {
    cd "$_srcdir/backend"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked
}

build() {
    source "$srcdir/$_srcdir/packaging/common.sh"
    cd "$_srcdir/backend"
    _aurcache_cargo_build -p aurcache-cli
}

package() {
    source "$srcdir/$_srcdir/packaging/common.sh"
    cd "$_srcdir"
    packaging/install-files.sh cli "$pkgdir" "$PWD" "backend/$(_aurcache_release_dir)"
}
