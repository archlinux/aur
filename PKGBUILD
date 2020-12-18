# Maintainer: Daniel Eklöf <daniel at ekloef dot se>
pkgname=fcft
pkgver=2.3.2  # Don’t forget to update CHANGELOG.md
pkgrel=1
pkgdesc="Simple library for font loading and glyph rasterization using FontConfig, FreeType and pixman."
arch=('x86_64' 'aarch64')
url=https://codeberg.org/dnkl/fcft
license=(mit)
depends=('freetype2' 'fontconfig' 'pixman' 'harfbuzz')
makedepends=('meson' 'ninja' 'scdoc')
checkdepends=('check' 'ttf-dejavu')
changelog=CHANGELOG.md
source=(https://codeberg.org/dnkl/${pkgname}/archive/${pkgver}.tar.gz
        https://codeberg.org/dnkl/tllist/archive/1.0.4.tar.gz)
sha256sums=('726fdebb1d29bc40c665015666fd9037981c0b4d0ba3ecafa1994053091e7fa8'
            'a135934d4955902d67f75f3c542ace3bfb7be3be9c44796852e76ea9e1d82b33')

build() {
  cd ${pkgname}

  mkdir -p subprojects
  pushd subprojects
  ln -sf ../../tllist .
  popd

  meson --prefix=/usr --buildtype=release -Dtext-shaping=enabled . build
  ninja -C build
}

check() {
  cd ${pkgname}
  ninja -C build test
}

package() {
  cd ${pkgname}
  DESTDIR="${pkgdir}/" ninja -C build install
}
