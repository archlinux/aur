# Maintainer: c0re100 <corehusky@gmail.com> - https://husky.dev

pkgname=qbittorrent-enhanced-nox-git
pkgver=4.5.4.10.r0.g416904b36
pkgrel=2
pkgdesc="A bittorrent client powered by C++, Qt6 and the good libtorrent library (Enhanced Edition)"
arch=('arm' 'armv6h' 'armv7h' 'aarch64' 'i686' 'x86_64')
url="https://github.com/c0re100/qBittorrent-Enhanced-Edition"
license=('custom' 'GPL')
depends=('libtorrent-rasterbar' 'qt6-base')
makedepends=('cmake' 'boost' 'git' 'qt6-tools')
optdepends=('python: needed for torrent search tab')
conflicts=('qbittorrent-nox')
provides=('qbittorrent-nox')
source=("${pkgname%-*}::git+https://github.com/c0re100/qBittorrent-Enhanced-Edition.git#branch=v4_5_x")
sha256sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}

  _tag=$(git tag -l --sort -v:refname | sed -n '1,1{s/release-//p}')
  _rev=$(git rev-list --count release-${_tag}..HEAD)
  _hash=$(git rev-parse --short HEAD)
  printf "%s.r%s.g%s" "$_tag" "$_rev" "$_hash"
}

build() {
  cd ${pkgname%-*}

  cmake -B build -S . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DQT6=ON \
    -DGUI=OFF \
    -DSYSTEMD=ON
  cmake --build build
}

package() {
  cd ${pkgname%-*}

  DESTDIR="$pkgdir" cmake --install build
  install -Dm644 COPYING "$pkgdir"/usr/share/licenses/$pkgname/COPYING
}
