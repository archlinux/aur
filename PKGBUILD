# Maintainer: neeshy <neeshy@tfwno.gf>
# Contributor: Nguyễn Chính Hữu <huupoke12@gmail.com>
# Contributor: Ammon Smith <ammon.i.smith@gmail.com>
# Contributor: Nicole Fontenot <nfontenot27@gmail.com>
# Contributor: "Ferdi265" [AUR]
# Contributor: "downbtn" [AUR]
# Contributor: "Roliga" [AUR]
# Contributor: "donaldtrump" [AUR]
pkgname=osu-lazer-git
_pkgname=osu
pkgver=latest
pkgrel=1
pkgdesc="A free-to-win rhythm game. Rhythm is just a *click* away!"
arch=('x86_64')
url="https://osu.ppy.sh/"
license=('MIT AND CC-BY-NC-4.0')
depends=('ffmpeg' 'libgl' 'sdl2' 'dotnet-runtime')
makedepends=('git' 'dotnet-sdk')
provides=('osu-lazer')
conflicts=('osu-lazer')
source=("git+https://github.com/ppy/osu.git"
        "osu-lazer.sh"
        "osu-lazer.desktop"
        "osu-lazer.xml")
sha256sums=('SKIP'
            '488b52f62445054d0615c334b6bd81ffa70d00964e91384a9cad92c54b216b3d'
            'c22099222c01f33979e17ec0575b864f018f5f416919f9ed1b2b99584a5d37d6'
            'e01a156e7c9bb11ad5b1e1698b029378cb971c29469fc3dceca9421e9a81f3e8')

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags | sed 's/\([^-]*-\)g/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$_pkgname"
  DOTNET_CLI_TELEMETRY_OPTOUT="1" dotnet publish osu.Desktop \
    --framework net8.0 \
    --configuration Release \
    --use-current-runtime \
    --no-self-contained \
    --output output
}

package() {
  cd "$srcdir/$_pkgname"
  install -d "$pkgdir/opt/osu-lazer"
  cp -r output/* "$pkgdir/opt/osu-lazer"
  install -Dm755 "$srcdir/osu-lazer.sh" "$pkgdir/usr/bin/osu-lazer"
  install -Dm644 "$srcdir/osu-lazer.desktop" "$pkgdir/usr/share/applications/osu-lazer.desktop"
  install -Dm644 "$srcdir/osu-lazer.xml" "$pkgdir/usr/share/mime/packages/osu-lazer.xml"
  install -Dm644 assets/lazer-nuget.png "$pkgdir/usr/share/icons/hicolor/128x128/apps/osu-lazer.png"
  install -Dm644 assets/lazer.png "$pkgdir/usr/share/icons/hicolor/1024x1024/apps/osu-lazer.png"
  install -Dm644 LICENCE "$pkgdir/usr/share/licenses/osu-lazer-git/LICENCE"
}
