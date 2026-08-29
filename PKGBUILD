# Maintainer: MingxuanGame <MingxuanGame@outlook.com>

pkgname=ez2lazer
pkgver=2026.830.0
pkgrel=1
pkgdesc="Ez to Lazer, As a cool client. (a fork of osu!lazer)"
arch=(x86_64)
url="https://github.com/SK-la/Ez2Lazer"
license=("MIT" "custom:CC-BY-NC 4.0")
makedepends=(dotnet-sdk)
depends=(
  zlib
  libgl
  dotnet-runtime-8.0
  osu-mime
)
provides=(ez2lazer)
conflicts=(ez2lazer-bin ez2lazer-git)
options=(!strip !debug)
source=("Ez2Lazer-${pkgver}.tar.gz::https://github.com/SK-la/Ez2Lazer/archive/${pkgver}-ez2lazer.tar.gz"
  'icon.png'
  'https://raw.githubusercontent.com/ppy/osu-resources/master/LICENCE.md'
  'ez2lazer.desktop'
  'ez2lazer-uri-handler.desktop'
  'ez2lazer')
sha256sums=('27aa6a6b31595b1e2301b643acb3982e7e2f4b1e2d628c4133b9cd45d1d9cb74'
            'ae382d6f50b8a767ccb30f49925020b610805f5403b7a99cd331a4f7b720e8ac'
            '30b914824784b6ba6b30a44b22bea4f3c6fbc10f3f0e74fde5ca76a92ef57244'
            'c59ce9a6c90cfafb97c6a8f5f01c7a95191565c7169603c40fa785fc01e0b557'
            'ca8f63ca0c535ee08ef1a28066f6ae689bcd84e3af6c5fb3af3b1d5e8739653e'
            '3ce1118a5484a54369d7bc34447fda62323a9bf35ae5078da6d02c548d3311bb')

build() {
  cd "$srcdir/Ez2Lazer-$pkgver"
  DOTNET_CLI_TELEMETRY_OPTOUT="1" dotnet publish osu.Desktop \
    --framework net8.0 \
    --configuration Release \
    --use-current-runtime \
    --no-self-contained \
    --output output \
    /property:Version="$pkgver"
}


package() {
  cd "$srcdir/Ez2Lazer-$pkgver"
  install -d "$pkgdir/opt/ez2lazer"
  cp -r output/* "$pkgdir/opt/ez2lazer"
  install -Dm755 -t "$pkgdir/usr/bin" "$srcdir/ez2lazer"
  install -Dm644 -t "$pkgdir/usr/share/applications" "$srcdir/ez2lazer.desktop"
  install -Dm644 -t "$pkgdir/usr/share/applications" "$srcdir/ez2lazer-uri-handler.desktop"
  install -Dm644 -t "$pkgdir/usr/share/pixmaps" "$srcdir/icon.png"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" "$srcdir/LICENCE.md"

  # Fix Vulkan renderer. See: https://github.com/ppy/osu/discussions/27659#discussioncomment-9101487
  ln -sf /usr/lib/libdl.so.2 "$pkgdir/opt/ez2lazer/libdl.so"
}
