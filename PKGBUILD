# Maintainer: Xiaotian Wu <yetist@gmail.com>

pkgname=qemu-loongarch64
pkgdesc="A generic and open source machine emulator and virtualizer"
pkgver=6.1.0.r91240.g59a245bd54
_pkgver=6.1.0
pkgrel=1
arch=(x86_64)
license=(GPL2 LGPL2.1)
url="https://wiki.qemu.org/"

makedepends=(
    git
    glib2-static    # build from AUR
    libffi-static
    libiscsi
    meson
    pcre-static     # build from AUR
    python
    usbredir
    xfsprogs
)

source=('git+https://github.com/loongson/qemu.git#branch=tcg-dev'
        'qemu-loongarch64.conf')
sha1sums=('SKIP'
          '8834bc060ead1779ca82f3569789be49c03d2c0a')

pkgver() {
  cd "$srcdir/qemu"
  printf "${_pkgver}.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/qemu"
    ./configure \
    --target-list="loongarch64-linux-user" \
    --static \
    --disable-capstone \
    --disable-gtk \
    --disable-sdl \
    --disable-seccomp \
    --disable-vnc \
    --disable-vnc-jpeg \
    --disable-vnc-png \
    --disable-werror \
    --disable-bpf \
    --enable-debug \
    --enable-kvm \
    --enable-libiscsi \
    --enable-libusb \
    --disable-linux-aio \
    --disable-spice \
    --enable-tcg-interpreter \
    --enable-usb-redir \
    --enable-user \
    --enable-xfsctl \
    --interp-prefix=/usr/loongarch64-linux-gnu/ \
    --prefix=/usr
    make
}

package() {
  cd "$srcdir/qemu"
  DESTDIR="$pkgdir" ninja -C build install
  rm -rf "$pkgdir"/usr/share
  install -Dm644 $srcdir/qemu-loongarch64.conf $pkgdir/usr/lib/binfmt.d/qemu-loongarch64.conf
}

## vim:set ts=2 sw=2 et:
