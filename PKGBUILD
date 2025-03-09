# Maintainer: Vlad Frolov <frolvlad@gmail.com>

pkgname=owlink-git
pkgver=r44.8e4e840
pkgrel=10
pkgdesc='An open Apple Wireless Direct Link (AWDL) implementation written in C'
arch=($CARCH)
url=https://owlink.org/
license=('GPL-3.0-only')
depends=('glibc' 'libpcap' 'libev' 'libnl')
makedepends=('cmake' 'git' 'ninja')
provides=('owlink' 'owl' 'owl-git')
conflicts=('owlink' 'owl' 'owl-git')
source=(
  "$pkgname::git+https://github.com/seemoo-lab/owl.git#branch=master"
  "git+https://github.com/google/googletest.git"
  "git+https://github.com/radiotap/radiotap-library.git"
)
sha512sums=('SKIP'
  'SKIP'
  'SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  (
    set -o pipefail
    git describe --long --tag --abbrev=7 2>/dev/null | sed 's/^v//g;s/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
  #   git -C "${srcdir}/${pkgname}" clean -dfx
  cd "${srcdir}/${pkgname}"
  git submodule init
  git config submodule.googletest.url $srcdir/googletest
  git config submodule.radiotap.url $srcdir/radiotap-library
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "${srcdir}/${pkgname}"
  cmake -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -B build \
    -G Ninja
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C "${srcdir}"/${pkgname}/build install
}

# vim:set ts=2 sw=2 et:
