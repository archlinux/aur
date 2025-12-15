# Maintainer: Zach Hoffman <zach@zrhoffman.net>
pkgname=f5fpc
pkgver=7262.0.0.2
pkgrel=1
pkgdesc='Command-line VPN client using FastPPP to connect to F5Networks BIG-IP APM 13.0'
arch=(aarch64 armv7h x86_64)

source=('LICENSE')
mirror=vpn-mgmt.it.mtu.edu
source_aarch64=("linux_f5cli-${pkgver}.aarch64.deb::https://${mirror}/public/download/linux_f5cli.aarch64.deb")
source_armv7h=("linux_f5cli-${pkgver}.armv7h.deb::https://${mirror}/public/download/linux_f5cli.armhf.deb")
source_x86_64=("linux_f5cli-${pkgver}.x86_64.deb::https://${mirror}/public/download/linux_f5cli.x86_64.deb")
b2sums_aarch64=('a10735649ad67a20f27df7bbb40c7352e6351f61f810288cd271f8811ea5c3c23ce855b3ec5917f1f254bb03425c18f19d6d2ce94ac9393b51bf6294b579c566')
b2sums_armv7h=('60a5dfa90f858027f9e5b02313203b3d29b66943a6b95f591291a980b63c996537d39a29a5b46b101f84d721893836f2d8c74f1e93ebe02762f16cb17463e595')
b2sums_x86_64=('92582951cb657dd7c47bf5509550ac17236cdc784d092be92b470c5c2d345a9223cc799aab8209628a2c7d5a190971a901b3b000a93e2430f8cd13cecdbb7d5d')
b2sums=('c864e69799ffc4c13bf8af7d76bcc8beed195d9a41acb01d459aaa0c3cd5bae75290ef7be1fa6a0bfd6472e1c3f8df3a7f5d59767861ded0dc4a373a3ead447c')
sha256sums_aarch64=('2622c16b37a0449b96534b1d5a4199a5d6622c3b821294bdfdae33b033edfa12')
sha256sums_armv7h=('0de95a15c2052ff952f23642542b20a9013077e93c86d24f835490a0ceae4169')
sha256sums_x86_64=('00e4f5010547344499ac6c3df024bfeabf00457c52f291b6f3000ef0c6f3914f')
sha256sums=('85f06be8b8e438c4cefdad9e8975d1c48fd53446fe35e95d4260ba14ac7f98fd')

depends=(openssl)
makedepends=(tar)
provides=("${pkgname}" svpn)
url='https://techdocs.f5.com/kb/en-us/products/big-ip_apm/manuals/product/apm-client-configuration-11-4-0/4.html'
license=('commercial')

pkgver() {
  if [[ "$CARCH" == armv7h ]]; then
    tar xf data.tar.zst
  else
    tar xf data.tar.xz
  fi
  cat usr/local/lib/F5Networks/SSLVPN/etc/version.txt
}

package() {
  install -dm755 "${pkgdir}/usr/bin/"

  rm -r "${srcdir}/usr/local/bin"

  if [[ "$CARCH" == armv7h ]]; then
    suffix=armhf
  else
    suffix="$CARCH"
  fi

  chmod u+s "${srcdir}/usr/local/lib/F5Networks/SSLVPN/svpn_${suffix}"
  ln -s "/usr/local/lib/F5Networks/SSLVPN/svpn_${suffix}" "${pkgdir}/usr/bin/svpn"
  ln -s "/usr/local/lib/F5Networks/${pkgname}_${suffix}" "${pkgdir}/usr/bin/${pkgname}"

  cp -a usr "${pkgdir}"
}
