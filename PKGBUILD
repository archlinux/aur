# Maintainer: Zach Hoffman <zach@zrhoffman.net>
pkgname=f5fpc
pkgver=7261.2025.1009.1
pkgrel=1
pkgdesc='Command-line VPN client using FastPPP to connect to F5Networks BIG-IP APM 13.0'
arch=(aarch64 armv7h x86_64)

source=('LICENSE')
mirror=vpn-mgmt.it.mtu.edu
source_aarch64=("linux_f5cli-${pkgver}.aarch64.deb::https://${mirror}/public/download/linux_f5cli.aarch64.deb")
source_armv7h=("linux_f5cli-${pkgver}.armv7h.deb::https://${mirror}/public/download/linux_f5cli.armhf.deb")
source_x86_64=("linux_f5cli-${pkgver}.x86_64.deb::https://${mirror}/public/download/linux_f5cli.x86_64.deb")
b2sums_aarch64=('a18a1c55216971cfdfe92e377252b862bd3783c6cfca2fb869fd1d4ecabf3058941c712ed05b8d62f095e890757a93c33b451c83090da7455b2f0dcffa97ce05')
b2sums_armv7h=('fbafc7bd4930f2420ff965323214f084d881dacd33935ceb2c8d7ba55165e690eca19ec89bf40cb02baf8e7878300e660125d20d3b6e2424de10f2cc8814cf73')
b2sums_x86_64=('974cf50999c597e47c25092e26d508b7481ca10bd1c7a9390b7572c37cc95e5cfa2153435fff48eeada7ab367a5e000573bbdd20af934a9dc9afc4fd440f67ea')
b2sums=('c864e69799ffc4c13bf8af7d76bcc8beed195d9a41acb01d459aaa0c3cd5bae75290ef7be1fa6a0bfd6472e1c3f8df3a7f5d59767861ded0dc4a373a3ead447c')
sha256sums_aarch64=('7d1044dd72de21e09c9cfae952fdaf44596b91d29e197f2750d5cd825e962bad')
sha256sums_armv7h=('2c0663f880f081648bc109ea436adce5e34be113575ab96902c0b713039d5cdc')
sha256sums_x86_64=('e878414e2dbbb6e818a55cefcb9293314a23c16ef24d1f561e90379bfabdd8cb')
sha256sums=('85f06be8b8e438c4cefdad9e8975d1c48fd53446fe35e95d4260ba14ac7f98fd')

depends=(openssl)
makedepends=(tar)
provides=("${pkgname}" svpn)
url='https://techdocs.f5.com/kb/en-us/products/big-ip_apm/manuals/product/apm-client-configuration-11-4-0/4.html'
license=('commercial')

pkgver() {
  tar -xf data.tar.gz
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
