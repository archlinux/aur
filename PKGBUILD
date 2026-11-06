# Maintainer: severaltranscats <severaltranscats at cleo dot nyc>
# Contributor: <d3sox at protonmail dot com>

pkgname=opentubex
_pkgname=OpenTubeX
_ghurl="https://github.com/OpenTubeX/OpenTubeX"
pkgver=0.37.4
_pkgver="$pkgver-beta"
pkgrel=1
pkgdesc='A highly customizable, privacy-focused desktop YouTube client'
arch=('any')
url="https://opentubex.org"
license=('AGPL-3.0-or-later')
depends=('electron44')
optdepends=('ffmpeg: Use the system FFmpeg when installed before first launch; configurable later in Settings'
            'yt-dlp: Use the system yt-dlp when installed before first launch; configurable later in Settings')
makedepends=('git' 'npm' 'pnpm' 'go')
changelog=opentubex.changelog
source=("$pkgname-$pkgver.tar.gz::${_ghurl}/archive/refs/tags/v${pkgver}-beta.tar.gz"
        opentubex.desktop
        opentubex.sh)
sha256sums=('78712a8528ae5c41543d54b6c33c21324c87fe78bc3042fff954178d890f810d'
            '63154cb6dd377c8d70714bb858405f95d88a849815d86bf7cf1b6b344cc54b5d'
            '4779a1453099f738e59efb59a6f13ce192aaa9cababdce7db000253144e7ff9a')

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
  pnpm build
}

package() {
  install -d "${pkgdir}"/{usr/bin,usr/lib/opentubex}
  cp -R "./$_pkgname-$_pkgver/build/linux-unpacked/resources/"app.asar* "$pkgdir/usr/lib/$pkgname"
  install -Dm755 "./opentubex.sh" "$pkgdir/usr/bin/opentubex"

  cd "$_pkgname-$_pkgver"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "./_icons/icon.svg" "$pkgdir/usr/share/pixmaps/opentubex.svg"
  cd ..
  install -Dm644 "opentubex.desktop" "$pkgdir/usr/share/applications/opentubex.desktop"
}
