# Maintainer: RiverOnVenus <aur@zhui.dev>

pkgname=honk-core-bin
pkgver=0.1.0beta.4
pkgrel=1
pkgdesc='Experimental eBPF transparent proxy engine (prebuilt release binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/daeuniverse/honk'
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'v2ray-geoip' 'v2ray-domain-list-community')
optdepends=('bpftool: inspect loaded eBPF programs and pinned maps')
provides=('honk-core')
conflicts=('honk-core')
backup=('etc/honk/config.dae')
install="${pkgname}.install"
options=('!strip' '!debug')

_upver='0.1.0-beta.4'
# Literal names keep .SRCINFO correct when generated on either architecture.
_dir="honk-core-v${_upver}-${CARCH}-unknown-linux-gnu-full"
_dir_x86_64="honk-core-v${_upver}-x86_64-unknown-linux-gnu-full"
_dir_aarch64="honk-core-v${_upver}-aarch64-unknown-linux-gnu-full"

source=('honk-core.service'
        'config.dae'
        'honk-modules.conf'
        "honk-config-example.dae::https://raw.githubusercontent.com/daeuniverse/honk/v${_upver}/example.dae")
source_x86_64=("${_dir_x86_64}.tar.gz::${url}/releases/download/v${_upver}/${_dir_x86_64}.tar.gz")
source_aarch64=("${_dir_aarch64}.tar.gz::${url}/releases/download/v${_upver}/${_dir_aarch64}.tar.gz")
sha256sums=('3b72033008f377f8aad72833943458d0becdda1218ed900b5d369c824e20824d'
            '8e6791e762e9398a0ee8f910a637cc6d11e64e1729b20ce027ff77b9932c7830'
            'cba5c54fdc2ad776e8df3ac6094af3b6010554508925172b6e240a645630be13'
            '50d1ddbcc901d4e477f5e67ea2092ba364667dea24588929fbf9b2583035679b')
sha256sums_x86_64=('45e4b7975d971bf6913a5a4ad9a2b56938dd427930b234fec512575263ab84bd')
sha256sums_aarch64=('6320ee289e4f2251b11e80b73b3f60e44c55c951fc01b9420ac7b9971b1504ee')

prepare() {
  {
    echo '# Packaged example adapted from upstream example.dae.'
    echo '# Review interfaces, nodes and API secrets before using it.'
    echo
    sed -e 's|/var/share/honk|/var/lib/honk|' \
        -e 's|^    lan_interface: eth0$|    # lan_interface: eth0  # set to your LAN bridge to proxy LAN clients|' \
        "${srcdir}/honk-config-example.dae"
  } > "${srcdir}/config.dae.example"
}

package() {
  cd "${_dir}"

  install -Dm755 honk-core "${pkgdir}/usr/bin/honk-core"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -d "${pkgdir}/usr/share/licenses/${pkgname}/doona"
  cp -a doona/. "${pkgdir}/usr/share/licenses/${pkgname}/doona/"

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "${srcdir}/honk-core.service" \
    "${pkgdir}/usr/lib/systemd/system/honk-core.service"
  install -Dm640 "${srcdir}/config.dae" "${pkgdir}/etc/honk/config.dae"
  install -Dm644 "${srcdir}/config.dae.example" "${pkgdir}/etc/honk/config.dae.example"

  install -Dm644 "${srcdir}/honk-modules.conf" \
    "${pkgdir}/usr/lib/modules-load.d/honk.conf"

  install -d "${pkgdir}/usr/share/honk"
  ln -s /usr/share/v2ray/geoip.dat "${pkgdir}/usr/share/honk/geoip.dat"
  ln -s /usr/share/v2ray/geosite.dat "${pkgdir}/usr/share/honk/geosite.dat"
}
