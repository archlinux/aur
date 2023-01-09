# Maintainer: Michael Lass <bevan@bi-co.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=mp-sonivoxeas
_pkgname=multiplatform-sonivoxeas
pkgver=2.0.0
pkgrel=1
pkgdesc="Multiplatform Sonivox EAS for Qt"
arch=(x86_64)
url="https://github.com/pedrolcl/${_pkgname}"
license=('GPL3')
depends=(drumstick qt6-multimedia sonivox)
makedepends=(cmake)
source=("https://github.com/pedrolcl/${_pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('46b27083e92b5e6759b7ba3284a513069f6987ddfa2e07619dfeb1635e28e532')

prepare() {
  cd "$_pkgname-$pkgver"

  # Do not build against Qt5 because Drumstick is built against Qt6
  sed -i 's/Qt5 //g' CMakeLists.txt

  # Fix icon installation target (from 0699cdc70d25d10ccfe6aa9269333f6a374b9d7b)
  sed -i 's#icons/hicolor/128x128#icons/hicolor/128x128/apps#g' guisynth/CMakeLists.txt

  # Let WMs recognize mp_guisynth windows
  echo "StartupWMClass=mp_GUISynth" >> guisynth/mp_guisynth.desktop
}

build() {
  cmake -B build -S "$_pkgname-$pkgver" \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
