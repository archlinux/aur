# Maintainer:
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Antoine GIRARD <sapk AT sapk.fr>

pkgname='xmrig-nvidia-git'
pkgver=2.14.5.r0.ga047dc3
pkgrel=1
pkgdesc='Monero cryptocurrency GPU miner, HTTP API disabled'
arch=('x86_64')
url='https://github.com/xmrig/xmrig-nvidia'
depends=('libuv' 'cuda')
optdepends=('monero: wallet')
makedepends=('git' 'cmake' 'libuv' 'cuda' 'gcc8')
license=('GPL')
source=("git+https://github.com/xmrig/xmrig-nvidia.git")
sha256sums=('SKIP')
provides=('xmrig-nvidia')
conflicts=('xmrig-nvidia')

pkgver() {
  cd "$srcdir/xmrig-nvidia"
  # cutting off 'v' prefix that presents in the git tag
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/xmrig-nvidia"

  # create build dir
  [ -d build ] || mkdir build
}

build() {
  cd "${srcdir}/xmrig-nvidia/build"

  # CUDA on ArchLinux uses GCC 8.0
  cmake -DCMAKE_C_COMPILER=gcc-8 -DCMAKE_CXX_COMPILER=g++-8 ..
  make
}

package() {
  cd "${srcdir}/xmrig-nvidia"
  install -Dm775 "build/xmrig-nvidia" "${pkgdir}/usr/bin/xmrig-nvidia"
  install -Dm644 src/config.json "${pkgdir}/usr/share/doc/xmrig-nvidia/config.json.example"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/xmrig-nvidia/README.md"
  install -Dm644 CHANGELOG.md "${pkgdir}/usr/share/doc/xmrig-nvidia/CHANGELOG.md"
}



