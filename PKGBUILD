# Maintainer: Lukas Heiligenbrunner <lukas.heiligenbrunner@gmail.com>
#
# Separate from aurcache-server rather than a split package: the two share
# almost no dependencies -- a build machine wants devtools and none of the
# server -- and makepkg cannot build one half of a split, which the container
# images need.

pkgname=aurcache-worker
pkgver=0.5.0
pkgrel=1
pkgdesc="Remote build worker for AURCache"
# armv7h is deliberately absent: its cross toolchain is not in Arch's official
# repositories, only aarch64's is. Adding it means the AUR toolchain or an
# emulated build.
arch=(x86_64 aarch64 armv7h)
url="https://github.com/Lukas-Heiligenbrunner/AURCache"
license=(GPL-3.0-or-later)

# devtools is what the worker shells out to, and it already brings fakeroot,
# sudo, git, openssh, binutils and the VCS tools. python runs the patch that
# confines the two places a PKGBUILD executes outside the chroot.
#
# Deliberately not base-devel: the compiler toolchain is installed inside each
# build's chroot by `mkarchroot ... base-devel`, never on the host. The host
# only downloads and verifies sources, which devtools covers.
depends=(gcc-libs devtools python aurcache-sandbox)
makedepends=(cargo git)
# Cross-compiling to aarch64 additionally needs aarch64-linux-gnu-gcc; build()
# says so if it is missing. It is not in makedepends because it is only needed
# for a build this PKGBUILD does not do by default.
optdepends=('openssh: git+ssh sources')
backup=(etc/aurcache/worker.env etc/aurcache/sandbox-protected)
install=aurcache-worker.install
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
    _aurcache_cargo_build -p aurcache-worker
}

check() {
    source "$srcdir/$_srcdir/packaging/common.sh"
    cd "$_srcdir/backend"
    _aurcache_cargo_check
}

package() {
    source "$srcdir/$_srcdir/packaging/common.sh"
    cd "$_srcdir"
    packaging/install-files.sh worker "$pkgdir" "$PWD" "backend/$(_aurcache_release_dir)"
}
