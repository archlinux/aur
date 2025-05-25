# Maintainer: robertfoster
# Contributor: FabioLolix

pkgname=gst-plugins-rs-git
pkgver=r4028.6b54566a
pkgrel=1
pkgdesc="GStreamer plugins written in Rust"
arch=("x86_64")
url="https://gstreamer.freedesktop.org/"
license=('LGPL' 'MIT' 'Apache' 'MPL')
depends=('dav1d' 'gstreamer' 'gtk4' 'libsodium' 'libwebp' 'vvdec')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=('cargo-c' 'clang' 'git' 'meson' 'nasm' 'rust')
options=(!lto)
source=("${pkgname%-git}::git+https://gitlab.freedesktop.org/gstreamer/gst-plugins-rs.git")

pkgver() {
  cd ${pkgname%-git}
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
  arch-meson "${pkgname%-git}" build \
    -D csound=disabled \
    -D doc=disabled \
    -D sodium-source=system
  meson compile -C build
}

package() {
  DESTDIR="${pkgdir}" meson install -C build
  install -D "${pkgname%-git}"/LICENSE-* -t "${pkgdir}/usr/share/licenses/${pkgname}"
}

sha256sums=(SKIP)
