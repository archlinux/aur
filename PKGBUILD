# Maintainer: neeshy <neeshy@tfwno.gf>
# Contributor: morguldir <morguldir@protonmail.com
# Contributor: Ammon Smith <ammon.i.smith@gmail.com>
# Contributor: Nicole Fontenot <nfontenot27@gmail.com>
# Contributor: "donaldtrump" [AUR]
pkgname=osu-lazer
_pkgname=osu
pkgver=2023.403.1
pkgrel=3
pkgdesc="rhythm is just a *click* away!"
arch=('x86_64')
url="https://osu.ppy.sh/"
license=('MIT' 'custom:CC-BY-NC-4.0')
depends=('ffmpeg' 'libgl' 'sdl2' 'dotnet-runtime-6.0')
makedepends=('dotnet-sdk>=6.0.8.sdk400')
source=("https://github.com/ppy/osu/archive/$pkgver.tar.gz"
        "https://github.com/ppy/osu-resources/raw/master/LICENCE.md"
        "osu-lazer.sh"
        "osu-lazer.desktop"
        "osu-lazer.xml"
        "osu-lazer-online.patch")
sha256sums=('c06240df097e48587873ef96d856708757960522910bdbb247e3e077e3a05847'
            '30b914824784b6ba6b30a44b22bea4f3c6fbc10f3f0e74fde5ca76a92ef57244'
            'b645a8653c78b136c4934194b3dce390e854b3c90c43c889631b9ab3b77022af'
            '9935414fdd95c02c7fd2d0d200ce1037dfce95cd7f1d04b25a275ce0902401c6'
            'dc79a5aa4084b77a19642336d4eacdc990b18204cb4327571c50b2b0f19eb1cf'
            'ea59e3642a91df50dd07d410bb1addd9ce36c985be8c54615c78c1b73da3bd4b')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"
  patch -Np1 -i "$srcdir/osu-lazer-online.patch"
}

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
