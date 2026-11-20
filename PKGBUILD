# Maintainer: czyt <czytcn@gmail.com>
pkgname=subnetdesk-bin
pkgver=2.0.0
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
sha256sums_x86_64=('dc24d629c26a05b93f47d40c12943f295b2a680ab2db7add1ab956177667e88e')
sha256sums_aarch64=('15c494a5dc82be02e404c75aa7aeff8015bfe444c8d9dcd6f1608220c1c8319a')

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
