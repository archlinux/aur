# Maintainer: cosct <cosct@outlook.com>
# EgisTec EH575 (1c7a:0575) experimental driver on current libfprint.
# Research project (single repo, libfprint subtree included):
#   https://github.com/cosct/libfprint-egis0575
#
# Canonical copy of the AUR package; release CI syncs it to
# ssh://aur@aur.archlinux.org/libfprint-egis0575.git on every
# egis0575-v* tag (pkgver + sha256sums updated automatically).
pkgname=libfprint-egis0575
pkgver=0.2.2
pkgrel=1
pkgdesc="libfprint with the experimental EgisTec EH575 (1c7a:0575) fingerprint driver (press-snapshot + Windows-engine matcher port)"
arch=(x86_64)
url="https://github.com/cosct/libfprint-egis0575"
license=(LGPL-2.1-or-later)
options=(!debug)
# vendored libfprint builds all drivers by default: uru4000 needs openssl
# at build time and links libssl/libcrypto at runtime; nothing needs nss.
depends=(libusb libgusb openssl pixman glib2 libgudev)
makedepends=(meson ninja glib2-devel)
# 1.94.100 = bundled libfprint base; soversion 2 -> libfprint-2.so=2-64
provides=(libfprint=1.94.100 libfprint-2.so=2-64)
conflicts=(libfprint libfprint-egis-0575 libfprint-egis0575-experimental)
replaces=(libfprint-egis-0575 libfprint-egis0575-experimental)
# tag tarballs come from the libfprint-egis0575 repository; the meson
# source tree is the libfprint/ subtree inside it
source=("$pkgname-$pkgver.tar.gz::https://github.com/cosct/libfprint-egis0575/archive/refs/tags/egis0575-v$pkgver.tar.gz")
# the hash below pins the pkgver tarball so a direct build from this repo
# copy verifies its download; the release CI (updpkgsums) refreshes it for
# each new tag, where the tarball — and therefore the hash — changes
sha256sums=('016fe30cfca358deb0c375caa711113fe873b927e4136a3128288305789e9ba1')

build() {
  # align with the deb/rpm builds: no docs, introspection or installed tests.
  # udev_hwdb=enabled: meson's auto mode skips the autosuspend hwdb when
  # systemd >= 248 ships one, but systemd's list lacks the out-of-tree
  # EH575 — install ours (intentional duplicate, meson warns).
  arch-meson "libfprint-egis0575-egis0575-v$pkgver/libfprint" build \
    -D introspection=false -D doc=false -D installed-tests=false \
    -D gtk-examples=false \
    -D udev_rules_dir=/usr/lib/udev/rules.d \
    -D udev_hwdb=enabled -D udev_hwdb_dir=/usr/lib/udev/hwdb.d
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
