# Maintainer: TurboRigby from Rigby Foundation <levdmytriev@gmail.com>

pkgname=nuggetvpn-bin
_pkgname=nuggetvpn
pkgver=1.0.0_beta.2
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
_srcver=${pkgver%%_*}
source_x86_64=("NuggetVPN_${_srcver}_amd64.deb::https://github.com/Rigby-Foundation/NuggetVPN/releases/download/v${_pkgver}/NuggetVPN_${_srcver}_amd64.deb")
sha256sums_x86_64=('3bd398f5e7f0967ffb9b1bd2bfeab346d1b44973abac2e61cd0f301c8c970197')

package() {
    bsdtar -O -xf "$srcdir/NuggetVPN_${_srcver}_amd64.deb" data.tar* | bsdtar -C "$pkgdir" -x

    if [ -f "$pkgdir/usr/bin/${_pkgname}" ]; then
        chmod 755 "$pkgdir/usr/bin/${_pkgname}"
    fi

    install -dm755 "$pkgdir/usr/share/applications"
    cat <<EOF > "$pkgdir/usr/share/applications/${_pkgname}.desktop"
[Desktop Entry]
Type=Application
Version=1.0.0-beta.2
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
