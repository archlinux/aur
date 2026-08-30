# Maintainer: tam1m <tbacc plus aur at pm dot me>
pkgname=fladder-bin
pkgver=0.11.0
pkgrel=2
pkgdesc="A cross-platform Jellyfin Frontend built on top of Flutter"
arch=('x86_64')
url="https://github.com/DonutWare/Fladder"
license=('GPL-3.0-or-later')
depends=('mpv' 'gtk3' 'xdg-user-dirs')
makedepends=('patchelf')
source=(
    "${pkgname}-${pkgver}.zip::https://github.com/DonutWare/Fladder/releases/download/v${pkgver}/Fladder-Linux-${pkgver}.zip"
    "https://raw.githubusercontent.com/DonutWare/Fladder/refs/heads/main/LICENSE"
    "fladder.desktop"
)
sha256sums=('a4abeac8d86a14e029276736c8e427e0924fb4968401c172729c7c4e138ec4bd'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            'a5b94f011895864fa2c3fa641ad578595d519ec51c867d76eb32da67877a5ccb')

conflicts=("fladder")
provides=("fladder")

# if set, fladder will autoconnect to the given server
# _base_url="http://192.168.1.100:8096"

package() {
    install -dm755 "$pkgdir/usr/lib/$pkgname"
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/icons"

    cp -r "$srcdir/lib" "$pkgdir/usr/lib/$pkgname/"
    cp -r "$srcdir/data" "$pkgdir/usr/lib/$pkgname/"

    install -m755 -t "$pkgdir/usr/lib/$pkgname" "$srcdir/fladder"

    ln -s "/usr/lib/$pkgname/fladder" "$pkgdir/usr/bin/fladder"
    ln -s "/usr/lib/$pkgname/data/flutter_assets/icons/fladder_icon.svg" "$pkgdir/usr/share/icons/fladder.svg"

    install -m644 "$srcdir/fladder.desktop" "$pkgdir/usr/share/applications/"

    # fix rpath
    for lib in "$pkgdir/usr/lib/$pkgname/lib"/*.so; do
        [[ -f "$lib" && -n "$(patchelf --print-rpath "$lib")" ]] && patchelf --set-rpath '$ORIGIN' "$lib"
    done
    patchelf --set-rpath '$ORIGIN/lib' "$pkgdir/usr/lib/$pkgname/fladder"

    # set baseurl
    if [ -n "$_base_url" ]; then
        sed -i "s|\"baseUrl\": null|\"baseUrl\": \"$_base_url\"|" "${pkgdir}/usr/lib/${pkgname}/data/flutter_assets/config/config.json"
    fi

    install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname"
}
