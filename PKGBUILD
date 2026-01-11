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
source=("git+https://github.com/Optiroc/SuperFamiconv.git")
md5sums=(SKIP)

pkgver() {
  cd SuperFamiconv
  git describe --tags | sed 's/^v//; s/-dev//; s/-/.r/; s/-g/./'
}

prepare() {
  cd SuperFamiconv
  # Readd install target, upstream has reverted it (by accdent?)
  git cherry-pick -n 2d4c6bafa6d83c2cb8aacaadac20e03644b49601
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
