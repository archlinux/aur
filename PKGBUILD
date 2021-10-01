# Maintainer: Keaton Bruce <akbruce@protonmail.ch>

pkgname='p2pool-git'
_pkgname='p2pool'
pkgver=1.0.r16.g2a3cd13
pkgrel=1
pkgdesc='Decentralized pool for Monero mining'
arch=('x86_64' 'armv7h' 'aarch64' 'i686')
url='https://github.com/SChernykh/p2pool'
provides=('p2pool')
depends=('libuv' 'zeromq' 'libsodium' 'libpgm')
optdepends=()
makedepends=('cmake' 'git')
conflicts=('p2pool')
license=('GPL3')
backup=()
source=("$_pkgname::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$_pkgname"
  git submodule init
  git submodule update
  mkdir -p build
  # Removing libgss from build dependencies.
  sed -i 's/gss//g' CMakeLists.txt
}

build() {
  cd "$_pkgname/build"
  cmake .. -DCMAKE_BUILD_TYPE=Release
  make -j$(nproc)
}

package() {
  cd "$_pkgname"
  install -Dm775 "build/p2pool" "${pkgdir}/usr/bin/p2pool"
  #install -Dm644 "${srcdir}/p2pool.service" "${pkgdir}/usr/lib/systemd/system/p2pool@.service"
  #install -Dm0644 "${srcdir}/p2pool.sysusers" "${pkgdir}/usr/lib/sysusers.d/p2pool.conf"
}
