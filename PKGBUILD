# Maintainer: arbitar <aur@arbi.in>

# Driver: vojtapl/synaTudorMiS (synatlsmoc), integrated into vojtapl/libfprint
# Supports: 06CB:00C9 and family (HP Spectre x360 13-aw0 etc.)

pkgname=libfprint-vojtapl-synatudormis-git
pkgver=r.b2b8ec7
pkgrel=1
pkgdesc="libfprint with Synaptics Tudor Match-in-Sensor driver (synatlsmoc, 06CB:00C9 family)"
url="https://github.com/vojtapl/synaTudorMiS"
arch=(x86_64)
license=(LGPL-2.1-or-later)
depends=(glib2 libgudev libusb glibc openssl libgusb)
makedepends=(git meson ninja)
optdepends=('fprintd: userspace daemon and PAM module for fingerprint readers')
conflicts=(libfprint libfprint-tod libfprint-tod-git
           libfprint-2-tod1-synatudor-git)
provides=(libfprint libfprint-2.so)
replaces=(libfprint)
source=("libfprint::git+https://github.com/vojtapl/libfprint.git#branch=main")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/libfprint"
  printf "r.%s" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/libfprint"
  # uncomment 00C9 (HP Spectre x360 13-aw0 and similar)
  sed -i 's|// { .vid = SYNAPTICS_VENDOR_ID,  .pid = 0x00C9, },|{ .vid = SYNAPTICS_VENDOR_ID, .pid = 0x00C9, },|' \
    libfprint/drivers/synatlsmoc/synatlsmoc.c
}

build() {
  arch-meson libfprint build \
    -Ddoc=false \
    -Dudev_rules_dir=/usr/lib/udev/rules.d
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
