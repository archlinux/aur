# Maintainer: Nikolay Bryskin <nbryskin@gmail.com>
#
# libfprint-goodix53x5 from the goodix-533c-variant-ops branch, which adds the
# 27c6:533c sensor (Dell XPS 13 9310): seaweeduk/goodix53x5-libfprint#334.
# Built like packaging/arch/PKGBUILD.in, but from git with the pinned libfprint
# and fprintd as sources. Retired once 533c support lands in libfprint-goodix53x5.

pkgname=libfprint-goodix53x5-533c-git
_repo=goodix53x5-libfprint
_branch=goodix-533c-variant-ops
_libfprint_rev=0c97a47d8ef405cd577b87058c1e89cae9d242e7
_fprintd_rev=b54a007ccf58ac0ae074c7151b223f35cbd17306
pkgver=r340.5a05d2a
pkgrel=1
pkgdesc="Goodix 53x5 Milan fingerprint driver with 27c6:533c support from seaweeduk/goodix53x5-libfprint#334 (replaces fprintd)"
arch=('x86_64')
url="https://github.com/nikicat/$_repo"
license=('LGPL-2.1-or-later' 'GPL-2.0-or-later')
depends=('dbus' 'glib2' 'glibc' 'libdeflate' 'libgusb' 'openssl' 'pam' 'polkit'
         'systemd-libs')
makedepends=('git' 'glib2-devel' 'meson' 'ninja' 'perl' 'pkgconf' 'python' 'systemd')
provides=('libfprint-goodix53x5' 'fprintd=1.94.5')
conflicts=('libfprint-goodix53x5' 'fprintd')
backup=('etc/fprintd.conf')
options=('!debug')
install=libfprint-goodix53x5.install
source=("git+$url.git#branch=$_branch"
        "libfprint::git+https://gitlab.freedesktop.org/libfprint/libfprint.git#commit=$_libfprint_rev"
        "fprintd::git+https://gitlab.freedesktop.org/libfprint/fprintd.git#commit=$_fprintd_rev"
        libfprint-goodix53x5.install)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$_repo"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # The stack builder takes pinned checkouts from sources/, as in a release archive.
  mkdir -p "$_repo/sources"
  ln -sfn "$srcdir/libfprint" "$_repo/sources/libfprint"
  ln -sfn "$srcdir/fprintd" "$_repo/sources/fprintd"
}

build() {
  cd "$_repo"
  rm -rf -- "$srcdir/milan-stack" "$srcdir/stage"
  GOODIX53X5_DEBUG=0 GOODIX_MILAN_STACK_ROOT="$srcdir/milan-stack" \
    scripts/build-milan-stack-local.sh --package-root "$srcdir/stage"
}

package() {
  cp -a -- "$srcdir/stage/." "$pkgdir/"
  install -Dm644 "$srcdir/libfprint/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING.libfprint"
  install -Dm644 "$srcdir/fprintd/COPYING" "$pkgdir/usr/share/licenses/$pkgname/COPYING.fprintd"
}
