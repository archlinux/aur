# Maintainer: Nathaniel Rowan <rvanathanrowan@gmail.com>
# Contributor: Nicolas Derumigny nderumigny <at> gmail <dot> com
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Thomas Baechler <thomas@archlinux.org>

pkgname=libfprint-2-tod1-synatudor-git
pkgrel=1
pkgver=r200.d3550ca
pkgdesc="libfprint module for Synaptics Tudor Driver"
url="https://github.com/Popax21/synaTudor"
arch=(x86_64)
license=(LGPL)
depends=(libfprint-tod openssl libusb libgusb glib2 libseccomp libcap glibc)
makedepends=(git meson innoextract wget)
source=("libfprint-2-tod1-synatudor::git+https://github.com/Popax21/synaTudor.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  # cli is for debug usage only
  rm -rf cli/
  sed '/cli/d' meson.build -i
  # INSTALL_DIR has a hardcoded reference to /sbin
  sed 's|/sbin|/usr/bin|g' meson.build -i
}

build() {
  cd "$srcdir/${pkgname%-git}"
  arch-meson "$srcdir/${pkgname%-git}" build
  meson compile -C build
}

check() {
  cd "$srcdir/${pkgname%-git}"
  meson test -C build --print-errorlogs
}

package() {
  cd "$srcdir/${pkgname%-git}"
  meson install -C build --destdir "$pkgdir/"
}
