# Maintainer: Shahrukh Khalid <90670731+Shahrukhalid@users.noreply.github.com>
# Development snapshot: builds the latest git main from source, so installing
# this package always gives the newest code. For stable releases, use
# nexonic-download-manager-bin instead.
pkgname=nexonic-download-manager-git
pkgver=0.17.0.r0.g0000000
pkgrel=1
pkgdesc='Free, open-source download manager (latest git snapshot): up to 32 connections per file, pause and resume, queues and a scheduler, batch download, site grabber, browser extension and videos from YouTube and 1,000+ other sites'
arch=('x86_64' 'aarch64')
url='https://github.com/Shahrukhalid/nexonic-download-manager'
license=('MIT' 'Apache-2.0')
depends=('fontconfig' 'gcc-libs' 'glibc' 'hicolor-icon-theme' 'libice' 'libsm' 'libx11' 'openssl' 'zlib')
makedepends=('git' 'dotnet-sdk-8.0' 'python' 'cmake' 'ninja' 'pkgconf' 'nodejs' 'npm' 'ffmpeg')
optdepends=('libsecret: encrypted storage of passwords and cookies in the system keyring'
            'libnotify: desktop notifications'
            'xdg-utils: opening finished files and links')
provides=('nexonic-download-manager')
conflicts=('nexonic-download-manager' 'nexonic-download-manager-bin')
source=('git+https://github.com/Shahrukhalid/nexonic-download-manager.git')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/nexonic-download-manager"
  local ver rev hash
  ver="$(tr -d '[:space:]' < VERSION)"
  rev="$(git rev-list --count HEAD)"
  hash="$(git rev-parse --short HEAD)"
  printf '%s.r%s.g%s' "${ver}" "${rev}" "${hash}"
}

build() {
  cd "${srcdir}/nexonic-download-manager"
  # Video tools: fetch the pinned yt-dlp/qjs and reuse the system ffmpeg
  # (Arch's extra/ffmpeg) instead of compiling ffmpeg from source.
  bash scripts/fetch-video-tools.sh "linux-${CARCH}" "${srcdir}/tools-cache"
  mkdir -p "${srcdir}/ffmpeg-bin"
  ln -sf /usr/bin/ffmpeg "${srcdir}/ffmpeg-bin/ffmpeg"
  ln -sf /usr/bin/ffprobe "${srcdir}/ffmpeg-bin/ffprobe"
  local rid
  case "${CARCH}" in
    x86_64) rid=linux-x64 ;;
    aarch64) rid=linux-arm64 ;;
  esac
  python3 scripts/build-torrent-native.py "${rid}"
  bash "linux/packaging/build.sh" "${CARCH}" "${srcdir}/ffmpeg-bin" "${srcdir}/tools-cache"
}

check() {
  cd "${srcdir}/nexonic-download-manager"
  local rid
  case "${CARCH}" in
    x86_64) rid=linux-x64 ;;
    aarch64) rid=linux-arm64 ;;
  esac
  dotnet test "linux/Tests/Tests.csproj" -p:NativeTorrentLibrary="${PWD}/.native-cache/sdk/${rid}/lib/libnexonic_torrent.so"
}

package() {
  cd "${srcdir}/nexonic-download-manager"
  local out="build/linux-${CARCH}" app="${out}/app"
  install -dm755 "${pkgdir}/opt/nexonic-download-manager"
  cp -a "${app}/." "${pkgdir}/opt/nexonic-download-manager/"
  chmod 755 "${pkgdir}/opt/nexonic-download-manager/NexonicDownloadManager" \
            "${pkgdir}/opt/nexonic-download-manager/nexonic-host"

  install -dm755 "${pkgdir}/usr/bin"
  printf '#!/bin/sh\nexec /opt/nexonic-download-manager/NexonicDownloadManager "$@"\n' > "${pkgdir}/usr/bin/nexonic-download-manager"
  printf '#!/bin/sh\nexec /opt/nexonic-download-manager/nexonic-host "$@"\n' > "${pkgdir}/usr/bin/ndm"
  chmod 755 "${pkgdir}/usr/bin/nexonic-download-manager" "${pkgdir}/usr/bin/ndm"

  install -Dm644 linux/packaging/nexonic-download-manager.desktop \
    "${pkgdir}/usr/share/applications/nexonic-download-manager.desktop"
  local size
  for size in 16 24 32 48 64 128 256 512; do
    install -Dm644 "branding/universal/generated/linux/${size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/nexonic-download-manager.png"
  done
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 LICENSE-APACHE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-APACHE"
}
