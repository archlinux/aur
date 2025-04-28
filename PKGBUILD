# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=physfs-git
pkgver=3.3.0.r1600.gadfdec6
pkgrel=1
pkgdesc="A portable, flexible file i/o abstraction (development version)"
arch=('x86_64')
url="https://icculus.org/physfs/"
license=('Zlib')
depends=('glibc')
makedepends=('git' 'cmake' 'ninja' 'doxygen')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("git+https://github.com/icculus/physfs.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-*}

  printf "%s.r%s.g%s" \
    "$(grep -m1 PHYSFS_VERSION CMakeLists.txt | tr -cd '0-9.')" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  rm -rf build
  cmake ${pkgname%-*} -Bbuild -GNinja \
    -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr \
    -DPHYSFS_BUILD_TEST=FALSE
  cmake --build build --target all --target docs
}

package() {
  DESTDIR="$pkgdir/" cmake --install build

  # doc
  (cd build/docs
    install -d "$pkgdir"/usr/share/{doc/physfs,man/man3}
    install -m644 html/* "$pkgdir"/usr/share/doc/physfs
    install -m644 man/man3/PHYSFS_* "$pkgdir"/usr/share/man/man3
    # prefix other manual pages with PHYSFS_
    find man/man3/ -type f -not \( -name "PHYSFS_*.3" -o -name "_*" \) -printf "%f\0" | \
      xargs -0 -I{} install -m644 man/man3/{} "$pkgdir"/usr/share/man/man3/PHYSFS_{}
  )

  # license
  install -Dm644 -t "$pkgdir"/usr/share/licenses/$pkgname ${pkgname%-*}/LICENSE.txt
}
