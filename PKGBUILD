# Maintainer: Lubosz Sarnecki <lubosz at gmail dot com>

pkgname=superfamiconv-git
pkgver=0.9.2.r2.9f6bcab
pkgrel=1
pkgdesc='A tile graphics converter with flexible and composable command line options.'
arch=(x86_64)
url=https://github.com/Optiroc/SuperFamiconv
license=(MIT)

depends=(
  gcc-libs
)

makedepends=(
  cmake
  git
)
provides=(superfamiconv)
conflicts=(superfamiconv)
source=("git+https://github.com/Optiroc/SuperFamiconv.git"
        "0001-Mode-Add-default-cases.patch"
        "0004-cmake-Add-install-target.patch")
md5sums=(SKIP
         "7253cec1e63c2925154fdfa8ea9c21f7"
         "c56540c8efe5ac5b7246b3d27c3e4036")

pkgver() {
  cd SuperFamiconv
  git describe --tags | sed 's/^v//; s/-dev//; s/-/.r/; s/-g/./'
}

prepare() {
  if [[ -d build ]]; then
    rm -rf build
  fi
  mkdir build
  
  cd SuperFamiconv
  patch -p1 < ../0001-Mode-Add-default-cases.patch
  patch -p1 < ../0004-cmake-Add-install-target.patch
}

build() {
  cd build

  cmake ../SuperFamiconv \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  make DESTDIR="${pkgdir}" -C build install
  install -Dm644 "$srcdir/SuperFamiconv/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=2 sw=2 et:
