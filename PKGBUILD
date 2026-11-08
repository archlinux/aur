# Maintainer: Nico <d3sox at protonmail dot com>

pkgname=opentubex-git
_pkgname=OpenTubeX
_ghurl="https://github.com/OpenTubeX/OpenTubeX"
pkgver=0.37.4.r15.g02d0717ed
pkgrel=1
pkgdesc='A highly customizable, privacy-focused desktop YouTube client'
arch=('x86_64' 'aarch64')
url="https://opentubex.org"
license=('AGPL-3.0-or-later')
depends=('electron44')
optdepends=('ffmpeg: Use the system FFmpeg when installed before first launch; configurable later in Settings'
            'yt-dlp: Use the system yt-dlp when installed before first launch; configurable later in Settings')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
makedepends=('git' 'npm' 'pnpm' 'go')
source=("git+$_ghurl"
        opentubex.desktop
        opentubex.sh)
sha256sums=('SKIP'
            '70ef7749ceb85a37945e69eef29933cc48114e420f795f682d0031e74455dba2'
            'adafaa17c44e418469ab77c74a7d4d8de994a6e054c1e3ad035853bcf3365e47')

pkgver() {
  cd "$srcdir/$_pkgname"
  # v0.37.4-beta-10-ga2d164ad9 becomes 0.37.4.r10.ga2d164ad9.
  git describe --long --tags --abbrev=9 --match 'v*-beta' \
    | sed -E 's/^v//; s/-beta-([0-9]+)-g/.r\1.g/'
}

prepare() {
  # About only shows the commit line for nightly versions; widen that check for
  # -git builds so we can keep package.json as the base SemVer.
  sed -i 's/NIGHTLY_VERSION_PATTERN.test(version) && commit.length > 0/commit.length > 0/' \
    "$srcdir/$_pkgname/src/renderer/helpers/versionDisplay.js"
  grep -Fq 'return commit.length > 0' \
    "$srcdir/$_pkgname/src/renderer/helpers/versionDisplay.js" || {
    printf '%s\n' 'Failed to show the commit in About for -git builds' >&2
    return 1
  }

  sed -i "/^export default {/a\\  electronDist: '/usr/lib/electron44'," \
    "$srcdir/$_pkgname/_scripts/ebuilder.config.mjs"
  sed -i "/Platform\\.LINUX\\.createTarget/s/\\[[^]]*\\]/['dir']/" \
    "$srcdir/$_pkgname/_scripts/build.mjs"
  grep -Fq "Platform.LINUX.createTarget(['dir'], arch)" \
    "$srcdir/$_pkgname/_scripts/build.mjs" || {
    printf '%s\n' 'Failed to restrict the OpenTubeX build to the unpacked directory' >&2
    return 1
  }
}

build() {
  cd "$srcdir/$_pkgname"
  # Keep build temporary files off the quota-limited /tmp filesystem.
  export TMPDIR="$srcdir/tmp"
  mkdir -p "$TMPDIR"
  pnpm install --frozen-lockfile
  # Webpack maps GITHUB_SHA -> BUILD_COMMIT for the About commit line.
  GITHUB_SHA="$(git rev-parse HEAD)" pnpm build
}

package() {
  local build_directory=linux-unpacked
  if [[ $CARCH == aarch64 ]]; then
    build_directory=linux-arm64-unpacked
  fi
  install -d "${pkgdir}"/{usr/bin,usr/lib/opentubex-git}
  cp -R "./$_pkgname/build/$build_directory/resources/"{app.asar,app.asar.unpacked} "$pkgdir/usr/lib/$pkgname"
  install -Dm755 "./opentubex.sh" "$pkgdir/usr/bin/opentubex"

  cd $_pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "./_icons/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/opentubex.svg"
  cd ..
  install -Dm644 "opentubex.desktop" "$pkgdir/usr/share/applications/opentubex.desktop"
}
