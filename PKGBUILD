# Maintainer: Christopher Patrick Fair <christopherpatrickfair@gmail.com>
pkgname=zource
pkgver=0.1.5
pkgrel=1
pkgdesc="2D radial tree and 3D rotating bubble repository visualizer for Kitty, Ghostty, Foot, and Wayland"
arch=('x86_64' 'aarch64')
url="https://github.com/chrisfair/zource"
license=('GPL-3.0-or-later')
depends=('glibc')
makedepends=('zig>=0.17.0')
optdepends=(
  'git: Visualize Git repository commit history'
  'mercurial: Visualize Mercurial (hg) repository history'
  'wayland: Native Wayland window mode (--wayland)'
  'libglvnd: Hardware-accelerated EGL/GLES 3D bubble shaders on Wayland'
  'ffmpeg: Encode headless PPM frame streams to MP4/WebM'
)
provides=('zource')
conflicts=('zource')
source=("$pkgname-$pkgver.tar.gz::https://github.com/chrisfair/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('fa8a14f0f6cd0657309b3b0e6f9be8229fca48849f76c6cd995e218418ac9407')

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export ZIG_GLOBAL_CACHE_DIR="${srcdir}/zig-global-cache"
  export ZIG_LOCAL_CACHE_DIR="${srcdir}/zig-local-cache"
  zig build -Doptimize=ReleaseFast
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export ZIG_GLOBAL_CACHE_DIR="${srcdir}/zig-global-cache"
  export ZIG_LOCAL_CACHE_DIR="${srcdir}/zig-local-cache"
  zig build test --summary all
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  install -Dm755 "zig-out/bin/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
  install -Dm644 "man/${pkgname}.1" "${pkgdir}/usr/share/man/man1/${pkgname}.1"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
