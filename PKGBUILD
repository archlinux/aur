# Maintainer: Lucas Saavedra Vaz <lucas.vaz at espressif dot com>
pkgname="qemu-esp-xtensa-git"
_gitname="qemu"
pkgver=r97829.0152246eb3
pkgrel=2
pkgdesc="Espressif's fork of QEMU with support for ESP32 xtensa boards. Git version."
arch=("x86_64")
url="https://github.com/espressif/qemu"
license=("GPL2")
depends=("glib2" "dtc" "pixman" "zlib" "bzip2" "python" "libgcrypt" "pcre")
makedepends=("gcc" "git" "ninja")
provides=("qemu-esp-xtensa")
conflicts=("qemu-esp-xtensa")
options=("!buildflags" "!makeflags")
source=("qemu::git+https://github.com/espressif/qemu.git#branch=esp-develop")
md5sums=("SKIP")

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
            --enable-debug \
            --enable-sanitizers \
            --disable-strip \
            --disable-user \
            --disable-capstone \
            --disable-vnc \
            --disable-sdl \
            --disable-gtk
  ninja -C build
}

package() {
  cd "$srcdir/${_gitname}/build"
  ninja install
  mkdir -p ${pkgdir}/usr/bin
  ln -s /opt/${pkgname}/bin/qemu-system-xtensa ${pkgdir}/usr/bin/qemu-esp-xtensa
}

