# Maintainer: neeshy <neeshy@tfwno.gf>
# Contributor: morguldir <morguldir@protonmail.com
# Contributor: Ammon Smith <ammon.i.smith@gmail.com>
# Contributor: Nicole Fontenot <nfontenot27@gmail.com>
# Contributor: "donaldtrump" [AUR]
pkgname=osu-lazer
_pkgname=osu
pkgver=2024.131.0
pkgrel=3
pkgdesc="A free-to-win rhythm game. Rhythm is just a *click* away!"
arch=('x86_64')
url="https://osu.ppy.sh/"
license=('MIT' 'custom:CC-BY-NC-4.0')
depends=('ffmpeg' 'libgl' 'sdl2' 'dotnet-runtime-6.0-bin')
makedepends=('dotnet-sdk-6.0-bin')
source=("https://github.com/ppy/osu/archive/$pkgver.tar.gz"
        "https://github.com/ppy/osu-resources/raw/master/LICENCE.md"
        "osu-lazer.sh"
        "osu-lazer.desktop"
        "osu-lazer.xml")
sha256sums=('67e0ca0cc825ff459e34c7d0cd73dd77a4ac41c6b3550dd300865c524e91cb3a'
            '30b914824784b6ba6b30a44b22bea4f3c6fbc10f3f0e74fde5ca76a92ef57244'
            '488b52f62445054d0615c334b6bd81ffa70d00964e91384a9cad92c54b216b3d'
            'c22099222c01f33979e17ec0575b864f018f5f416919f9ed1b2b99584a5d37d6'
            'e01a156e7c9bb11ad5b1e1698b029378cb971c29469fc3dceca9421e9a81f3e8')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  DOTNET_CLI_TELEMETRY_OPTOUT="1" dotnet publish osu.Desktop \
    --framework net6.0 \
    --configuration Release \
    --use-current-runtime \
    --no-self-contained \
    --output output \
    /property:Version="$pkgver"
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  install -d "$pkgdir/opt/osu-lazer"
  cp -r output/* "$pkgdir/opt/osu-lazer"
  install -Dm755 "$srcdir/osu-lazer.sh" "$pkgdir/usr/bin/osu-lazer"
  install -Dm644 "$srcdir/osu-lazer.desktop" "$pkgdir/usr/share/applications/osu-lazer.desktop"
  install -Dm644 "$srcdir/osu-lazer.xml" "$pkgdir/usr/share/mime/packages/osu-lazer.xml"
  install -Dm644 assets/lazer-nuget.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/osu-lazer.png"
  install -Dm644 assets/lazer.png "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/osu-lazer.png"
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/osu-lazer/MIT"
  install -Dm644 "$srcdir/LICENCE.md" "$pkgdir/usr/share/licenses/osu-lazer/CC-BY-NC-4.0"
}
