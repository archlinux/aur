# Maintainer: SovietReimu1228 <reimussr at protonmail dot ch>

pkgname=directx-headers-git
pkgdesc="DirectX headers for using D3D12"
pkgver=r176.53f4995
pkgrel=1
arch=('x86_64')
makedepends=('meson')
provides=('directx-headers')
conflicts=('directx-headers')
url="https://github.com/microsoft/DirectX-Headers"
license=('MIT')
source=('DirectX-Headers::git+https://github.com/microsoft/DirectX-Headers.git')
sha256sums=('SKIP')
options=(!lto)

pkgver() {
  cd DirectX-Headers
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  # LTO breaks mesa...
  export CXXFLAGS="$CXXFLAGS -fno-lto"

  arch-meson DirectX-Headers build \
    -Dbuild-test=false
  ninja -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build

  install -m644 -Dt "${pkgdir}/usr/share/licenses/${pkgname}" DirectX-Headers/LICENSE
}
