# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=proton-meet-bin
_name=${pkgname%-bin}
pkgver=1.0.10
pkgrel=1
pkgdesc='Secure, end-to-end encrypted video conferencing'
arch=(any)
url='https://proton.me/meet'
license=(GPL-3.0-or-later)
_electron=electron39
depends=(bash $_electron xdg-utils)
provides=($_name)
conflicts=($_name)
source=($_name-$pkgver.deb::https://proton.me/download/meet/linux/$pkgver/ProtonMeet-desktop.deb
        $_name.sh)
sha512sums=('7de2519bd29a6634d6f74055bee3bbbf4e696b69a803e9f986bd1ca2a5900a545896f5e6bf2d2848d4a44e5917d819c961e2293cc62ae854f35ee2d43ce41f53'
            '558644ebe5a0fb43fead451e93b65f4006108ea76fb5241b591fe06951f9d1be742ef6fbac307d86020d132eeee3a2c182604351144f7c750fe4f275c876ae9b')
b2sums=('48d2562f24deb09428ff637ec404df46f79f74ea122d98f0e6fded49c9c5d0e6268ec2d7f6982a4b32db24b70d3b6bff9bce08de2d772aa9d35fa69df1abb714'
        'cc16def864fd2e9134c194b473db94b0588871af895803fe4151ab7b715f66bbbb695a0964c03577da12b72397230626dabf186885cd206de412c8eac3a47e4a')

prepare() {
    # Extract only the files we need
    tar -xf data.tar.xz \
        "./usr/lib/$_name/resources/" \
        "./usr/lib/$_name/version" \
        "./usr/share/applications/$_name.desktop" \

    # Find out which major release of electron this version of proton-meet requires
    local _electron_major=$(cat "usr/lib/$_name/version" | sed 's/^[~^]\?\([0-9]\+\)\(\.[0-9]\+\)*$/\1/')

    # Check if we depend on the correct electron version
    if [ "$_electron" != "electron$_electron_major" ] ; then
        echo "Error: Incorrect electron version detected. Please change the value of \"_electron\" from \"$_electron\" to \"electron$_electron_major\"."
        return 1
    fi

    # Specify electron version in launcher
    sed -i "s|@ELECTRON@|$_electron|" "$srcdir/proton-meet.sh"
}

package() {
    install -Dm755 $_name.sh "$pkgdir/usr/bin/$_name"

    install -d "$pkgdir/usr/share/$_name"
    cp usr/lib/proton-meet/resources/* "$pkgdir/usr/share/$_name/"

    install -Dm644 usr/share/applications/$_name.desktop -t "$pkgdir/usr/share/applications"
}
