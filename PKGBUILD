# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org>
# Contributor: Nikola Hadžić <nikola@firemail.cc>

pkgname=gst-plugins-rs
pkgver=1.22.8
pkgrel=1
pkgdesc="GStreamer plugins written in Rust (dav1d disabled when fail to build)"
arch=(x86_64)
url="https://gitlab.freedesktop.org/gstreamer/gst-plugins-rs"
license=(Apache LGPL2.1 MIT MPL2)
depends=(glibc gcc-libs glib2 pango cairo graphene openssl
         gst-plugins-base-libs gst-plugins-bad-libs
         gstreamer gtk4 dav1d libsodium libwebp)
makedepends=(git rust meson cargo-c clang nasm hotdoc python-tomli)
provides=(gst-plugin-gtk4)
conflicts=(gst-plugin-gtk4)
options=(!lto)
source=("git+https://gitlab.freedesktop.org/gstreamer/gst-plugins-rs.git#tag=gstreamer-${pkgver}")
sha256sums=(SKIP)

prepare() {
  cd "${srcdir}/${pkgname}"
  #cargo fetch --target x86_64-unknown-linux-gnu --manifest-path "${srcdir}/${pkgname}/Cargo.toml"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --target x86_64-unknown-linux-gnu
}

build() {
  cd "${srcdir}/${pkgname}"

  #  -D doc=disabled \
  #  -D csound=enabled \
  #  -D dav1d=enabled \
  #  -D sodium=enabled
  #  -D sodium-source=system

  arch-meson build \
    -D dav1d=disabled

  meson compile -C build
}

package() {
  cd "${srcdir}/${pkgname}"
  meson install -C build --destdir "${pkgdir}"
  install -D LICENSE-* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
