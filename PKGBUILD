# Maintainer: Lukas Heiligenbrunner <lukas.heiligenbrunner@gmail.com>
#
# Separate from aurcache-worker: the server needs no devtools, base-devel or
# sudo, and most build machines do not want a server. Both are installable
# together and share the `aurcache` user.

pkgname=aurcache-server
pkgver=0.5.0
pkgrel=1
pkgdesc="Build server and pacman repository for Arch Linux packages from the AUR"
arch=(x86_64 aarch64 armv7h)
url="https://github.com/Lukas-Heiligenbrunner/AURCache"
license=(GPL-3.0-or-later)
# alpm-pkgbuild-bridge is what `alpm-srcinfo` shells out to in order to parse a
# PKGBUILD; without it every package add fails. It is reached through a
# confining wrapper this package installs ahead of it on PATH -- see
# packaging/alpm-pkgbuild-bridge-wrapper.
# libgit2 and xz are what the binary actually links (`ldd` on the built
# artifact, not guesswork): libgit2-sys uses the system library when it finds
# one, which on Arch it does. openssl is deliberately absent -- the TLS stack
# here is rustls over aws-lc-rs/ring, and nothing links libssl.
depends=(gcc-libs libgit2 xz alpm-pkgbuild-bridge aurcache-sandbox)
# rust-wasm supplies the wasm32-unknown-unknown std the frontend compiles
# against, and wasm-bindgen-cli emits its JS glue. The latter is an AUR package
# and its version must match the `wasm-bindgen` crate in frontend-rs/Cargo.lock
# (0.2.127 today) -- wasm-bindgen refuses a mismatched pair outright, which is
# the one thing about this build that breaks on a version bump elsewhere.
makedepends=(cargo git libgit2 rust-wasm wasm-bindgen-cli)
backup=(etc/aurcache/server.env)
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
    # `static` embeds the web UI in the binary, which is what makes the native
    # install one unit with nothing to serve separately.
    _aurcache_cargo_build --features aurcache-api/static -p aurcache
}

check() {
    source "$srcdir/$_srcdir/packaging/common.sh"
    cd "$_srcdir/backend"
    _aurcache_cargo_check
}

package() {
    source "$srcdir/$_srcdir/packaging/common.sh"
    cd "$_srcdir"
    packaging/install-files.sh server "$pkgdir" "$PWD" "backend/$(_aurcache_release_dir)"
}
