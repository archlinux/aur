# Maintainer: AlphaLynx <alphalynx at alphalynx dot dev>

pkgname=proton-meet-bin
_name=${pkgname%-bin}
pkgver=1.0.8
pkgrel=1
pkgdesc='Secure, end-to-end encrypted video conferencing'
arch=(any)
url='https://proton.me/meet'
license=(GPL-3.0-or-later)
_electron=electron39
depends=(bash $_electron hicolor-icon-theme xdg-utils)
provides=($_name)
conflicts=($_name)
source=($_name-$pkgver.deb::https://proton.me/download/meet/linux/$pkgver/ProtonMeet-desktop.deb
        $_name.sh)
sha512sums=('f5131eda75e2f41a1f6022ad01f548c1a405c1cf83f17722b233729cecdafa8a0edaedcdf56f2ed2c326a0d3c4332bd05d5fc968e263fb302d83e703201fb11b'
            '558644ebe5a0fb43fead451e93b65f4006108ea76fb5241b591fe06951f9d1be742ef6fbac307d86020d132eeee3a2c182604351144f7c750fe4f275c876ae9b')
b2sums=('91d74ef9f37cf12435667545ac45cd0af7f2ccb3b54660d4c404eac9f00ded2699cd0f31a958664ed05e2dea6e19ae8213c507fbfd7a6f92d7f2a84469c7f5b0'
        'cc16def864fd2e9134c194b473db94b0588871af895803fe4151ab7b715f66bbbb695a0964c03577da12b72397230626dabf186885cd206de412c8eac3a47e4a')

prepare() {
    # Extract only the files we need
    tar -xf data.tar.xz \
        "./usr/lib/$_name/resources/" \
        "./usr/lib/$_name/version" \
        "./usr/share/applications/$_name.desktop" \
        "./usr/share/pixmaps/$_name.png"

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
    install -Dm644 usr/share/pixmaps/$_name.png "$pkgdir/usr/share/icons/hicolor/scalable/apps/$_name.svg"
}
