# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Alberto Oporto Ames <otreblain@gmail.com>

pkgname=lib32-libinih
pkgver=57
pkgrel=1
pkgdesc='A simple .INI file parser written in C (32-bit)'
arch=(x86_64)
url=https://github.com/benhoyt/inih
license=(BSD)
depends=(
  "libinih>=${pkgver}"
  lib32-gcc-libs
  lib32-glibc
)
makedepends=(
  git
  meson
)
provides=(
  libinih.so
  libINIReader.so
)
_tag=9cecf0643da0846e77f64d10a126d9f48b9e05e8
source=("git+https://github.com/benhoyt/inih.git#tag=${_tag}"
        "x86-linux-gnu")
sha512sums=('SKIP'
            '97c193bdf744a8853b4463dd9f995faea0e8b269b1b7ef3b9ffcf10c173aa44a0e6edcda5cb69be71af8a4a649332cb841ac5849ea8256f0cfeb5a3cedea251c')

pkgver() {
  cd inih
  git describe --tags | sed 's/^r//'
}

build() {
  export CC="gcc -m32"
  export CXX="g++ -m32"
  meson setup \
      "inih" "build" \
      --prefix      /usr \
      --sbindir     bin \
      --buildtype   plain \
      --libexecdir  lib32 \
      --libdir      /usr/lib32 \
      --auto-features enabled \
      -Ddefault_library=shared \
      -Ddistro_install=true \
      -Dwith_INIReader=true \
      --wrap-mode     nodownload \
      --cross-file  x86-linux-gnu
  meson compile -C "build"
}

package() {
  DESTDIR="$pkgdir" meson install -C build
  rm -r "$pkgdir/usr/include"
}

# vim: ts=2 sw=2 et:
