# Maintainer: David Hess <davidhess336@gmx.de>
# Contributor: ZSleyer <aur@zsleyer.de>
#
# Template for the AUR package encounty-bin. Version and checksums are filled in
# by scripts/render-aur-pkgbuild.sh, which the release workflow runs on every
# stable tag before pushing the result to the AUR.

pkgname=encounty-bin
pkgver=0.28.0
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
            '4c27c82fb8da65594b434f6f41d2c099f77c23455050df7823aa993ab81c062a')
sha256sums_x86_64=('1f42257906ca9c74795fddcc1ae3d2bb9052314c9390060de4d68ec998630660')
sha256sums_aarch64=('07313ef788db812382f59aac65dcd0291bcf7808e772875b05f90080473a4fa8')

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
