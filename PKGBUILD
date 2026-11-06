# Maintainer: Shahrukh Khalid <90670731+Shahrukhalid@users.noreply.github.com>
# Stable binary package for Nexonic Download Manager.
# Updated on every upstream release (see scripts/package-manifests.py and
# .github/workflows/aur.yml). For the latest git main, use
# nexonic-download-manager-git instead.
pkgname=nexonic-download-manager-bin
pkgver=0.17.0
pkgrel=1
pkgdesc='Free, open-source download manager: up to 32 connections per file, pause and resume, queues and a scheduler, batch download, site grabber, browser extension and videos from YouTube and 1,000+ other sites'
arch=('x86_64' 'aarch64')
url='https://github.com/Shahrukhalid/nexonic-download-manager'
license=('MIT' 'Apache-2.0')
depends=('fontconfig' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'libice' 'libsm' 'libx11' 'openssl' 'zlib')
optdepends=('libsecret: encrypted storage of passwords and cookies in the system keyring'
            'libnotify: desktop notifications'
            'xdg-utils: opening finished files and links'
            'fuse3: running the upstream AppImage directly (not needed for this package)')
provides=('nexonic-download-manager' 'ndm')
conflicts=('nexonic-download-manager' 'nexonic-download-manager-git')
source_x86_64=("NexonicDownloadManager-Linux-x86_64.AppImage::https://github.com/Shahrukhalid/nexonic-download-manager/releases/download/v${pkgver}/NexonicDownloadManager-Linux-x86_64.AppImage")
source_aarch64=("NexonicDownloadManager-Linux-aarch64.AppImage::https://github.com/Shahrukhalid/nexonic-download-manager/releases/download/v${pkgver}/NexonicDownloadManager-Linux-aarch64.AppImage")
sha256sums_x86_64=('478fd762d817506d81e350e9ce5ada3e6db417c15322041f92ba4fe056f45349')
sha256sums_aarch64=('5c7b33a9362c00aaebb7ddc1ecd448cd935e54c549d5e8d61d5a91fc1d56dfcc')

# The upstream AppImage bundles everything (the .NET runtime, the video
# engine, ffmpeg and the browser extension). It is installed extracted into
# /opt, like the upstream .deb/.rpm, so it runs without FUSE.
package() {
  local appimage="NexonicDownloadManager-Linux-${CARCH}.AppImage"
  chmod 755 "${srcdir}/${appimage}"
  "${srcdir}/${appimage}" --appimage-extract >/dev/null
  install -dm755 "${pkgdir}/opt/nexonic-download-manager"
  cp -a "${srcdir}/squashfs-root/usr/lib/nexonic-download-manager/." "${pkgdir}/opt/nexonic-download-manager/"
  chmod 755 "${pkgdir}/opt/nexonic-download-manager/NexonicDownloadManager" \
            "${pkgdir}/opt/nexonic-download-manager/nexonic-host"

  install -dm755 "${pkgdir}/usr/bin"
  printf '#!/bin/sh\nexec /opt/nexonic-download-manager/NexonicDownloadManager "$@"\n' > "${pkgdir}/usr/bin/nexonic-download-manager"
  printf '#!/bin/sh\nexec /opt/nexonic-download-manager/nexonic-host "$@"\n' > "${pkgdir}/usr/bin/ndm"
  chmod 755 "${pkgdir}/usr/bin/nexonic-download-manager" "${pkgdir}/usr/bin/ndm"

  install -Dm644 "${srcdir}/squashfs-root/nexonic-download-manager.desktop" \
    "${pkgdir}/usr/share/applications/nexonic-download-manager.desktop"
  # The AppImage's own entry calls the bare AppRun binary name; point it at the /usr/bin launcher instead.
  sed -i 's|^Exec=NexonicDownloadManager|Exec=nexonic-download-manager|' \
    "${pkgdir}/usr/share/applications/nexonic-download-manager.desktop"
  local size
  for size in 16 24 32 48 64 128 256 512; do
    install -Dm644 "${srcdir}/squashfs-root/usr/share/icons/hicolor/${size}x${size}/apps/nexonic-download-manager.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/nexonic-download-manager.png"
  done
  install -Dm644 "${srcdir}/squashfs-root/usr/lib/nexonic-download-manager/LICENSE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${srcdir}/squashfs-root/usr/lib/nexonic-download-manager/LICENSE-APACHE.txt" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
