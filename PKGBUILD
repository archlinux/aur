# Maintainer: Antoine GIRARD <sapk AT sapk.fr>

pkgname='xmrig-nvidia-git'
pkgver=r92.97ebe8b
pkgrel=1
pkgdesc='Monero cryptocurrency GPU miner, HTTP API disabled'
arch=('x86_64')
url='https://github.com/xmrig/xmrig-nvidia'
depends=('libuv' 'cuda')
optdepends=('monero: wallet')
makedepends=('git' 'cmake' 'libuv' 'cuda')
license=('GPL')
changelog=CHANGELOG.md
source=("git+https://github.com/xmrig/xmrig-nvidia.git")
sha256sums=('SKIP')
provides=('xmrig-nvidia')
conflicts=('xmrig-nvidia')

pkgver() {
  cd "$srcdir/xmrig-nvidia"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/xmrig-nvidia"

  # create build dir
  [ -d build ] || mkdir build

  # reset default donate level
  sed -i -e 's/constexpr const int kDonateLevel = 5;/constexpr const int kDonateLevel = 0;/g' src/donate.h
}

build() {
  cd "${srcdir}/xmrig-nvidia/build"
  cmake -DWITH_HTTPD=OFF -DCMAKE_C_COMPILER=gcc-6 -DCMAKE_CXX_COMPILER=g++-6 ..
  make
}

package() {
  cd "${srcdir}/xmrig-nvidia"
  install -Dm775 "build/xmrig-nvidia" "${pkgdir}/usr/bin/xmrig-nvidia"
  install -Dm644 src/config.json "${pkgdir}/usr/share/doc/xmrig-nvidia/config.json.example"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/xmrig-nvidia/README.md"
  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/xmrig-nvidia/CHANGELOG.md"
}



