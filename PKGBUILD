# Maintainer: Lukas Heiligenbrunner <lukas.heiligenbrunner@gmail.com>
#
# The Landlock confiner, packaged on its own because both the server and the
# worker need it and pacman refuses to install two packages that ship the same
# path -- identical contents are no exemption. A shared dependency is the
# idiomatic answer to one file two packages need.
#
# It confines the places AURCache executes a PKGBUILD: the server sources one
# to parse it, and makechrootpkg runs two hooks outside the chroot.

pkgname=aurcache-sandbox
pkgver=0.5.0
pkgrel=1
pkgdesc="Landlock sandbox used by AURCache to confine PKGBUILD execution"
arch=(x86_64 aarch64 armv7h)
url="https://github.com/Lukas-Heiligenbrunner/AURCache"
license=(GPL-3.0-or-later)
depends=(gcc-libs)
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
    _aurcache_cargo_build -p aurcache-sandbox
}

check() {
    source "$srcdir/$_srcdir/packaging/common.sh"
    cd "$_srcdir/backend"
    _aurcache_cargo_check
}

package() {
    source "$srcdir/$_srcdir/packaging/common.sh"
    cd "$_srcdir"
    packaging/install-files.sh sandbox "$pkgdir" "$PWD" "backend/$(_aurcache_release_dir)"
}
