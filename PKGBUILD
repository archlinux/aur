# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=soundux
pkgver=0.2.2_b2
pkgrel=1
pkgdesc="A cross-platform soundboard"
arch=('any')
url="https://github.com/Soundux/Soundux"
license=('GPL3')
depends=('pulseaudio' 'webkit2gtk' 'libwnck3')
makedepends=('git' 'cmake' 'ninja')
source=("git+https://github.com/Soundux/Soundux#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd "${srcdir}/Soundux"
  git submodule update --init --recursive
  mkdir -p build
  cd build
  cmake -GNinja -DCMAKE_BUILD_TYPE=Release ..
  ninja
}

package() {
  cd "${srcdir}/Soundux/build"
  DESTDIR="$pkgdir/" ninja install
  # install binary symlink
  mkdir -p "${pkgdir}/usr/bin/"
  ln -sf /opt/soundux/soundux "${pkgdir}/usr/bin/soundux"
  
  # install doc
  install -Dm 644 -t "${pkgdir}/usr/share/doc/${pkgname}" "${srcdir}/Soundux/README.md"
  # install license
  install -Dm 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" "${srcdir}/Soundux/LICENSE"
}
