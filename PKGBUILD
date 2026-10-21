# SPDX-License-Identifier: 0BSD
# Maintainer: G-grbz <gkhn.gurbuz@hotmail.com>

pkgname=lurviko
pkgver=1.3.2
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
checkdepends=(
  'git'
  'python' 'python-pytest' 'python-cryptography' 'breeze-icons' 'desktop-file-utils'
  'libarchive' '7zip' 'ttf-dejavu' 'dbus' 'mesa' 'xorg-server-xvfb' 'xorg-xauth'
)
optdepends=(
  'git: local repository status badges'
  'python-cryptography: standalone vault recovery tool'
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
  'kio-admin: authenticated administrator locations'
  'polkit: administrator authentication for file ownership and permissions'
)
install=lurviko.install
source=("Lurviko-${pkgver}-${pkgrel}.tar::${url}/releases/download/v${pkgver}/Lurviko-${pkgver}.tar")
sha256sums=('e82100e43aa3678b24cbfe37a02aed1328cf47c3f925ac117cfe8281ea927778')

prepare() {
  # Installed workers are found in /usr/share/Lurviko. Do not embed the
  # temporary source directory as a development-only fallback in the binary.
  sed -i 's/const QString sourceDir = QString::fromUtf8(LURVIKO_SOURCE_DIR);/const QString sourceDir;/' \
    "Lurviko-${pkgver}/src/subtitleaimanager.cpp"

  # Match the test helper fixture to Arch's libexec installation location.
  # Permission/authentication assertions stay unchanged.
  sed -i \
    -e 's|(root / "libexec").mkdir()|(root / "lib/lurviko").mkdir(parents=True)|' \
    -e 's|root / "libexec/lurviko-access-helper"|root / "lib/lurviko/lurviko-access-helper"|' \
    "Lurviko-${pkgver}/tests/run-properties-tests.py"

  # Some runners still assume an in-source build directory.
  # Use the same external build override as the other packaging test runners.
  sed -i \
    's|build = repo / "build"|build = Path(os.environ.get("LURVIKO_TEST_BUILD_DIR", str(repo / "build"))).resolve()|' \
    "Lurviko-${pkgver}/tests/run-columns-tests.py" \
    "Lurviko-${pkgver}/tests/run-search-tests.py" \
    "Lurviko-${pkgver}/tests/run-thumbnail-tests.py"
}

build() {
  cmake -S "Lurviko-${pkgver}" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_LIBEXECDIR=lib/lurviko \
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
