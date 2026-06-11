# Maintainer: MingxuanGame <MingxuanGame@outlook.com>

pkgname=osu-gu-git
pkgver=2026.531.0.r22.g39a6450
pkgrel=1
pkgdesc="A free-to-win rhythm game. GooGuTeam fork of osu!lazer."
arch=(x86_64)
url="https://github.com/GooGuTeam/osu"
license=("MIT" "custom:CC-BY-NC 4.0")
makedepends=(git dotnet-sdk)
depends=(
  zlib
  libgl
  dotnet-runtime-8.0
  osu-mime
)
provides=(osu-gu)
conflicts=(osu-gu osu-gu-bin)
options=(!strip !debug)
source=(
  "git+https://github.com/GooGuTeam/osu.git#branch=v2"
  "icon.png"
  "https://raw.githubusercontent.com/ppy/osu-resources/master/LICENCE.md"
  "osu-gu.desktop"
  "osu-gu-uri-handler.desktop"
  "osu-gu"
)
sha256sums=('SKIP'
            '30cf4df3fd76006b08a0bcb6a325fb2fdcf6a4371f77001da3c38cbce871bd51'
            '30b914824784b6ba6b30a44b22bea4f3c6fbc10f3f0e74fde5ca76a92ef57244'
            '719733029ec5eddd3bfd9c7fdfcdcb5b4fbbc52a021d284448443d165191e34c'
            '9568f8057ace9236017f2b1a5e2df023f429915f11b99cfb26c936dce39ec63c'
            'caf1bb0929f1467d77cd4d3d94f28ebbdd4ce8b084f2193046fb40737a8bcc5b')

pkgver() {
  cd "$srcdir/osu"
  git describe --tags --long --abbrev=7 | sed 's/^v//; s/-lazer-/.r/; s/-g/.g/'
}

build() {
  cd "$srcdir/osu"
  local release_version="${pkgver%%.r*}"
  DOTNET_CLI_TELEMETRY_OPTOUT="1" dotnet publish osu.Desktop \
    --framework net8.0 \
    --configuration Release \
    --use-current-runtime \
    --no-self-contained \
    --output output \
    /property:Version="$release_version"
}

package() {
  cd "$srcdir/osu"
  install -d "$pkgdir/opt/osu-gu"
  cp -r output/* "$pkgdir/opt/osu-gu"
  install -Dm755 -t "$pkgdir/usr/bin" "$srcdir/osu-gu"
  install -Dm644 -t "$pkgdir/usr/share/applications" "$srcdir/osu-gu.desktop"
  install -Dm644 -t "$pkgdir/usr/share/applications" "$srcdir/osu-gu-uri-handler.desktop"
  install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/pixmaps/osu-gu.png"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/LICENCE.md"

  # Fix Vulkan renderer. See: https://github.com/ppy/osu/discussions/27659#discussioncomment-9101487
  ln -sf /usr/lib/libdl.so.2 "$pkgdir/opt/osu-gu/libdl.so"
}