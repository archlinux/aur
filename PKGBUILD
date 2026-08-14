# Maintainer: David Hess <davidhess336@gmx.de>
# Contributor: ZSleyer <aur@zsleyer.de>
#
# Template for the AUR package encounty-bin. Version and checksums are filled in
# by scripts/render-aur-pkgbuild.sh, which the release workflow runs on every
# stable tag before pushing the result to the AUR.

pkgname=encounty-bin
pkgver=0.24.2
pkgrel=1
pkgdesc="Free, open-source auto shiny counter for Pokémon shiny hunting."
arch=('x86_64' 'aarch64')
url="https://github.com/ZSleyer/Encounty"
# Covers everything the AppImage bundles, not just Encounty's own code. Filled
# in from packaging/aur/licenses.spdx, which "make licenses" regenerates.
license=('AGPL-3.0-only' 'Apache-2.0' 'BSD-2-Clause' 'BSD-3-Clause' 'BlueOak-1.0.0' 'GPL-3.0-only' 'ISC' 'MIT' 'Python-2.0')
# The AppImage bundles only its GL and ffmpeg libraries; the Electron runtime
# links the rest against the system. fuse2 provides libfuse.so.2, which the
# AppImage runtime dlopens on startup.
depends=('alsa-lib' 'fuse2' 'gcc-libs' 'glibc' 'gtk3' 'hicolor-icon-theme'
         'libcups' 'libdrm' 'libseccomp' 'libxkbcommon' 'libxml2' 'mesa'
         'nss' 'systemd-libs' 'zlib')
provides=("encounty=${pkgver}")
conflicts=('encounty')
options=('!strip' '!debug') # Nothing to strip or split off a precompiled AppImage

_release="${url}/releases/download/v${pkgver}"

# The icon is pinned to the release tag rather than to main so its checksum
# stays valid for the lifetime of this package version.
source=('encounty.desktop'
        "encounty-${pkgver}.png::https://raw.githubusercontent.com/ZSleyer/Encounty/v${pkgver}/backend/winres/icon.png"
        "encounty-${pkgver}-licenses.tar.gz::${_release}/Encounty-licenses.tar.gz")
source_x86_64=("encounty-${pkgver}-x86_64.AppImage::${_release}/Encounty-x86_64.AppImage")
source_aarch64=("encounty-${pkgver}-aarch64.AppImage::${_release}/Encounty-arm64.AppImage")

sha256sums=('91bc7bdf7bb85591c1618423208666d5e7892ae5a80270309a84f0d5b460628d'
            '2efee26e64e58be598aa54eee9165776fc89d9768581e2711a54f78319465158'
            '64d3c4ba0880fc2806e534b88974ef70314698c7a403d8158a3f0845d9a31174')
sha256sums_x86_64=('a5be562aa8a932243c2b61fa72ebbe8dbeabad167200118c9168ed9e8102602b')
sha256sums_aarch64=('1e687793e889a5873162b3886ade434f8f2a5dc204ea5c0f5ea946d4be68a7f6')

package() {
  # The AppImage is self-contained, so it lives in /opt and gets reached through
  # a symlink instead of being unpacked into the filesystem hierarchy.
  install -Dm755 "${srcdir}/encounty-${pkgver}-${CARCH}.AppImage" \
    "${pkgdir}/opt/${pkgname}/encounty.AppImage"
  install -d "${pkgdir}/usr/bin"
  ln -s "/opt/${pkgname}/encounty.AppImage" "${pkgdir}/usr/bin/encounty"

  install -Dm644 "${srcdir}/encounty-${pkgver}.png" \
    "${pkgdir}/usr/share/icons/hicolor/256x256/apps/encounty.png"
  install -Dm644 "${srcdir}/encounty.desktop" \
    "${pkgdir}/usr/share/applications/encounty.desktop"

  # MIT, BSD, ISC and Python licenses carry a package-specific copyright line,
  # so each needs its own copy here rather than a reference to the common set.
  install -Dm644 "${srcdir}"/licenses/* \
    -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
