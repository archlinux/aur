# SPDX-License-Identifier: 0BSD
# Maintainer: G-grbz <gkhn.gurbuz@hotmail.com>

pkgname=lurviko
pkgver=1.6.4
pkgrel=1
pkgdesc='Qt Quick file manager with media libraries, cloud storage and an encrypted vault'
arch=('x86_64')
url='https://github.com/G-grbz/Lurviko'
license=('GPL-3.0-or-later' 'CC-BY-4.0')
depends=(
  'gcc-libs' 'glibc'
  'qt6-base>=6.8' 'qt6-declarative>=6.8' 'qt6-multimedia>=6.8'
  'qt6-networkauth>=6.8' 'qt6-svg>=6.8'
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
  'git: repository management, synchronization and status badges'
  'samba: folder sharing in Properties, Samba password and share status'
  'udisks2: mounting disk images (ISO, IMG, SquashFS, ...) from the context menu'
  'qemu-img: mounting qcow2, VMDK, VDI, VHD and VHDX images (qemu-nbd)'
  'python-cryptography: standalone vault recovery tool'
  'qt6-wayland: Wayland desktop sessions'
  'qt6-imageformats: additional image formats'
  'ffmpegthumbnailer: video thumbnails'
  'poppler: PDF thumbnails'
  'kimageformats: HEIC, AVIF, JXL, PSD, KRA, XCF and camera RAW thumbnails'
  'ghostscript: PostScript and EPS thumbnails'
  'djvulibre: DjVu thumbnails'
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
  'kio-extras: additional network and filesystem protocols (SFTP, SMB, ...)'
  'avahi: finding SSH/SFTP servers on the local network'
  'kio-admin: authenticated administrator locations'
  'polkit: administrator authentication for permissions, Samba password and share status'
  'xdg-desktop-portal: optional system-wide native Open/Save dialogs'
)
install=lurviko.install
source=("Lurviko-${pkgver}-${pkgrel}.tar::${url}/releases/download/v${pkgver}/Lurviko-${pkgver}.tar")
# SHA-256 of the reproducible v1.6.4 source archive.
sha256sums=('3b451a79d6e886f222c40f41ddacd5e64ac54b11ca03f341b9e7d8f42ce02cdf')

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
}

build() {
  cmake -S "Lurviko-${pkgver}" -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_LIBEXECDIR=lib/lurviko \
    -DCMAKE_SKIP_INSTALL_RPATH=ON \
    -DLURVIKO_INSTALL_SYSTEM_FILEMANAGER1=OFF \
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

  # CMake installs FileManager1 as an opt-in template (not a global service).
  # Keep the separate Lurviko FileChooser portal activation service installed.
  sed -i 's|^Exec=.*|Exec=/usr/bin/lurviko --filemanager1|' \
    "${pkgdir}/usr/share/Lurviko/dbus-1/services/org.freedesktop.FileManager1.service"

  install -Dm644 "Lurviko-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "Lurviko-${pkgver}/assets/LICENSE-FluentUI.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-FluentUI.txt"
  install -Dm644 "Lurviko-${pkgver}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "Lurviko-${pkgver}/THIRD_PARTY.md" "${pkgdir}/usr/share/doc/${pkgname}/THIRD_PARTY.md"
  install -d "${pkgdir}/usr/share/doc/${pkgname}/docs"
  install -m644 "Lurviko-${pkgver}"/docs/*.md "${pkgdir}/usr/share/doc/${pkgname}/docs/"
}
