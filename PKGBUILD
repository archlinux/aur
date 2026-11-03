# Maintainer: RiverOnVenus <aur@zhui.dev>

pkgname=honk-core-bin
pkgver=0.1.0beta.5
pkgrel=1
pkgdesc='Experimental eBPF transparent proxy engine (prebuilt release binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/daeuniverse/honk'
license=('GPL-3.0-only')
depends=('glibc' 'gcc-libs' 'v2ray-geoip' 'v2ray-domain-list-community')
optdepends=('bpftool: inspect loaded eBPF programs and pinned maps'
            'nftables: remove the leftover NFQUEUE table after a crash')
provides=('honk-core')
conflicts=('honk-core')
backup=('etc/honk/config.dae')
install="${pkgname}.install"
# Upstream strips the binary before release, so a debug package would be empty.
options=('!debug')

_upver='0.1.0-beta.5'
# Literal names keep .SRCINFO correct when generated on either architecture.
_dir="honk-core-v${_upver}-${CARCH}-unknown-linux-gnu-full"
_dir_x86_64="honk-core-v${_upver}-x86_64-unknown-linux-gnu-full"
_dir_aarch64="honk-core-v${_upver}-aarch64-unknown-linux-gnu-full"

source=('honk-core.service'
        'honk-core-restart.hook'
        'config.dae'
        'honk-modules.conf'
        "honk-config-example.dae::https://raw.githubusercontent.com/daeuniverse/honk/v${_upver}/example.dae")
source_x86_64=("${_dir_x86_64}.tar.gz::${url}/releases/download/v${_upver}/${_dir_x86_64}.tar.gz")
source_aarch64=("${_dir_aarch64}.tar.gz::${url}/releases/download/v${_upver}/${_dir_aarch64}.tar.gz")
sha256sums=('3b72033008f377f8aad72833943458d0becdda1218ed900b5d369c824e20824d'
            '3e396b1d043503717d661fb143b5537d9d5d4ae8ddb80dd3b7c37fde74ad89ea'
            '8e6791e762e9398a0ee8f910a637cc6d11e64e1729b20ce027ff77b9932c7830'
            'cba5c54fdc2ad776e8df3ac6094af3b6010554508925172b6e240a645630be13'
            '50d1ddbcc901d4e477f5e67ea2092ba364667dea24588929fbf9b2583035679b')
sha256sums_x86_64=('7835b16cae08559059279ed3f0098b74606b65a06b8e831c7d5bedaa69967384')
sha256sums_aarch64=('442741c0f45901714c05bd62f8b6242825cc685d9fb338bae02d107698b80656')

prepare() {
  local example="${srcdir}/honk-config-example.dae"
  if ! grep -q '^    lan_interface:' "${example}" || ! grep -q '/var/share/honk' "${example}"; then
    echo "error: upstream example.dae no longer has the lan_interface/data_dir lines" >&2
    return 1
  fi

  {
    echo '# Packaged example adapted from upstream example.dae.'
    echo '# Review interfaces, nodes and API secrets before using it.'
    echo
    # Move state under the unit's StateDirectory and leave the LAN interface to the reader.
    sed -e 's|/var/share/honk|/var/lib/honk|' \
        -e 's|^    lan_interface: .*$|    # lan_interface: eth0  # set to your LAN bridge to proxy LAN clients|' \
        "${example}"
  } > "${srcdir}/config.dae.example"
}

package() {
  cd "${_dir}"

  install -Dm755 honk-core "${pkgdir}/usr/bin/honk-core"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Full builds embed both doona editions; carry the notices of each.
  for _doona in doona doona-lite; do
    install -d "${pkgdir}/usr/share/licenses/${pkgname}/${_doona}"
    cp -a "${_doona}/." "${pkgdir}/usr/share/licenses/${pkgname}/${_doona}/"
  done

  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"

  install -Dm644 "${srcdir}/honk-core.service" \
    "${pkgdir}/usr/lib/systemd/system/honk-core.service"
  install -Dm644 "${srcdir}/honk-core-restart.hook" \
    "${pkgdir}/usr/share/libalpm/hooks/90-honk-core-restart.hook"
  install -Dm640 "${srcdir}/config.dae" "${pkgdir}/etc/honk/config.dae"
  install -Dm644 "${srcdir}/config.dae.example" "${pkgdir}/etc/honk/config.dae.example"

  install -Dm644 "${srcdir}/honk-modules.conf" \
    "${pkgdir}/usr/lib/modules-load.d/honk.conf"

  install -d "${pkgdir}/usr/share/honk"
  ln -s /usr/share/v2ray/geoip.dat "${pkgdir}/usr/share/honk/geoip.dat"
  ln -s /usr/share/v2ray/geosite.dat "${pkgdir}/usr/share/honk/geosite.dat"
}
