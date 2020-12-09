# Maintainer: Davide Depau <davide@depau.eu>

_pkgname=libfprint
pkgname=libfprint-vfs009x-git
epoch=1
pkgver=1.90.1.r5.ge34de1d
pkgrel=2
pkgdesc="Library for fingerprint readers (includes libre vfs0090 and vfs0097 driver)"
arch=(i686 x86_64)
url="https://github.com/3v1n0/libfprint"
license=(LGPL)
depends=(libusb nss pixman gnutls openssl gobject-introspection glib2 libgusb pixman nss openssl)
makedepends=(git meson gtk-doc pkgconf usbutils)
checkdepends=(cairo)
optdepends=(
  "fprintd: D-Bus daemon that manages fingerprint readers"
  "validity-sensors-tools: Flash, factory reset and pair Validity fingerprint sensors 009x"
  "gtk3: (make) Build GTK-based demos"
)
groups=(fprint-git)
provides=(libfprint libfprint-2.so=2-64 libfprint-vfs009x libfprint-vfs0090 libfprint-vfs0097)
conflicts=(libfprint)
replaces=(libfprint libfprint-vfs009x libfprint-vfs0090 libfprint-vfs0097)
source=(
  "git+https://github.com/3v1n0/libfprint.git#branch=vfs0090"
  "0001-VFS0097-Update-vfs0090.h.patch"
  "0001-Do-not-checkout-the-vfs0090-submodule-in-the-meson-s.patch"
)
md5sums=('SKIP'
         '5a8e609f8cbdaef0f7bd0004924da503'
         '3bdea2947f9901c30b53e0566be8e6a4')


prepare() {
  cd "$srcdir/$_pkgname"
  git submodule update --init --recursive
  
  patch -Np1 < "$srcdir/0001-Do-not-checkout-the-vfs0090-submodule-in-the-meson-s.patch"

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
  arch-meson $_pkgname build -D x11-examples=false -D doc=false -D udev_rules_dir=/usr/lib/udev/rules.d
  ninja -C build
}

package() {
  cd "$srcdir"
  DESTDIR="$pkgdir" ninja -C build install
}
