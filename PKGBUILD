# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)
# Contributor: Thibaut Pérami (https://aur.archlinux.org/account/tperami)

pkgname=magic_enum-git
pkgver=0.9.7.r25.gec5734e
pkgrel=2
pkgdesc="Header-only C++17 library, provides static reflection for enums, works with any enum type without any macro or boilerplate code."
arch=(any)
url="https://github.com/Neargye/magic_enum"
license=(MIT)
makedepends=(cmake git)
provides=(magic_enum=${pkgver})
conflicts=(magic_enum)
source=("git+https://github.com/Neargye/magic_enum.git")
sha256sums=('SKIP')

pkgver() {
  cd magic_enum
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cmake -B build -S "magic_enum" \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DMAGIC_ENUM_OPT_BUILD_EXAMPLES=OFF \
    -DMAGIC_ENUM_OPT_BUILD_TESTS=ON \
    -DMAGIC_ENUM_OPT_ENABLE_NONASCII=OFF

  cmake --build build
}

check(){
  ctest --test-dir build --output-on-failure
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  cd magic_enum
  for _docfile in README.md doc/* example/*; do
    install -D -v -m644 "${_docfile}"               "${pkgdir}/usr/share/doc/${_pkgname}/${_docfile}"
  done

#  cp -rv "build/example"                            "${pkgdir}/usr/share/doc/${_pkgname}/example/built"

  install -D -v -m644 LICENSE                       "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
