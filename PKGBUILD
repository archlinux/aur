# Maintainer: wintersnowgod <git.xerox732@passinbox.com>
pkgname=nepdate
pkgdesc='Standalone Nepali calendar widget and converter for Bikram Sambat and Gregorian calendars.'
pkgver=2.3.0
pkgrel=1
arch=(x86_64)
url="https://github.com/khumnath/nepdate"
depends=('gcc-libs' 'glibc' 'hicolor-icon-theme' 'qt6-base' 'qt6-declarative')
makedepends=('cmake' 'qt6-shadertools' 'qt6-tools')
license=('GPL-3.0-or-later')
provides=("${pkgname}")
conflicts=("${pkgname}")
source=("${pkgname}-${pkgver}.tar.gz::$url/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('9e8400268fb253796eb4f2ac424c2768510d5bc5fcfb015a9c349b63997e38e5')

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
