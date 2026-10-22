# Maintainer: Alireza S.N. <alireza6677@gmail.com>
#
# Drop-in replacement for Arch's libfprint: upstream libfprint 1.94.10 with
# all of its drivers plus goodix55b4 (Goodix 27c6:55b4, native Milan matcher).
# fprintd uses it directly. Prints enrolled with other 55b4 drivers
# (goodixtls55x4/SIGFM) are not compatible: delete them and re-enroll.
#
# Also installs the libfprint examples as goodix55b4-{img-capture,enroll,
# verify,identify,manage-prints} (stop fprintd first; they need root for USB).
#
# Published on the AUR as libfprint-goodix55b4. To build from this repo:
#   git clone https://github.com/TheWeirdDev/libfprint-goodix55b4-milan.git
#   cd libfprint-goodix55b4-milan/packaging/arch && makepkg -si

pkgname=libfprint-goodix55b4
pkgver=1.94.10.m2
pkgrel=2
pkgdesc="libfprint with the Goodix 27c6:55b4 driver using the native Milan matcher"
arch=('x86_64')
url="https://github.com/TheWeirdDev/libfprint-goodix55b4-milan"
license=('LGPL-2.1-or-later')
depends=('glib2' 'libgusb' 'libgudev' 'openssl' 'pixman' 'libdeflate' 'systemd-libs')
makedepends=('git' 'meson' 'ninja' 'python' 'patchelf' 'gobject-introspection' 'systemd')
provides=('libfprint=1.94.10' 'libfprint-2.so')
conflicts=('libfprint' 'libfprint-goodix55b4-milan')
_libfprint_commit=0c97a47d8ef405cd577b87058c1e89cae9d242e7 # v1.94.10
_repo_url=https://github.com/TheWeirdDev/libfprint-goodix55b4-milan.git
source=("libfprint::git+https://gitlab.freedesktop.org/libfprint/libfprint.git#commit=${_libfprint_commit}"
        "driver::git+${_repo_url}#tag=v${pkgver}")
sha256sums=('SKIP' 'SKIP')

_examples=(img-capture enroll verify identify manage-prints)

prepare() {
  python3 -I "$srcdir/driver/scripts/integrate.py" "$srcdir/libfprint"
}

build() {
  arch-meson libfprint build \
    -Dudev_rules_dir=/usr/lib/udev/rules.d \
    -Ddoc=false \
    -Dinstalled-tests=false \
    -Dgtk-examples=false
  meson compile -C build
}

check() {
  # integrate.py must have moved 55b4 from the "unsupported" list to the
  # goodix55b4 driver. (The autosuspend hwdb itself ships with systemd.)
  grep -q '^usb:v27C6p55B4' libfprint/data/autosuspend.hwdb
  ! grep -q '0x55b4' libfprint/libfprint/fprint-list-udev-hwdb.c
}

package() {
  meson install -C build --destdir "$pkgdir"

  install -d "$pkgdir/usr/bin"
  local e
  for e in "${_examples[@]}"; do
    install -m755 "build/examples/$e" "$pkgdir/usr/bin/goodix55b4-$e"
    # Drop the build-tree RUNPATH; the system libfprint is this package.
    patchelf --remove-rpath "$pkgdir/usr/bin/goodix55b4-$e"
  done

  install -Dm644 "$srcdir/driver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
