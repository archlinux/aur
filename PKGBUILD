# Maintainer: sahdu <sahduausds@foxmail.com>
# Maintainer: sicalxy <sicalxy at outlook dot com>

pkgname=clash-party-bin
_pkgname=clash-party
_realname=mihomo-party
pkgver=1.9.3
pkgrel=1
pkgdesc="A Clash client with party features (Rebranded as Mihomo Party)"
arch=('x86_64' 'aarch64')
url="https://github.com/mihomo-party-org/clash-party"
license=('GPL-3.0-or-later')
depends=('gtk3' 'nss' 'libxss' 'libappindicator-gtk3' 'libnotify' 'libcups' 'libsecret' 'libxtst' 'alsa-lib')
provides=("${_pkgname}" "${_realname}" "mihomo-party-bin")
conflicts=("${_pkgname}" "${_realname}" "mihomo-party-bin")
options=('!strip')

source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-${pkgver}-amd64.deb")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}-linux-${pkgver}-arm64.deb")

sha256sums_x86_64=('0031728acd7f040ee4b0cd2e391ba904132e068b3d7cb7a36eb16cffc9fde3ad')
sha256sums_aarch64=('a4089194baff0c5a0edb93d9315fbcc864e1968521f70594c1a86101154bab92')

package() {
    bsdtar -xf data.tar.* -C "$pkgdir/"

    local _src_dir=""
    if [ -d "$pkgdir/opt/mihomo-party" ]; then
        _src_dir="$pkgdir/opt/mihomo-party"
    elif [ -d "$pkgdir/opt/clash-party" ]; then
        mv "$pkgdir/opt/clash-party" "$pkgdir/opt/mihomo-party"
        _src_dir="$pkgdir/opt/mihomo-party"
    else
        echo "Error: Could not find installed directory in /opt"
        exit 1
    fi

    find "${_src_dir}/resources/sidecar/" -name "sysproxy*node" -exec chmod +x {} \;

    install -d -m755 "$pkgdir/usr/bin"
    ln -s "/opt/mihomo-party/mihomo-party" "$pkgdir/usr/bin/mihomo-party"
    ln -s "/opt/mihomo-party/mihomo-party" "$pkgdir/usr/bin/clash-party"

    if [ -f "$pkgdir/usr/share/applications/clash-party.desktop" ]; then
        mv "$pkgdir/usr/share/applications/clash-party.desktop" "$pkgdir/usr/share/applications/mihomo-party.desktop"
    fi
    
    sed -i 's|/opt/clash-party|/opt/mihomo-party|g' "$pkgdir/usr/share/applications/mihomo-party.desktop"
    sed -i 's|Exec=clash-party|Exec=mihomo-party|g' "$pkgdir/usr/share/applications/mihomo-party.desktop"
    sed -i 's|Name=Clash Party|Name=Mihomo Party|g' "$pkgdir/usr/share/applications/mihomo-party.desktop"
}
