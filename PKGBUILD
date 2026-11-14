# Maintainer: severaltranscats <severaltranscats at cleo dot nyc>
# Contributor: <d3sox at protonmail dot com>

pkgname=opentubex
_pkgname=OpenTubeX
_ghurl="https://github.com/OpenTubeX/OpenTubeX"
pkgver=0.38.0
_pkgver="$pkgver-beta"
pkgrel=1
pkgdesc='A highly customizable, privacy-focused desktop YouTube client'
arch=('x86_64' 'aarch64')
url="https://opentubex.org"
license=('AGPL-3.0-or-later')
depends=('electron44')
optdepends=('ffmpeg: Use the system FFmpeg when installed before first launch; configurable later in Settings'
            'yt-dlp: Use the system yt-dlp when installed before first launch; configurable later in Settings')
makedepends=('git' 'npm' 'pnpm' 'go')
changelog=opentubex.changelog
source=("$pkgname-$pkgver.tar.gz::${_ghurl}/archive/refs/tags/v${_pkgver}.tar.gz"
        opentubex.desktop
        opentubex.sh)
sha256sums=('8f02fe1926c3ce1e21c1437d7722bc9e935604570a4aea817af1d7fc27addc30'
            '70ef7749ceb85a37945e69eef29933cc48114e420f795f682d0031e74455dba2'
            '06c5938a8fa979bc0f5fc34c14b4cdd6d938b3fccb997651e9354393b6bb6b92')

prepare() {
  sed -i "/^export default {/a\\  electronDist: '/usr/lib/electron44'," \
    "$srcdir/$_pkgname-$_pkgver/_scripts/ebuilder.config.mjs"
  sed -i "/Platform\\.LINUX\\.createTarget/s/\\[[^]]*\\]/['dir']/" \
    "$srcdir/$_pkgname-$_pkgver/_scripts/build.mjs"
  grep -Fq "Platform.LINUX.createTarget(['dir'], arch)" \
    "$srcdir/$_pkgname-$_pkgver/_scripts/build.mjs" || {
    printf '%s\n' 'Failed to restrict the OpenTubeX build to the unpacked directory' >&2
    return 1
  }
}

build() {
  cd "$srcdir/$_pkgname-$_pkgver"
  # Keep build temporary files off the quota-limited /tmp filesystem.
  export TMPDIR="$srcdir/tmp"
  mkdir -p "$TMPDIR"
  pnpm install --frozen-lockfile
  pnpm run pack
  # 0.37.4 builds for x64 unless it is given the architecture.
  local build_arch=x64
  if [[ $CARCH == aarch64 ]]; then
    build_arch=arm64
  fi
  pnpm run build-release "$build_arch"
}

package() {
  local build_directory=linux-unpacked
  if [[ $CARCH == aarch64 ]]; then
    build_directory=linux-arm64-unpacked
  fi
  install -d "${pkgdir}"/{usr/bin,usr/lib/opentubex}
  cp -R "./$_pkgname-$_pkgver/build/$build_directory/resources/"app.asar* "$pkgdir/usr/lib/$pkgname"
  install -Dm755 "./opentubex.sh" "$pkgdir/usr/bin/opentubex"

  cd "$_pkgname-$_pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "./_icons/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/opentubex.svg"
  cd ..
  install -Dm644 "opentubex.desktop" "$pkgdir/usr/share/applications/opentubex.desktop"
}
