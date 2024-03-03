# Maintainer: Ujhhgtg <feyxiexzf@gmail.com>

pkgname=phira-bin
pkgver=0.6.2
pkgrel=1
pkgdesc="A clone of the music game Phigros that supports custom beatmaps, multiplayer etc."
arch=('x86_64')
url="https://github.com/TeamFlos/phira"
license=('GPL3')
depends=(
    'gcc-libs'
    'bubblewrap'
    'snapd-xdg-open-git'
)
provides=("phira")

# The reason this package depends on bubblewrap:
# Since Phira currently reads & writes its config from the dir containing itself,
# which means the permission would be a problem,
# so I used a dirty hack™: use bwrap to redirect the config dirs to user dirs.

makedepends=(
    'cargo'
    'git'
)
source=(
    "${pkgname%-bin}-v$pkgver.zip::https://github.com/TeamFlos/${pkgname%-bin}/releases/download/v$pkgver/Phira-linux-v$pkgver.zip"
    "run.sh"
    "${pkgname%-bin}.desktop"
)
b2sums=('d7c67dfb9dfb2827809049b7775d31a84ad27b63759acbb93a18aed9d251292c41a16dc96a03d7e2240e04c9534707a0f4fe9b84b6cac609dd95067177ad978b'
        '6082233569818cb02d92893f0afcdfe6d43ba77adc061b3abb52132b2260d5fd51adf8b91a147e8e83d61573c1ac87fdcadd3a75aaf1193ee102b3b17d6f9466'
        '6be953d4402faf3dda9bd2cfb8bff31b1cb1bfce81bad2f3f0d1af034f3b0a33e0a88026f5cb030ae737b90e3fc3c72da3938d153e3e930beefaf2910b356224')

package() {
    # game
    install -Dm755 "${pkgname%-bin}-main" "$pkgdir/usr/share/${pkgname%-bin}/${pkgname%-bin}-main" # game executable
    install -Dm755 "run.sh" "$pkgdir/usr/bin/phira" # game launcher
    cp -r "assets" "$pkgdir/usr/share/${pkgname%-bin}/" # game assets
    #rm -r "$pkgdir/usr/share/${pkgname%-bin}/cache/" "$pkgdir/usr/share/${pkgname%-bin}/data/" # unneeded dirs

    # license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"

    # desktop entry
    install -Dm644 "${pkgname%-bin}.desktop" "$pkgdir/usr/share/applications/${pkgname%-bin}.desktop"

    # icon
    mkdir -p "$pkgdir/usr/share/icons/hicolor/128x128/apps/"
    install -Dm644 "assets/icon.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/${pkgname%-bin}.png"
}
