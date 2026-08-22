# Maintainer: MingxuanGame <MingxuanGame@outlook.com>

pkgname=g0v0
pkgver=2026.816.0
pkgrel=1
pkgdesc="g0v0! -- free and open rhythm experience! (a community project based on osu!lazer codebase)"
arch=(x86_64 aarch64)
url="https://github.com/GooGuTeam/g0v0"
license=("MIT" "custom:CC-BY-NC 4.0")
makedepends=(dotnet-sdk-8.0)
depends=(
  zlib
  libgl
  dotnet-runtime-8.0
  osu-mime
)
provides=(g0v0)
conflicts=(g0v0-bin g0v0-git)
options=(!strip !debug)
source=(
  "g0v0-${pkgver}.tar.gz::https://github.com/GooGuTeam/g0v0/archive/refs/tags/v${pkgver}-g0v0.tar.gz"
  "g0v0-resources-7fb8e1c5a1d81bdb8583ea757b4a024d57e1c65f.tar.gz::https://github.com/GooGuTeam/g0v0-resources/archive/7fb8e1c5a1d81bdb8583ea757b4a024d57e1c65f.tar.gz"
  "icon.png"
  "https://raw.githubusercontent.com/GooGuTeam/g0v0-resources/master/LICENCE.md"
  "g0v0.desktop"
  "g0v0-uri-handler.desktop"
  "g0v0"
)
sha256sums=('de8221f05d9ca38fdf8a55143991617a29c8a620649c0d4cf49e06f42816a780'
            '0747c33756e5e037a2eb191f08202b6dc826006089e8cf9f3e58993c63593a17'
            'c93f6981c6c528e717d5215eeed775cf4926fe61476d95163b3ecd5770f40dda'
            '96276add86bd921e64255ce7e5487599dbe13e6e48e96a6af1a58cc99c187648'
            'b1d3d8ad2b05ff2f461d15ff8fd73ce6ffbb75568dae2bd123b0599292259c53'
            'dfbe774cb090a23f4000859dd9bb6c79717e20d091737893b915a55db5b4965a'
            'a6f11de4394f5d3f1f1426765f67233f5ca8dcacfc113094538e2fed6fb7535d')

prepare() {
  cd "$srcdir/g0v0-${pkgver}-g0v0"
  # The GitHub tarball does not include submodule content, so populate it from the resources tarball.
  rm -rf osu.Game.Resources
  mv "$srcdir/g0v0-resources-7fb8e1c5a1d81bdb8583ea757b4a024d57e1c65f" osu.Game.Resources
}

build() {
  cd "$srcdir/g0v0-${pkgver}-g0v0"
  DOTNET_CLI_TELEMETRY_OPTOUT="1" dotnet publish osu.Desktop \
    --framework net8.0 \
    --configuration Release \
    --use-current-runtime \
    --no-self-contained \
    --output output \
    /property:Version="$pkgver"
}

package() {
  cd "$srcdir/g0v0-${pkgver}-g0v0"
  install -d "$pkgdir/opt/g0v0"
  cp -r output/* "$pkgdir/opt/g0v0"
  install -Dm755 -t "$pkgdir/usr/bin" "$srcdir/g0v0"
  install -Dm644 -t "$pkgdir/usr/share/applications" "$srcdir/g0v0.desktop"
  install -Dm644 -t "$pkgdir/usr/share/applications" "$srcdir/g0v0-uri-handler.desktop"
  install -Dm644 "$srcdir/icon.png" "$pkgdir/usr/share/pixmaps/g0v0.png"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/LICENCE.md"

  # Fix Vulkan renderer. See: https://github.com/ppy/osu/discussions/27659#discussioncomment-9101487
  ln -sf /usr/lib/libdl.so.2 "$pkgdir/opt/g0v0/libdl.so"
}
