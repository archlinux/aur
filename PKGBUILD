# Maintainer: RiverOnVenus <aur@zhui.dev>

pkgname=honk-core-bin
pkgver=0.1.0beta.5
pkgrel=2
pkgdesc='Experimental eBPF transparent proxy engine (prebuilt release binary)'
# CI builds x86_64 only; the aarch64 package is not build-tested here.
arch=('x86_64' 'aarch64')
url='https://github.com/daeuniverse/honk'
# The embedded doona UI bundles Apache-2.0, OFL-1.1 and MIT components.
license=('GPL-3.0-only AND Apache-2.0 AND OFL-1.1 AND MIT')
# The v2ray data seeds /usr/share/honk; see the geodata note in config.dae.
depends=('glibc' 'v2ray-geoip' 'v2ray-domain-list-community')
depends_x86_64=('libgcc' 'libstdc++')
optdepends=('bpftool: inspect loaded eBPF programs and pinned maps'
            'nftables: remove the leftover NFQUEUE table after a crash')
provides=("honk-core=${pkgver}")
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
        "honk-config-example.dae::https://raw.githubusercontent.com/daeuniverse/honk/v${_upver}/example.dae")
source_x86_64=("${_dir_x86_64}.tar.gz::${url}/releases/download/v${_upver}/${_dir_x86_64}.tar.gz")
source_aarch64=("${_dir_aarch64}.tar.gz::${url}/releases/download/v${_upver}/${_dir_aarch64}.tar.gz")
sha256sums=('76809ebb5e8f3367bb0452e1550d5909c7aa086b8181f3eb926ee8efd8e3b201'
            '3e396b1d043503717d661fb143b5537d9d5d4ae8ddb80dd3b7c37fde74ad89ea'
            '9555fc7d3ccb02c287fcc35cfb728d3fd563fb5bda68ef1d02272cc8d17cdfc5'
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
    echo '# geosite:gfw is missing from the packaged v2ray data, so its rule never'
    echo '# matches until /var/lib/honk/geosite.dat provides that category.'
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
  install -Dm644 "${srcdir}/config.dae.example" \
    "${pkgdir}/usr/share/doc/${pkgname}/config.dae.example"

  install -d "${pkgdir}/usr/share/honk"
  ln -s /usr/share/v2ray/geoip.dat "${pkgdir}/usr/share/honk/geoip.dat"
  ln -s /usr/share/v2ray/geosite.dat "${pkgdir}/usr/share/honk/geosite.dat"
}
