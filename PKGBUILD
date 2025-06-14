# Maintainer: Ujhhgtg <feyxiexzf@gmail.com>

pkgname=phira-bin
pkgver=0.6.7
pkgrel=1
pkgdesc="A clone of the music game Phigros that supports custom beatmaps, multiplayer etc."
arch=('x86_64')
url="https://github.com/TeamFlos/phira"
license=('GPL3')
depends=(
    'gcc-libs'
    'bubblewrap'
    'snapd-xdg-open-git'
    'alsa-lib'
    'at-spi2-core'
    'bzip2'
    'cairo'
    'gdk-pixbuf2'
    'glib2'
    'gtk3'
    'harfbuzz'
    'pango'
    'wayland'
    'zlib'
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
    'git'
)
source=(
    "${pkgname%-bin}-v$pkgver.zip::https://github.com/TeamFlos/${pkgname%-bin}/releases/download/v$pkgver/Phira-linux-v$pkgver.zip"
    "run.sh"
    "${pkgname%-bin}.desktop"
)
b2sums=('6f63ce9db30c65633060f9d662608e1f7f3477dfe18591c47bddab92b63d2c054daf76ecc8e3ef65a52dec98c461d2d5f7a00a8b4b96a6c6443f07050a8ae145'
        '3e67b76dbaadbce4f696c015b7e490400b15e31173d4ed6f7cfa20875d689a8f369b95aace251af216b1ad2dbbd4f2d41c8fb42f47519e666794b8d424f07a22'
        '2c9717c45faa9f00d54df018c3b83ecc1c35e6a515457e36533969ff45162ee35bfc33cca2b10b48cd36ea088148eceaaae4c73cee72b5867cd57c900b32afd2')

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
