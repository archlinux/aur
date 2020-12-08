# Maintainer: KokaKiwi <kokakiwi+aur@kokakiwi.net>

_pkgname=dwarfs
pkgname=${_pkgname}-git
pkgver=0.2.3.r1.gbdd4b84
pkgrel=1
pkgdesc="A fast high compression read-only file system"
url='https://github.com/mhx/dwarfs'
arch=('x86_64')
license=('GPL3')
depends=(
  'fuse3' 'openssl' 'boost-libs'
  'lz4' 'xz' 'zstd'
  'libunwind' 'google-glog' 'fmt' 'gflags' 'double-conversion'
)
makedepends=('git' 'cmake' 'sparsehash' 'ruby-ronn' 'boost' 'libevent')
source=("${pkgname}::git+https://github.com/mhx/dwarfs.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"

  git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${pkgname}"

  git submodule update --init --depth=1
}

build() {
  cmake -B build -S "${pkgname}" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=None
  cmake --build build
}

package() {
  cmake --install build \
    --prefix "${pkgdir}/usr"

  install -Dm0644 "${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
