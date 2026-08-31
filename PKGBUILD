# Maintainer: Nico <d3sox at protonmail dot com>

pkgname=opentubex-git
_pkgname=OpenTubeX
_ghurl="https://github.com/OpenTubeX/OpenTubeX"
pkgver=r12607.a8dc8e696
pkgrel=2
pkgdesc='A highly customizable, privacy-focused desktop YouTube client'
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://opentubex.org"
license=('AGPL-3.0-or-later')
depends=('electron43')
optdepends=('ffmpeg: Use the system FFmpeg when installed before first launch; configurable later in Settings'
            'yt-dlp: Use the system yt-dlp when installed before first launch; configurable later in Settings')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=('git' 'npm' 'pnpm')
source=("git+$_ghurl"
        opentubex.desktop
        opentubex.sh)
sha256sums=('SKIP'
            '03448152a98649991bc6a1f1c74fa20fb43d729f5aa7d2a17d0b2074b22a08f2'
            'aa19fec357ea16529f83e81f5097a46d61b1a8b0964f56961a794704d3208a80')

pkgver() {
  cd "$srcdir/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # About only shows the commit line for nightly versions; widen that check for
  # -git builds so we can keep package.json as the base SemVer.
  sed -i 's/NIGHTLY_VERSION_PATTERN.test(version) && commit.length > 0/commit.length > 0/' \
    "$srcdir/$_pkgname/src/renderer/helpers/versionDisplay.js"

  sed -i "/^export default {/a\\  electronDist: '/usr/lib/electron43'," \
    "$srcdir/$_pkgname/_scripts/ebuilder.config.mjs"
  sed -i "s/targets = Platform.LINUX.*/targets = Platform.LINUX.createTarget(['dir'], arch)/" "$srcdir/$_pkgname/_scripts/build.mjs"
}

build() {
  cd "$srcdir/$_pkgname"
  pnpm install --frozen-lockfile
  # Webpack maps GITHUB_SHA -> BUILD_COMMIT for the About commit line.
  GITHUB_SHA="$(git rev-parse HEAD)" pnpm build
}

package() {
  install -d "${pkgdir}"/{usr/bin,usr/lib/opentubex-git}
  cp -R "./$_pkgname/build/linux-unpacked/resources/app.asar" "$pkgdir/usr/lib/$pkgname"
  install -Dm755 "./opentubex.sh" "$pkgdir/usr/bin/opentubex"
  
  cd $_pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "./_icons/icon.svg" "$pkgdir/usr/share/pixmaps/opentubex.svg"
  cd ..
  install -Dm644 "opentubex.desktop" "$pkgdir/usr/share/applications/opentubex.desktop"
}
