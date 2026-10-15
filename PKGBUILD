# Maintainer: TurboRigby from Rigby Foundation <levdmytriev@gmail.com>

pkgname=nuggetvpn-bin
_pkgname=nuggetvpn
pkgver=2.3.0
pkgrel=1
pkgdesc="Fast, good-looking VPN client with an embedded sing-box core (binary release)"
arch=('x86_64')
url="https://github.com/Rigby-Foundation/NuggetVPN"
license=('GPL-3.0-only')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
# The interface is Wails v3 on GTK 4 and WebKitGTK 6.0; the tunnel is set up
# by a helper started as root through pkexec, so polkit (and an agent to ask
# for the password, which every desktop has) is needed to connect.
depends=('gtk4' 'webkitgtk-6.0' 'libsoup3' 'glib2' 'libx11' 'glibc' 'polkit')
options=('!strip' '!debug')

source_x86_64=("NuggetVPN-v${pkgver}-linux-amd64.deb::${url}/releases/download/v${pkgver}/NuggetVPN-v${pkgver}-linux-amd64.deb")
sha256sums_x86_64=('cecca5ebb4360f84323241c237afe056f06b52b83a85dd66066cc86bf1937b76')

package() {
    bsdtar -O -xf "${srcdir}/NuggetVPN-v${pkgver}-linux-amd64.deb" 'data.tar*' | bsdtar -C "${pkgdir}" -xf -

    chmod 755 "${pkgdir}/usr/bin/NuggetVPN"
    # The lowercase name earlier versions of this package installed.
    ln -s NuggetVPN "${pkgdir}/usr/bin/${_pkgname}"

    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/NuggetVPN.desktop" <<DESKTOP
[Desktop Entry]
Type=Application
Version=1.5
Name=NuggetVPN
GenericName=VPN Client
Comment=${pkgdesc%% (*}
Exec=NuggetVPN %U
Icon=NuggetVPN
Terminal=false
Categories=Network;Security;
Keywords=vpn;proxy;vless;sing-box;
StartupNotify=true
DESKTOP
}
