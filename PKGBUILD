# Maintainer: CloverGit <clovergit@hotmail.com>
# Contributor: yjun <jerrysteve1101 at gmail dot com>

pkgbase=openmv-ide-bin
pkgname=(
  'openmv-ide-bin'
  'openmv-ide-arm-toolchain-bin'
  'openmv-ide-stedgeai-bin'
  'openmv-ide-ffmpeg-bin'
)

_pkgname=${pkgbase%-bin}

pkgver=5.1.0
pkgrel=2

pkgdesc="QtCreator based OpenMV IDE."
arch=('x86_64')
url="https://github.com/openmv/openmv-ide"
license=('MIT')

makedepends=('rsync')

options=('!strip')

source_x86_64=(
  "https://github.com/openmv/openmv-ide/releases/download/v${pkgver}/${_pkgname}-linux-x86_64-${pkgver}.tar.gz"
)

sha256sums_x86_64=(
  '3baa87a17290f50a149fdefac93f40dc964a27bb3194e1d1c62dc45eac00c9bf'
)

package_openmv-ide-bin() {
  pkgdesc="QtCreator based OpenMV IDE."

  depends=(
    'fontconfig'
    'freetype2'
    'libxcb'
    'libpng'
    'libusb'
    'python-pyusb'
  )

  optdepends=(
    'openmv-ide-arm-toolchain-bin: Bundled ARM GNU Toolchain'
    'openmv-ide-stedgeai-bin: ST Edge AI model generation'
    'openmv-ide-ffmpeg-bin: Video playback and conversion'
  )

  provides=("${_pkgname}")
  conflicts=("${_pkgname}")

  cd "${srcdir}/${_pkgname}"

  install -dm755 "${pkgdir}/opt/${_pkgname}"

  # Install IDE, excluding optional components.
  rsync -a \
    --no-owner \
    --no-group \
    --exclude='/share/qtcreator/arm/***' \
    --exclude='/share/qtcreator/stedgeai/***' \
    --exclude='/share/qtcreator/ffmpeg/linux-x86_64/***' \
    --exclude='/share/qtcreator/copilot.vim/***' \
    --exclude='/share/qtcreator/node/***' \
    --exclude='/lib/qtcreator/plugins/libCopilot.so' \
    ./ "${pkgdir}/opt/${_pkgname}/"

  # Desktop entry
  install -Dm644 share/applications/io.openmv.openmvide.desktop "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Icons
  install -dm755 "${pkgdir}/usr/share"
  cp -a share/icons "${pkgdir}/usr/share/"

  # Binary symlink
  install -dm755 "${pkgdir}/usr/bin"
  ln -s "/opt/${_pkgname}/bin/openmvide" "${pkgdir}/usr/bin/openmvide"

  # udev rules
  install -Dm644 share/qtcreator/pydfu/{99-openmv,99-openmv-arduino,99-openmv-nxp}.rules -t "${pkgdir}/usr/lib/udev/rules.d/"
}

package_openmv-ide-arm-toolchain-bin() {
  pkgdesc="Bundled ARM GNU Toolchain for OpenMV IDE"

  depends=("openmv-ide-bin=${pkgver}-${pkgrel}")

  install -dm755 "${pkgdir}/opt/${_pkgname}/share/qtcreator"

  cp -a "${srcdir}/${_pkgname}/share/qtcreator/arm" "${pkgdir}/opt/${_pkgname}/share/qtcreator/"
}

package_openmv-ide-stedgeai-bin() {
  pkgdesc="ST Edge AI Core for OpenMV IDE"

  depends=("openmv-ide-bin=${pkgver}-${pkgrel}")

  optdepends=(
    'openmv-ide-arm-toolchain-bin: Bundled ARM GCC for relocatable model generation'
  )

  install -dm755 "${pkgdir}/opt/${_pkgname}/share/qtcreator"

  cp -a "${srcdir}/${_pkgname}/share/qtcreator/stedgeai" "${pkgdir}/opt/${_pkgname}/share/qtcreator/"
}

package_openmv-ide-ffmpeg-bin() {
  pkgdesc="Bundled FFmpeg tools for OpenMV IDE"

  depends=("openmv-ide-bin=${pkgver}-${pkgrel}")

  install -dm755 "${pkgdir}/opt/${_pkgname}/share/qtcreator/ffmpeg"

  cp -a "${srcdir}/${_pkgname}/share/qtcreator/ffmpeg/linux-x86_64" "${pkgdir}/opt/${_pkgname}/share/qtcreator/ffmpeg/"
}

# vim: set sw=2 ts=2 et:
