# Maintainer: Jesus <jesusaiyan@gmail.com>
pkgname=aurora-viewer-git
pkgver=0.8.4.beta.20261030.1.r28.gcafab5b80
pkgrel=1
pkgdesc='A modern Second Life viewer, written from scratch in Rust (Vulkan)'
arch=('x86_64')
url='https://aurora-viewer.org/'
license=('GPL-3.0-or-later')
depends=('vulkan-icd-loader' 'alsa-lib' 'libxkbcommon' 'wayland' 'libx11'
         'libxcursor' 'libxrandr' 'libxi' 'gstreamer' 'gst-plugins-base'
         'gst-plugins-good' 'gst-plugins-bad' 'gst-plugins-ugly' 'gst-libav'
         'nss' 'nspr' 'at-spi2-core' 'libcups' 'libxcomposite' 'libxdamage'
         'mesa' 'pango' 'cairo' 'hicolor-icon-theme' 'gcc-libs' 'glibc')
makedepends=('git' 'rust' 'cmake' 'clang' 'pkgconf')
provides=('aurora-viewer')
conflicts=('aurora-viewer')
# The final link is done with clang, which cannot consume the GCC LTO
# bytecode that makepkg's -flto=auto puts into C objects (e.g. mimalloc).
# Rust-code thin-LTO from Cargo.toml is unaffected.
options=('!lto')
source=("${pkgname}::git+https://github.com/Aurora-Viewer/Aurora-Viewer.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname}"
  # aws-lc-sys compiles its jitterentropy source with its own -O0 and
  # #errors on any optimization; makepkg appends -O2 after it, so drop -O2
  # (other C files keep the optimization flags the crates pass themselves).
  export CFLAGS="${CFLAGS//-O2}" CXXFLAGS="${CXXFLAGS//-O2}"
  cargo build --release -p aurora-viewer
}

package() {
  cd "${pkgname}"
  install -Dm755 target/release/aurora-viewer "${pkgdir}/usr/bin/aurora-viewer"
  install -Dm644 packaging/linux/aurora-viewer.desktop \
    "${pkgdir}/usr/share/applications/aurora-viewer.desktop"
  install -Dm644 assets/branding/aurora-logo.svg \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/aurora-viewer.svg"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
