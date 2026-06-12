# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

pkgname=proton-mail-bin
_name=${pkgname%-bin}
pkgver=1.13.3
pkgrel=1
pkgdesc='Proton official desktop application for Proton Mail and Proton Calendar'
arch=(any)
url='https://proton.me/mail'
license=(GPL-3.0-or-later)
_electron=electron40
depends=(bash $_electron hicolor-icon-theme)
provides=($_name)
conflicts=($_name)
source=($_name-$pkgver.deb::https://proton.me/download/mail/linux/$pkgver/ProtonMail-desktop-beta.deb
        $_name.sh)
sha512sums=('8700c4f3f765cc6e473fc2e25d65f36248ecc19510c6443fc9184372f6ca1a32d7d5764f3cddd6cd97a4355b22909ece084e568d67739273d181671250c46ce3'
            'd8304e653256b917f9ef607e3d0085020c3f8ceaf86f438a411e517622806b8ea5014fb77d96683dfd6be396ebf2cd50443630512debb17b20abdf1447de0616')
b2sums=('21e64a95175db4fa658eef58bdf8121fa00f7d697cd25eb5a87009cf380587f1eb93cf877b82c6613b5dad84aaaca87ba6d23c58b9d6522729f96b14391e4008'
        '45d089576f2260cc425b6c9bdde79e882b24c7dd4b8173f485fb67a0d0ccaf451dbba6f403f3bd8a0d622d99132d076da79984525ed8f89e97738557e8e23bad')

prepare() {
    # Extract only the files we need
    tar -xf data.tar.xz \
        "./usr/lib/$_name/resources/" \
        "./usr/lib/$_name/version" \
        "./usr/share/applications/$_name.desktop" \
        "./usr/share/pixmaps/$_name.png"

    # Find out which major release of electron this version of proton-mail requires
    local _electron_major=$(cat "usr/lib/$_name/version" | sed 's/^[~^]\?\([0-9]\+\)\(\.[0-9]\+\)*$/\1/')

    # Check if we depend on the correct electron version
    if [ "$_electron" != "electron$_electron_major" ] ; then
        echo "Error: Incorrect electron version detected. Please change the value of \"_electron\" from \"$_electron\" to \"electron$_electron_major\"."
        return 1
    fi

    # Specify electron version in launcher
    sed -i "s|@ELECTRON@|$_electron|" "$srcdir/proton-mail.sh"
}

package() {
    install -Dm755 $_name.sh "$pkgdir/usr/bin/$_name"

    install -d "$pkgdir/usr/share/$_name"
    cp usr/lib/proton-mail/resources/* "$pkgdir/usr/share/$_name/"

    install -Dm644 usr/share/applications/$_name.desktop -t "$pkgdir/usr/share/applications"
    install -Dm644 usr/share/pixmaps/$_name.png "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_name.svg"
}
