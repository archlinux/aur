# Maintainer: Lukas Heiligenbrunner <lukas.heiligenbrunner@gmail.com>
#
# The legacy Docker build executor, packaged separately from aurcache-worker
# because it needs none of what that package needs: it delegates each build to
# a container over the Docker socket, so there is no devtools, no chroot, no
# patched makechrootpkg and no sudo. Kept in its own package for the same
# reason it is kept in its own crate -- retiring this build strategy should be
# a deletion, not a refactor.
#
# **Deprecated.** New deployments should use aurcache-worker, which builds in a
# devtools chroot. This exists so the hybrid image can install what it runs
# rather than copying a loose binary in.

pkgname=aurcache-worker-docker
pkgver=0.5.0
pkgrel=1
pkgdesc="Legacy Docker build executor for AURCache (deprecated)"
arch=(x86_64 aarch64 armv7h)
url="https://github.com/Lukas-Heiligenbrunner/AURCache"
license=(GPL-3.0-or-later)
# It speaks to the Docker socket directly through bollard, so it needs neither
# the docker CLI nor a local daemon -- the socket may well be the host's.
depends=(gcc-libs)
optdepends=('docker: to run builds against a local daemon'
            'podman: likewise, via its Docker-compatible socket')
makedepends=(cargo git)
# See the aurcache-worker PKGBUILD: !lto is load-bearing for the vendored C in
# aws-lc-sys and ring, and !strip because cargo does the stripping.
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
    _aurcache_cargo_build -p aurcache-worker-docker
}

check() {
    source "$srcdir/$_srcdir/packaging/common.sh"
    cd "$_srcdir/backend"
    _aurcache_cargo_check
}

package() {
    source "$srcdir/$_srcdir/packaging/common.sh"
    cd "$_srcdir"
    packaging/install-files.sh worker-docker "$pkgdir" "$PWD" "backend/$(_aurcache_release_dir)"
}
