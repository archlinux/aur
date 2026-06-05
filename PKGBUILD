# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>
# Contributor: Mark Wagie <mark dot wagie at proton dot me>

pkgname=proton-mail-bin
_name=${pkgname%-bin}
pkgver=1.13.2
pkgrel=1
pkgdesc='Proton official desktop application for Proton Mail and Proton Calendar'
arch=(any)
url='https://proton.me/mail'
license=(GPL-3.0-or-later)
_electron=electron40
depends=(bash $_electron hicolor-icon-theme)
provides=($_name)
conflicts=($_name)
source=(ProtonMail-$pkgver.deb::https://proton.me/download/mail/linux/$pkgver/ProtonMail-desktop-beta.deb
        $_name.sh)
sha512sums=('bf3418af6d2c62315ced24948007f6b5a36d900a761f55bb82b84f02559f9a17734c18185291089a3e5721310df9faec92b7e2807eb459de02de0e4e7e1d011d'
            'd8304e653256b917f9ef607e3d0085020c3f8ceaf86f438a411e517622806b8ea5014fb77d96683dfd6be396ebf2cd50443630512debb17b20abdf1447de0616')
b2sums=('fdd4f280e32058b76ea8cc810beff3f9923bf625fffc11653227ced9d18eb3793ef166cb50ba435ec5f8dc808cfd6dd8a8f531f54104724340f90cd96873033d'
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
