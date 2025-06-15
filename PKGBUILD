pkgname=udev-hid-bpf-git
pkgver=1.0.1.20240515.r229.g382d2b0
pkgrel=1
pkgdesc='An automatic HID-BPF loader based on udev events written in rust.'
arch=(x86_64)
url='https://libevdev.pages.freedesktop.org/udev-hid-bpf/tutorial.html'
license=(GPL-2.0-or-later)
depends=(
  systemd-libs
  libelf
  zlib
  glibc
  gcc-libs
)
makedepends=(
  rust
  meson
  git
  cmake
  clang
  libbpf
  bpf
  linux-headers
)
options=(!lto)
provides=(udev-hid-bpf)
conflicts=(udev-hid-bpf)
source=("git+https://gitlab.freedesktop.org/libevdev/udev-hid-bpf.git")
b2sums=('SKIP')

pkgver() {
  cd udev-hid-bpf
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd udev-hid-bpf

  export RUSTUP_TOOLCHAIN=stable
  #CARGO_HOME="$srcdir/build/cargo-home" cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  local meson_options=(
    -D tests=disabled
    -D vmlinux-h=provided
    -D vmlinux-h-path=/usr/src/linux/vmlinux.h
  )

  arch-meson udev-hid-bpf build "${meson_options[@]}"
  meson compile -C build
}

package() {
  meson install -C build --destdir "${pkgdir}"

  install -Dt "${pkgdir}/usr/include/udev-hid-bpf" -m644 udev-hid-bpf/src/bpf/*.h
}
