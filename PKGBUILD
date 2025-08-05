# Maintainer: gugah <gugaboy at rocketmail dot com>
# Contributor: Alex Richards <aur@alxr.uk>
# Contributor: Davide Depau <davide@depau.eu>

_pkgname=libfprint
pkgname=libfprint-vfs009x-git
pkgver=1.94.9.r1.gbb222b3
pkgrel=2
pkgdesc="Library for fingerprint readers (includes libre vfs0090 and vfs0097 driver)"
arch=(x86_64)
url="https://gitlab.archlinux.org/gugah/libfprint"
license=(LGPL)
depends=(libusb nss pixman gnutls openssl gobject-introspection glib2 libgusb openssl-1.1)
makedepends=(git meson gtk-doc pkgconf usbutils glib2-devel)
checkdepends=(cairo)
optdepends=(
  "fprintd: D-Bus daemon that manages fingerprint readers"
  "validity-sensors-tools: Flash, factory reset and pair Validity fingerprint sensors 009x"
  "gtk3: (make) Build GTK-based demos"
)
provides=(libfprint libfprint-2.so)
conflicts=(libfprint)
source=(
  "git+https://gitlab.archlinux.org/gugah/libfprint.git#branch=vfs009x"
  "0001-VFS0097-Update-vfs0090.h.patch"
  "0001-60-libfprint-2-tod-vfs0090.rules"
)
md5sums=('SKIP'
         '5a8e609f8cbdaef0f7bd0004924da503'
         '5b32962b32e30519c28905f2ed1c6d4f')


prepare() {
  cd "$srcdir/$_pkgname"
  git submodule update --init --recursive

  local patch97=0
  warning "NOTE:"

  if [[ "$VFS0097" == 1 ]]; then
    patch97=1
    warning "Applying patch for 138a:0097 since VFS0097=1 was found in the environment"
  elif [[ "$VFS0097" == 0 ]]; then
    patch97=0
    warning "Building for 138a:0090 as requested. If you wish to enable patches for 138a:0097, export VFS0097=1"
  elif lsusb | grep -q "138a:0097"; then
    patch97=1
    warning "VFS0097 fingerprint reader detected - applying patch for 138a:0097"
    warning "If you wish to build for 138a:0090, export VFS0097=0"
  else
    warning "Building for 138a:0090. If you wish to enable patches for 138a:0097, export VFS0097=1"
  fi

  if [[ "$patch97" == 1 ]]; then
    cd libfprint/drivers/vfs0090
    patch -Np1 < "$srcdir/0001-VFS0097-Update-vfs0090.h.patch"
  fi
}

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags 2>/dev/null | sed -e 's/^V_//;s/\([0-9]*-g\)/r\1/;s/[-_]/./g' -e 's/^v//g' -e 's/+vfs009.\..//g'
}

build() {
  cd "$srcdir"
  arch-meson $_pkgname build -D doc=false -D udev_rules_dir=/usr/lib/udev/rules.d
  ninja -C build
}

package() {
  cd "$srcdir"
  DESTDIR="$pkgdir" ninja -C build install

  install -Dm644 "${srcdir}/0001-60-libfprint-2-tod-vfs0090.rules" "${pkgdir}/usr/lib/udev/rules.d/60-libfprint-2-tod-vfs0090.rules"
}
