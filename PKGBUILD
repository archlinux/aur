# Maintainer: wintersnowgod <git.xerox732@passinbox.com>
pkgname=nepdate
pkgdesc='Standalone Nepali calendar widget and converter for Bikram Sambat and Gregorian calendars.'
pkgver=2.3.2
pkgrel=1
arch=(x86_64)
url="https://github.com/khumnath/nepdate"
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'qt6-base' 'qt6-declarative' 'layer-shell-qt')
makedepends=('cmake' 'qt6-shadertools' 'qt6-tools')
license=('GPL-3.0-or-later')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('ea299dec89a105bb1e46f36c9798a698c7b099ec601d8e66417a84bf989a99a2')

prepare() {
  cd "${pkgname}-${pkgver}"
  echo ${pkgver} >./resources/version.conf
  echo "Built from AUR using tagged Git release at $(date)" >./resources/build_info.conf
}

build() {
  cd "${pkgname}-${pkgver}"
  cmake -B build -S . \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr
  cmake --build build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Install
  DESTDIR="$pkgdir" cmake --install build

  # License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # Desktop file
  install -d "${pkgdir}/usr/share/applications"
  echo "[Desktop Entry]
Categories=Utility;Calendar;
Comment=Nepali Calendar Application
Icon=calendar
Exec=/usr/bin/bikram-calendar
Name=Nepdate Calendar
StartupNotify=true
StartupWMClass=NepaliCalendar
Terminal=false
Type=Application" >"${pkgdir}/usr/share/applications/nepdate.desktop"
}
