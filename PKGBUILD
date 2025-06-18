# Maintainer: Enamul Hasan <enamulhabid at gmail dot com>
pkgname=gtaf-quran
pkgver=0.5.11  # Default to x86_64 version
pkgrel=1
pkgdesc="Al Quran (Tafsir & By Word) by Greentech Apps Foundation"
arch=('x86_64' 'aarch64')
url="https://flathub.org/apps/org.gtaf.quran"
license=('LicenseRef-Proprietary')
depends=(
  'ffmpeg' 'libass' 'libplacebo' 'mpv' 'gnutls' 'aom' 'dav1d' 'freetype2'
  'lame' 'opus' 'vulkan-icd-loader' 'shaderc' 'pipewire-pulse' 'libaacs'
)
makedepends=('imagemagick' 'curl')  # needed to convert .ico to .png

# Version variables for different architectures
_x86_64_ver=0.5.11
_aarch64_ver=0.5.9

# Source files
source=(
  "https://raw.githubusercontent.com/flathub/org.gtaf.quran/master/org.gtaf.quran.appdata.xml"
)

# Architecture-specific sources
source_x86_64=(
  "https://direct-download-apps.s3.us-east-2.amazonaws.com/quran/quran_${_x86_64_ver}_x86_64.tar.gz"
)
source_aarch64=(
  "https://direct-download-apps.s3.us-east-2.amazonaws.com/quran/quran_${_aarch64_ver}_arm64.tar.gz"
)

# Checksums
sha256sums=('SKIP')  # For the appdata.xml from GitHub
sha256sums_x86_64=('2dea85c6b7ec1f95405a9c9724008be759d8688124aa332e459927d41752d68b')
sha256sums_aarch64=('d690a161d3e919392a4f1c1ef15d715395ed3010d01c4328bc6775fb0f34e4b9')

prepare() {
  cd "$srcdir"
  curl -LO https://quran.gtaf.org/favicon.ico
  # Convert favicon.ico to PNG with ImageMagick's convert
  convert favicon.ico "${pkgname}.png"
  rm favicon.ico
}

package() {
  # Create directory structure
  install -d "${pkgdir}/usr/lib/${pkgname}"
  install -d "${pkgdir}/usr/share/${pkgname}"
  install -d "${pkgdir}/usr/bin"

  # Move files to their destinations
  mv "${srcdir}/data/quran/lib" "${pkgdir}/usr/lib/${pkgname}/lib"
  mv "${srcdir}/data/quran/data/"* "${pkgdir}/usr/share/${pkgname}"
  mv "${srcdir}/data/quran/qm_flutter" "${pkgdir}/usr/lib/${pkgname}/quran"

  # Create symlinks
  ln -s "../lib/${pkgname}/quran" "${pkgdir}/usr/bin/${pkgname}"
  ln -s "../../share/${pkgname}" "${pkgdir}/usr/lib/${pkgname}/data"

  # Install desktop file and icon
  install -Dm644 "${srcdir}/data/gui/quran.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  install -Dm644 "${srcdir}/data/gui/quran.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.svg"
  install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<EOF
[Desktop Entry]
Name=Al Quran (Tafsir & By Word)
Comment=Al Quran (Tafsir & By Word) by Greentech Apps Foundation
Exec=/usr/bin/${pkgname}
Icon=${pkgname}
Terminal=false
Type=Application
Categories=Education;
Keywords=alquran;quran;quranlinux;tafsir;tafseer;gtaf;greentechapps;greentech
EOF

  install -Dm644 "${srcdir}/${pkgname}.png" "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${pkgname}.png"

  # Install appdata
  install -Dm644 "${srcdir}/org.gtaf.quran.appdata.xml" \
    "${pkgdir}/usr/share/metainfo/${pkgname}.appdata.xml"
}
