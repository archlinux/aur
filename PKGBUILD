# SPDX-License-Identifier: 0BSD
# Maintainer: G-grbz <gkhn.gurbuz@hotmail.com>

pkgname=lurviko
pkgver=1.0.0
pkgrel=1
pkgdesc='Qt Quick file manager with media libraries, cloud storage and an encrypted vault'
arch=('x86_64')
url='https://github.com/G-grbz/Lurviko'
license=('GPL-3.0-or-later' 'CC-BY-4.0')
depends=(
  'gcc-libs' 'glibc'
  'qt6-base>=6.9' 'qt6-declarative>=6.9' 'qt6-multimedia>=6.9'
  'qt6-networkauth>=6.9' 'qt6-svg>=6.9'
  'kio' 'kservice' 'kwallet' 'kiconthemes' 'karchive' 'kwindowsystem' 'kcoreaddons'
  'openssl>=3.2' 'ffmpeg' 'hicolor-icon-theme'
)
makedepends=('cmake>=3.21' 'extra-cmake-modules' 'ninja')
checkdepends=('python' 'breeze-icons' 'desktop-file-utils')
optdepends=(
  'qt6-wayland: Wayland desktop sessions'
  'qt6-imageformats: additional image formats'
  'ffmpegthumbnailer: video thumbnails'
  'poppler: PDF thumbnails'
  '7zip: additional archive extraction formats'
  'libarchive: creating ZIP, 7z and tar archives'
  'squashfs-tools: AppImage icon previews'
  'mkvtoolnix-cli: Matroska subtitle extraction'
  'python: optional AI subtitle workers'
  'python-pip: installing optional AI worker dependencies in the user cache'
  'python-certifi: optional subtitle worker HTTPS support'
  'python-numpy: optional subtitle worker audio processing'
  'python-pillow: optional media worker artwork processing'
  'breeze-icons: fallback icon theme'
  'kio-extras: additional network and filesystem protocols'
)
install=lurviko.install
source=("${url}/releases/download/v${pkgver}/Lurviko-${pkgver}.tar.gz")
sha256sums=('41c5487429bfcbbaa00cf00123b808545594adff358864082310557567a80aba')

prepare() {
  # Installed workers are found in /usr/share/Lurviko. Do not embed the
  # temporary source directory as a development-only fallback in the binary.
  sed -i 's/const QString sourceDir = QString::fromUtf8(LURVIKO_SOURCE_DIR);/const QString sourceDir;/' \
    "Lurviko-${pkgver}/src/subtitleaimanager.cpp" \
    "Lurviko-${pkgver}/src/gtmcemanager.cpp"
}

build() {
  cmake -S "Lurviko-${pkgver}" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_SKIP_INSTALL_RPATH=ON \
    -DLURVIKO_LAUNCH_PROFILE=default
  cmake --build build
}

check() {
  cd "Lurviko-${pkgver}"
  LURVIKO_TEST_BUILD_DIR="${srcdir}/build" bash .github/scripts/run-headless-tests.sh
  desktop-file-validate "${srcdir}/build/lurviko.desktop"
}

package() {
  DESTDIR="${pkgdir}" cmake --install build

  # The generic FileManager1 filename is owned by other file managers.
  # Keep an opt-in template; users can enable it in their own XDG data directory.
  install -Dm644 "${pkgdir}/usr/share/dbus-1/services/org.freedesktop.FileManager1.service" \
    "${pkgdir}/usr/share/Lurviko/dbus-1/services/org.freedesktop.FileManager1.service"
  sed -i 's|^Exec=.*|Exec=/usr/bin/lurviko --filemanager1|' \
    "${pkgdir}/usr/share/Lurviko/dbus-1/services/org.freedesktop.FileManager1.service"
  rm "${pkgdir}/usr/share/dbus-1/services/org.freedesktop.FileManager1.service"
  rmdir "${pkgdir}/usr/share/dbus-1/services" "${pkgdir}/usr/share/dbus-1"

  install -Dm644 "Lurviko-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "Lurviko-${pkgver}/assets/LICENSE-FontAwesome.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-FontAwesome.txt"
  install -Dm644 "Lurviko-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "Lurviko-${pkgver}/THIRD_PARTY.md" "${pkgdir}/usr/share/doc/${pkgname}/THIRD_PARTY.md"
}
