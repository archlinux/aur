# ~/Documents/git/forticlient-vpn/PKGBUILD 19 May 2026 at 09:02:02 AM
# Maintainer: Inknyto <mbaye.sene.etu@esmt.sn>
# Contributor: Meowser <edward.o.holmes@gmail.com>
# Contributor: Douglas Iuri Medeiros Cabral <douglasimcabral@zohomail.com>
pkgname=forticlient-vpn
pkgver=7.4.3.5411
pkgrel=1
pkgdesc="FortiClient VPN only build from the official Fortinet package"
arch=("x86_64")
url="https://www.fortinet.com/support/product-downloads"
license=('LicenseRef-fortinet')
depends=(
    'alsa-lib'
    'at-spi2-core'
    'bash'
    'cairo'
    'dbus'
    'expat'
    'glib2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libcups'
    'libdrm'
    'libgcc'
    'libnotify'
    'libsecret'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxkbcommon'
    'libxrandr'
    'mesa'
    'nspr'
    'nss'
    'pango'
    'procps-ng'
    'systemd-libs'
    'util-linux-libs'
    'zlib'
)
optdepends=(
    'gtk2: legacy GTK2 tray icon support (AUR)'
    'libappindicator-gtk2: GTK2 tray icon support (AUR)'
    'gnome-keyring: keyring integration'
    'gzip: compression support'
    'iptables: firewall rules support'
    'libappindicator-gtk3: system tray icon support (GTK3)'
    'libxss: screen saver integration'
    'net-tools: legacy network tools'
    'openssl: TLS support'
    'polkit: privilege escalation prompts'
    'systemd: service management'
    'mate-polkit: polkit authentication for MATE'
    'polkit-gnome: polkit authentication for GNOME'
    'polkit-kde-agent: polkit authentication for KDE'
    'deepin-polkit-agent: polkit authentication for Deepin'
    'pantheon-polkit-agent: polkit authentication for Pantheon'
    'lxqt-policykit: polkit authentication for LXQt'
)
provides=('fortivpn' 'FortiClient')
conflicts=('forticlient')
options=('!strip' '!debug')
install='forticlient-vpn.install'
source=("forticlient_vpn_${pkgver}_amd64.deb::https://filestore.fortinet.com/forticlient/downloads/forticlient_vpn_${pkgver}_amd64.deb")
sha256sums=('d2c0366decbf0b907fbf0d9306b8ac0b705d2d9cb4eb7b946ae06ce5388d4e5a')
b2sums=('53c85785ae47d036a455a3bc4e19246f10bf98aa446229127e10d12a929011ad9c3ba6af745fe9ec11044bce685c9f582e6f98bf755ab656c6431074dc898a9d')

prepare() {
    cd "$srcdir"
    bsdtar -xf "forticlient_vpn_${pkgver}_amd64.deb"
}

package() {
    cd "$srcdir"

    # Extract the .deb data archive directly into $pkgdir
    if [ -f data.tar.zst ]; then
        bsdtar -xf data.tar.zst -C "$pkgdir/"
    else
        bsdtar -xf data.tar.xz -C "$pkgdir/"
    fi

    # Move systemd service from non-standard /lib to /usr/lib
    install -Dm644 "${pkgdir}/lib/systemd/system/forticlient.service" \
        "${pkgdir}/usr/lib/systemd/system/forticlient.service"
    rm -rf "${pkgdir}/lib"

    # Runtime directories — intentionally empty at install time
    mkdir -p "${pkgdir}/var/lib/forticlient"

    # Install license
    install -Dm644 "${pkgdir}/usr/share/doc/forticlient/copyright" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Symbolic link to fortivpn CLI
    mkdir -p "${pkgdir}/usr/bin"
    ln -sf '/opt/forticlient/fortivpn' "${pkgdir}/usr/bin/fortivpn"
}
