# Maintainer: czyt <czytcn@gmail.com>
pkgname=subnetdesk-bin
pkgver=1.3.0
pkgrel=1
pkgdesc="LAN-only remote desktop based on RustDesk"
arch=('x86_64' 'aarch64')
url="https://github.com/zibo-chen/SubnetDesk"
license=('AGPL-3.0-only')
depends=(
    'gtk3'
    'xdotool'
    'libxcb'
    'libxfixes'
    'libxtst'
    'libxkbcommon'
    'libpulse'
    'alsa-lib'
    'curl'
    'libva'
    'pam'
    'gst-plugins-base'
    'gst-plugin-pipewire'
)
optdepends=('libayatana-appindicator: tray icon')
provides=('subnetdesk')
conflicts=('subnetdesk')
options=('!strip')

_deb_x86_64="subnetdesk-${pkgver}-x86_64.deb"
_deb_aarch64="subnetdesk-${pkgver}-aarch64.deb"
source_x86_64=("${_deb_x86_64}::${url}/releases/download/v${pkgver}/subnetdesk-${pkgver}-x86_64.deb")
source_aarch64=("${_deb_aarch64}::${url}/releases/download/v${pkgver}/subnetdesk-${pkgver}-aarch64.deb")
sha256sums_x86_64=('59686cd464204dfc898473a49c1b80260b61b67dc2e6ce11b20ec60abdc7329a')
sha256sums_aarch64=('93f5a83c4a5f4eb10c59a43a08ce0b3797103084972a0950c17633e6344703b4')

package() {
    local _deb_var="_deb_${CARCH}"
    local _deb="${!_deb_var}"

    bsdtar -xOf "${srcdir}/${_deb}" data.tar.xz |
        bsdtar --no-same-owner -xf - -C "${pkgdir}"

    # The deb links the launcher into /usr/bin in its postinst script
    install -dm755 "${pkgdir}/usr/bin"
    ln -sf /usr/share/subnetdesk/subnetdesk "${pkgdir}/usr/bin/subnetdesk"

    # The deb installs the service in its postinst; ship it unenabled here
    install -Dm644 "${pkgdir}/usr/share/subnetdesk/files/systemd/subnetdesk.service" \
        "${pkgdir}/usr/lib/systemd/system/subnetdesk.service"

    chmod -R u=rwX,go=rX "${pkgdir}"
}
