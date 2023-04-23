# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org>
# Contributor: Nikola Hadžić <nikola@firemail.cc>

pkgname=gst-plugins-rs
pkgver=0.10.6
pkgrel=1
pkgdesc="GStreamer plugins written in Rust"
arch=(x86_64)
url="https://gitlab.freedesktop.org/gstreamer/gst-plugins-rs"
license=(Apache LGPL2.1 MIT MPL2)
depends=(gstreamer gtk4 dav1d libwebp)
makedepends=(git rust meson cargo-c clang nasm python-tomli)
options=(!lto)
source=("git+https://gitlab.freedesktop.org/gstreamer/gst-plugins-rs.git#tag=${pkgver}")
sha256sums=(SKIP)

prepare() {
  cd "${srcdir}/${pkgname}"
  cargo fetch --target x86_64-unknown-linux-gnu --manifest-path "${srcdir}/${pkgname}/Cargo.toml"
}

build() {
  cd "${srcdir}/${pkgname}"
  arch-meson build \
    -D doc=disabled \
    -D csound=enabled \
    -D dav1d=enabled \
    -D sodium=enabled

  ninja -C build
}

package() {
  cd "${srcdir}/${pkgname}"
  DESTDIR="${pkgdir}" meson install -C build
  install -D LICENSE-* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

