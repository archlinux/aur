# Maintainer: TurboRigby from Rigby Foundation <levdmytriev@gmail.com>

pkgname=nuggetvpn-bin
_pkgname=nuggetvpn
pkgver=1.0.0_beta.1
pkgrel=1
pkgdesc="Modern, lightweight, and fast VPN client built with Tauri v2 and React 19 (Binary release)"
arch=('x86_64')
url="https://github.com/Rigby-Foundation/nuggetvpn"
license=('GPL3')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
depends=('webkit2gtk-4.1' 'gtk3' 'libappindicator-gtk3' 'openssl' 'glibc')
options=('!strip')

_pkgver=${pkgver/_/-}
source_x86_64=("NuggetVPN_${_pkgver}_amd64.deb::https://github.com/Rigby-Foundation/nuggetvpn/releases/download/v${_pkgver}/NuggetVPN_${_pkgver}_amd64.deb")
sha256sums_x86_64=('b711717d9e6a4db107df08f06019a2d19462c745e29083ab8bdd40080c1ee27d')

package() {
    bsdtar -O -xf "$srcdir/NuggetVPN_${_pkgver}_amd64.deb" data.tar* | bsdtar -C "$pkgdir" -x

    if [ -f "$pkgdir/usr/bin/${_pkgname}" ]; then
        chmod 755 "$pkgdir/usr/bin/${_pkgname}"
    fi

    install -dm755 "$pkgdir/usr/share/applications"
    cat <<EOF > "$pkgdir/usr/share/applications/${_pkgname}.desktop"
[Desktop Entry]
Type=Application
Version=1.0.0-beta.1
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
