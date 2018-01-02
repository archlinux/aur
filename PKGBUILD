# Maintainer: Doug Johnson <dougvj@dougvj.net>

pkgname='xmrig-amd-git'
pkgver=r20.acd215f
pkgrel=2
pkgdesc='Monero cryptocurrency GPU miner (OpenCL for AMD)'
arch=('x86_64')
url='https://github.com/xmrig/xmrig-amd'
depends=('libuv' 'ocl-icd')
optdepends=('monero: wallet')
makedepends=('git' 'cmake' 'opencl-headers')
license=('GPL')
changelog=CHANGELOG.md
source=("git+https://github.com/xmrig/xmrig-amd.git");
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/xmrig-amd"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/xmrig-amd"

  # create build dir
  [ -d build ] || mkdir build

  # reset default donate level
  sed -i -e 's/constexpr const int kDonateLevel = 5;/constexpr const int kDonateLevel = 0;/g' src/donate.h
}

build() {
  cd "$srcdir/xmrig-amd/build"
  cmake -DWITH_HTTPD=OFF ..
  make
}

package() {
  install -Dm775 "$srcdir/xmrig-amd/build/xmrig-amd" "$pkgdir/usr/bin/xmrig-amd"
  install -Dm644 "$srcdir/xmrig-amd/src/config.json" "$pkgdir/usr/share/doc/xmrig-amd/config.json.example"
  install -Dm644 "${srcdir}/xmrig-amd/README.md" "${pkgdir}/usr/share/doc/xmrig-amd/README.md"
  install -Dm644 "${srcdir}/xmrig-amd/CHANGELOG.md" "${pkgdir}/usr/share/doc/xmrig-amd/CHANGELOG.md"
}
