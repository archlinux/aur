# Maintainer: RiverOnVenus <aur@zhui.dev>

pkgname=honk-core-bin
pkgver=0.1.0beta.6
pkgrel=1
pkgdesc='Experimental eBPF transparent proxy engine (prebuilt release binary)'
# CI builds x86_64 only; the aarch64 package is not build-tested here.
arch=('x86_64' 'aarch64')
url='https://github.com/daeuniverse/honk'
# The embedded doona UI bundles Apache-2.0, OFL-1.1 and MIT components.
license=('GPL-3.0-only AND Apache-2.0 AND OFL-1.1 AND MIT')
depends=('glibc' 'v2ray-geoip' 'v2ray-domain-list-community')
depends_x86_64=('libgcc' 'libstdc++')
optdepends=('nftables: remove the leftover NFQUEUE table after a crash')
provides=("honk-core=${pkgver}")
conflicts=('honk-core')
backup=('etc/honk/config.dae')
install="${pkgname}.install"
# Upstream strips the binary before release, so a debug package would be empty.
options=('!debug')

_upver='0.1.0-beta.6'
_dir="honk-core-v${_upver}-${CARCH}-unknown-linux-gnu-full"
_dir_x86_64="honk-core-v${_upver}-x86_64-unknown-linux-gnu-full"
_dir_aarch64="honk-core-v${_upver}-aarch64-unknown-linux-gnu-full"

source=('honk-core.service'
        'honk-core-restart.hook'
        'config.dae')
source_x86_64=("${_dir_x86_64}.tar.gz::${url}/releases/download/v${_upver}/${_dir_x86_64}.tar.gz")
source_aarch64=("${_dir_aarch64}.tar.gz::${url}/releases/download/v${_upver}/${_dir_aarch64}.tar.gz")
sha256sums=('cf31d4e43dc156b9c41d2f932f59e17eeaf1c160f95d1d430412b8978942b361'
            '3e396b1d043503717d661fb143b5537d9d5d4ae8ddb80dd3b7c37fde74ad89ea'
            'bd5c05369d485b9f8b18750fd3977d7c03a120909f06e203b4f911d89c64efed')
sha256sums_x86_64=('7d52080e18b3ad172d9a41a4ea38a84ff09f3a48cd7daff9d0872c6d87ba4ca7')
sha256sums_aarch64=('b6f78dc5b55f297d40dff1bfc936375889f635d2cdcffca2a4a351c6fe10944d')

package() {
  cd "${_dir}"

  install -Dm755 honk-core "${pkgdir}/usr/bin/honk-core"

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

  install -d "${pkgdir}/usr/share/honk"
  ln -s /usr/share/v2ray/geoip.dat "${pkgdir}/usr/share/honk/geoip.dat"
  ln -s /usr/share/v2ray/geosite.dat "${pkgdir}/usr/share/honk/geosite.dat"
}
