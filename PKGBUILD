# Maintainer: xCaptaiN09 <https://github.com/xCaptaiN09>
# Based on official libfprint PKGBUILD by Jan Alexander Steffens (heftig)
# Patch: libfprint MR #554 by Sid1803 — adds FocalTech FT9365 (2808:6553) support

pkgname=libfprint-ft9365
pkgver=1.94.10
pkgrel=1
pkgdesc="Library for fingerprint readers (with FocalTech FT9365 / Samsung Galaxy Book 4 support)"
url="https://fprint.freedesktop.org/"
arch=(x86_64)
license=(LGPL-2.1-or-later)
provides=(libfprint libfprint-2.so)
conflicts=(libfprint)
depends=(gcc-libs glib2 glibc libgudev libgusb openssl pixman)
makedepends=(git glib2-devel gobject-introspection gtk-doc meson python-cairo python-gobject systemd)
checkdepends=(cairo umockdev)
source=(
  "git+https://gitlab.freedesktop.org/libfprint/libfprint.git?signed#tag=v$pkgver"
  "focaltech-ft9365.patch"
)
validpgpkeys=(
  D4C501DA48EB797A081750939449C2F50996635F
)

prepare() {
  cd libfprint
  patch -Np1 -i "$srcdir/focaltech-ft9365.patch" || true

  # Manual fix for patch conflicts
  local c="libfprint/drivers/focaltech_moc/focaltech_moc.c"
  if ! grep -q "0x6553" "$c"; then
    sed -i '/fpi_device_focaltech_moc_samsung_class_init/i static const FpIdEntry id_table_samsung[] = {\n  { .vid = 0x2808, .pid = 0x6553, .driver_data = FOCALTECH_QUIRK_SINGLE_SLOT },\n  { .vid = 0, .pid = 0 }\n};\n' "$c"
  fi
}

build() {
  arch-meson libfprint build \
    -D drivers=all \
    -D installed-tests=false
  meson compile -C build
}

package() {
  meson install -C build --destdir "$pkgdir"
}
