# Maintainer: TurboRigby from Rigby Foundation <levdmytriev@gmail.com>

pkgname=nuggetvpn-bin
_pkgname=nuggetvpn
pkgver=0.2.2
pkgrel=2
pkgdesc="Modern, lightweight, and fast VPN client built with Tauri v2 and Svelte 5 (Binary release)"
arch=('x86_64')
url="https://github.com/Rigby-Foundation/nuggetvpn"
license=('GPL3')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3' 'openssl' 'glibc')
options=('!strip')

source_x86_64=("NuggetVPN_${pkgver}_amd64.deb::https://github.com/Rigby-Foundation/nuggetvpn/releases/download/v${pkgver}/NuggetVPN_${pkgver}_amd64.deb")
sha256sums_x86_64=('937a8ca9427a07e9ef2513734180188c5c06241f4091f0264b7fdbe797656211')

package() {
    bsdtar -O -xf "$srcdir/NuggetVPN_${pkgver}_amd64.deb" data.tar* | bsdtar -C "$pkgdir" -x

    if [ -f "$pkgdir/usr/bin/${_pkgname}" ]; then
        chmod 755 "$pkgdir/usr/bin/${_pkgname}"
    fi

    install -dm755 "$pkgdir/usr/share/applications"
    cat <<EOF > "$pkgdir/usr/share/applications/${_pkgname}.desktop"
[Desktop Entry]
Type=Application
Version=1.0
Name=NuggetVPN
Comment=${pkgdesc}
Exec=env WEBKIT_DISABLE_COMPOSITING_MODE=1 /usr/bin/${_pkgname} %U
Icon=${_pkgname}
Terminal=false
Categories=Network;VPN;GTK;
StartupNotify=true
EOF
    chmod 644 "$pkgdir/usr/share/applications/${_pkgname}.desktop"
}
