# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

pkgname=proton-mail-bin
_name=${pkgname%-bin}
pkgver=1.10.1
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
sha512sums=('405ad9659153fdd5c426b4601a1f20138e5f4eacdf58524a2cefc0612d89fefd37265457bdef6b7da7bb223d7c17124e100703857c985b792d2528a7916f18a1'
            '3f125e921fda73ebeaf4d9ad8a1c044f955dc74e6fbb43a2895a0cb9a710d934d1707778ca3537bbd81786c8a7e8ef5273fcb36f4ecea816719040ba302b1774')
b2sums=('6d3534e9743b444181bde5c2c9aa4037a6b2bca120df6f5b1457394ac542e18f379230412bc364c02e18d7d7d4ca6e9a0d572f13f5c089e8029f96c95e402048'
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
