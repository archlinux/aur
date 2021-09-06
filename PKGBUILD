# Maintainer: Keaton Bruce <akbruce@protonmail.ch>

pkgname='p2pool-git'
pkgver=master
pkgrel=1
pkgdesc='Decentralized pool for Monero mining'
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/SChernykh/p2pool"
provides=('p2pool')
depends=('libuv' 'zeromq' 'libsodium' 'libpgm')
optdepends=()
makedepends=('cmake' 'git')
conflicts=('p2pool')
license=('GPL')
backup=()
source=("$pkgname::git+${url}.git")
sha256sums=('SKIP')

prepare() {
  cd "$pkgname"
  git submodule init
  git submodule update
  mkdir build
  # Removing libgss from build dependencies.
  sed -i 's/gss//g' CMakeLists.txt
}

build() {
  cd "$pkgname/build"
  cmake .. -DCMAKE_BUILD_TYPE=Release
  make -j$(nproc)
}

package() {
  cd "$pkgname"
  install -Dm775 "build/p2pool" "${pkgdir}/usr/bin/p2pool"
  #install -Dm644 "${srcdir}/p2pool.service" "${pkgdir}/usr/lib/systemd/system/p2pool@.service"
  #install -Dm0644 "${srcdir}/p2pool.sysusers" "${pkgdir}/usr/lib/sysusers.d/p2pool.conf"
}
