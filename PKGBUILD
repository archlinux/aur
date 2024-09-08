# Maintainer: Ujhhgtg <feyxiexzf@gmail.com>

pkgname=phira-bin
pkgver=0.6.4
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
conflicts=(
    "${pkgname%-bin}"
    "${pkgname%-bin}-git"
)
provides=(
    "${pkgname%-bin}"
)

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
b2sums=(
    '80d1791a472da272a4d9fe1b61f0b947043b9e10046368902fb7867d96efdbaa8154b43d2aefa10f3e3fabe44e78b9a90e73b92d29aec914cf172bf6237a6de2'
    '4fb82fe12455f20e556ee34d225978aaef738c77d1eb6f10c022a1f86a74dc0db6cb43aaa55753a41b92d62fd949de58667fac561e8a725f70e810d01abe1693'
    '6be953d4402faf3dda9bd2cfb8bff31b1cb1bfce81bad2f3f0d1af034f3b0a33e0a88026f5cb030ae737b90e3fc3c72da3938d153e3e930beefaf2910b356224'
)

package() {
    # game
    install -Dm755 "${pkgname%-bin}-main" "$pkgdir/usr/share/${pkgname%-bin}/${pkgname%-bin}-main" # game executable
    install -Dm755 "run.sh" "$pkgdir/usr/bin/phira" # game launcher
    cp -r "assets" "$pkgdir/usr/share/${pkgname%-bin}/" # game assets

    # license
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/${pkgname%-bin}/LICENSE"

    # desktop entry
    install -Dm644 "${pkgname%-bin}.desktop" "$pkgdir/usr/share/applications/${pkgname%-bin}.desktop"

    # icon
    mkdir -p "$pkgdir/usr/share/icons/hicolor/128x128/apps/"
    install -Dm644 "assets/icon.png" "$pkgdir/usr/share/icons/hicolor/128x128/apps/${pkgname%-bin}.png"
}
