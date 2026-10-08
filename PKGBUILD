# Maintainer: Lucas Saavedra Vaz <lucas.vaz at espressif dot com>
# Maintainer: Christian Heusel <christian at heusel dot eu>
pkgname="qemu-esp-xtensa-git"
_gitname="qemu"
pkgver=r117398.febae182e1
pkgrel=1
pkgdesc="Espressif's fork of QEMU with support for ESP32 xtensa boards. Git version."
arch=("x86_64")
url="https://github.com/espressif/qemu"
license=("GPL-2.0-or-later")
depends=(
  "dtc"
  "gcc-libs"
  "glib2"
  "glibc"
  "gnutls"
  "libbpf"
  "libgcrypt"
  "libseccomp"
  "libslirp"
  "pixman"
  "systemd-libs"
)
makedepends=(
  "git"
  "meson"
  "ninja"
  "pkgconf"
  "python"
  "python-setuptools"
)
provides=("qemu-esp-xtensa")
conflicts=("qemu-esp-xtensa")
options=("!buildflags" "!lto")
source=("qemu::git+https://github.com/espressif/qemu.git#branch=esp-develop")
sha256sums=("SKIP")

pkgver() {
  cd "$srcdir/${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${_gitname}"
  ./configure \
            --target-list=xtensa-softmmu \
            --prefix=/opt/${pkgname} \
            --enable-gcrypt \
            --enable-slirp \
            --enable-debug \
            --disable-docs \
            --disable-werror \
            --disable-strip \
            --disable-user \
            --disable-capstone \
            --disable-vnc \
            --disable-sdl \
            --disable-gtk
  ninja -C build
}

package() {
  cd "$srcdir/${_gitname}"
  meson install -C build --destdir "$pkgdir"
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/bin/qemu-system-xtensa" "${pkgdir}/usr/bin/qemu-esp-xtensa"
}
