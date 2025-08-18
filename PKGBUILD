# Maintainer: tam1m <tbacc plus aur at pm dot me>
pkgname=fladder-bin
_pkgname=Fladder
pkgver=0.7.5
pkgrel=1
pkgdesc="A Simple Jellyfin Frontend"
arch=('x86_64')
url="https://github.com/Fladder-App/Fladder"
license=('GPL-3.0-or-later')
depends=('mpv' 'gtk3')
makedepends=('patchelf')
source=(
    "${pkgname}-${pkgver}.zip::https://github.com/DonutWare/Fladder/releases/download/v${pkgver}/Fladder-Linux-${pkgver}.zip"
    "https://raw.githubusercontent.com/DonutWare/Fladder/refs/heads/main/LICENSE"
    "fladder.desktop"
)
sha256sums=('61f4b629585b5b181fd618578fb244262636356dcdb77c06c684ed829e91f016'
            '3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986'
            '76f8c52297b4f423dd6767a37b56c30ea3398e16f2e0500911ba01df40635ce1')

conflicts=("fladder")
provides=("fladder")

# if set, fladder will autoconnect to the given server
# _base_url="http://192.168.1.100:8096"

package() {
    install -dm755 "$pkgdir/usr/bin/$_pkgname"
    install -dm755 "$pkgdir/usr/share/applications"
    install -dm755 "$pkgdir/usr/share/icons"

    cp -r "$srcdir/lib" "$pkgdir/usr/bin/$_pkgname/"
    cp -r "$srcdir/data" "$pkgdir/usr/bin/$_pkgname/"

    install -m755 -t "$pkgdir/usr/bin/$_pkgname" "$srcdir/Fladder"

    ln -s "/usr/bin/$_pkgname/Fladder" "$pkgdir/usr/bin/fladder"
    ln -s "/usr/bin/$_pkgname/data/flutter_assets/icons/fladder_icon.svg" "$pkgdir/usr/share/icons/fladder.svg"

    install -m644 "$srcdir/fladder.desktop" "$pkgdir/usr/share/applications/"

    # fix rpath
    for lib in "$pkgdir/usr/bin/$_pkgname/lib"/*.so; do
        [[ -f "$lib" && -n "$(patchelf --print-rpath "$lib")" ]] && patchelf --set-rpath '$ORIGIN' "$lib"
    done
    patchelf --set-rpath '$ORIGIN/lib' "$pkgdir/usr/bin/$_pkgname/Fladder"

    # set baseurl
    if [ -n "$_base_url" ]; then
        sed -i "s|\"baseUrl\": null|\"baseUrl\": \"$_base_url\"|" "${pkgdir}/usr/bin/${_pkgname}/data/flutter_assets/config/config.json"
    fi

    install -Dm644 "$srcdir/LICENSE" -t "$pkgdir/usr/share/licenses/$_pkgname"
}
