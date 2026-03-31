# Maintainer: Ming <me@hihusky.com>
pkgname=typio
pkgver=2.5.0
pkgrel=1
pkgdesc='Native Wayland input method daemon with GTK4 control panel'
arch=('x86_64')
url='https://github.com/ming2k/typio'
license=('custom:unknown')
depends=(
  'cairo'
  'dbus'
  'gtk4'
  'libxkbcommon'
  'librime'
  'pango'
  'wayland'
)
makedepends=(
  'cmake'
  'ninja'
  'pkgconf'
  'wayland-protocols'
)
install="${pkgname}.install"
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('14f76cae21f568497752df8d1a22769ef6b92d26ea4992beb3af2eed58c4fb15')

build() {
  local cmake_args=(
    -S "${pkgname}-${pkgver}"
    -B build
    -G Ninja
    -DCMAKE_BUILD_TYPE=None
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_INSTALL_LIBDIR=lib
    -DBUILD_TESTS=OFF
    -DBUILD_CONTROL_PANEL=ON
    -DBUILD_RIME_ENGINE=ON
    -DENABLE_STATUS_BUS=ON
    -DENABLE_SYSTRAY=ON
    -DBUILD_MOZC_ENGINE=OFF
    -DBUILD_WHISPER=OFF
    -DBUILD_SHERPA_ONNX=OFF
  )

  cmake "${cmake_args[@]}"
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  install -d "${pkgdir}/usr/share/applications"
  install -d "${pkgdir}/usr/share/icons"

  if [[ -d "${pkgdir}/usr/share/typio/applications" ]]; then
    cp -a "${pkgdir}/usr/share/typio/applications/." "${pkgdir}/usr/share/applications/"
    rm -rf "${pkgdir}/usr/share/typio/applications"
  fi

  if [[ -d "${pkgdir}/usr/share/typio/icons" ]]; then
    cp -a "${pkgdir}/usr/share/typio/icons/." "${pkgdir}/usr/share/icons/"
    rm -rf "${pkgdir}/usr/share/typio/icons"
  fi

  install -Dm644 "${srcdir}/${pkgname}-${pkgver}/README.md" \
    "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
