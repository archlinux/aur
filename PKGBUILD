# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

pkgname=proton-mail-bin
_name=${pkgname%-bin}
pkgver=1.11.0
pkgrel=1
pkgdesc='Proton official desktop application for Proton Mail and Proton Calendar'
arch=('any')
url='https://proton.me/mail'
license=('GPL-3.0-or-later')
_electron=electron36
depends=('bash' "$_electron" 'hicolor-icon-theme' 'xdg-utils')
provides=("$_name")
conflicts=("$_name")
source=("ProtonMail-$pkgver.deb::https://proton.me/download/mail/linux/$pkgver/ProtonMail-desktop-beta.deb"
        "$_name.sh")
sha512sums=('0f9a8996d1b58ed3e9b2236d610a4a4aae912cec10a39c7e9cd59ee2d0addbba7da931b2691c764f23a44566204c86651e07e3cc1b1730e78dd788dc0cf2c306'
            '3f125e921fda73ebeaf4d9ad8a1c044f955dc74e6fbb43a2895a0cb9a710d934d1707778ca3537bbd81786c8a7e8ef5273fcb36f4ecea816719040ba302b1774')
b2sums=('45a0b1f93e12dccb0b9075a24334f1d36bf83ded4d7ef5b38d94d3690b73a8fd1a401dc548ebd565e6abf0ac9659da1b791f5ddf36bf1f0afac89cfe93bcc952'
        '117439951f7200879663c0566991acd22bd7dd94506f93b731bf7b83475775fb1eb890f11afba001b8087c61c6b969c9238cfad5581a5304e0ae21b06d4f6458')

prepare() {
    tar -xf data.tar.xz

    local _electronver=$(cat "usr/lib/$_name/version")
    if [[ "electron${_electronver%%.*}" != "$_electron" ]]; then
        echo "Electron version mismatch: software requires electron${_electronver%%.*} but package specifies $_electron" >&2
        exit 1
    fi
    sed "s|/usr/bin/electron|/usr/bin/$_electron|" -i $_name.sh
}

package() {
    install -Dm755 $_name.sh "$pkgdir/usr/bin/$_name"
    install -Dm644 usr/lib/proton-mail/resources/app.asar "$pkgdir/usr/share/$_name/app.asar"
    install -Dm644 usr/share/applications/$_name.desktop \
        "$pkgdir/usr/share/applications/$_name.desktop"
    install -Dm644 usr/share/pixmaps/$_name.png \
        "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_name.svg"
}
