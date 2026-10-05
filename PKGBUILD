# Maintainer: czyt <czytcn@gmail.com>
pkgname=memoh-bin
pkgver=2026.10.5.1
pkgrel=1
pkgdesc="Give your agent a cloud computer - cloud-first multi-agent platform where every agent has its own desktop, files and network, running 24/7"
arch=('x86_64')
url="https://memoh.ai"
license=('custom')
depends=('alsa-lib' 'avahi' 'dbus' 'gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs' 'libsecret')
optdepends=('libappindicator: system tray support')
makedepends=('libarchive')
_debver="2026.10.5-1"
source=("Memoh-${_debver}-linux-amd64.deb::https://desktopresource.memoh.ai/Memoh-${_debver}-linux-amd64.deb")
sha256sums=('a89af3ee0b03afc2fd638f7934efa347f5511bda664735a9c26091fb210a4a2a')

package() {
    # Dynamically select the data archive member in case the deb compression changes
    local _data_member
    _data_member=$(ar t "${srcdir}/Memoh-${_debver}-linux-amd64.deb" | awk '/^data\.tar\.(gz|xz|zst|bz2|lzma)$/ { print; exit }')
    [[ -n "${_data_member}" ]] || { echo "deb has no supported data archive" >&2; return 1; }

    ar p "${srcdir}/Memoh-${_debver}-linux-amd64.deb" "${_data_member}" |
        bsdtar --no-same-owner -xf - -C "${pkgdir}"

    # Fix permissions
    chmod -R u=rwX,go=rX "${pkgdir}"
}
