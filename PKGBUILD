# Maintainer: Zach Hoffman <zach@zrhoffman.net>
pkgname=f5fpc
pkgver=7250.2024.1008.1
pkgrel=2
pkgdesc='Command-line VPN client using FastPPP to connect to F5Networks BIG-IP APM 13.0'
arch=(aarch64 armv7h x86_64)

source=('LICENSE')
mirror=vpn.cc.sophia.ac.jp
source_aarch64=("linux_f5cli-${pkgver}.aarch64.deb::https://${mirror}/public/download/linux_f5cli.aarch64.deb")
source_armv7h=("linux_f5cli-${pkgver}.armv7h.deb::https://${mirror}/public/download/linux_f5cli.armhf.deb")
source_x86_64=("linux_f5cli-${pkgver}.x86_64.deb::https://${mirror}/public/download/linux_f5cli.x86_64.deb")
b2sums_aarch64=('54986e84544ad516fa0328ac477b3e8120bb467cf2241743cbd7b5dabc2cf9dd09aeda3af71960440037f27caa1fc35c4fba956c28da3f81353012cccf82e710')
b2sums_armv7h=('60e798fd3056637619e19a45aaef7d8891c62f94f9c02ef97400771801ca5a76e05c9daa274a1bfe3a0563d61e71f4bdc685b08a81089cab603d90c4c220ea03')
b2sums_x86_64=('5297d864c281201cb159b07fd16af480b8458cff0baae9dd53adfb1cb0e2b9e5d9b95eb316e8d241704f0e49569171afac76ced4cefa89feb442e0176a90a009')
b2sums=('c864e69799ffc4c13bf8af7d76bcc8beed195d9a41acb01d459aaa0c3cd5bae75290ef7be1fa6a0bfd6472e1c3f8df3a7f5d59767861ded0dc4a373a3ead447c')
sha256sums_aarch64=('41e779452941a1648cfbccd1467980b872a2cafc22ea41d3c2fd7d63403b4591')
sha256sums_armv7h=('4ef3e93beb3e35375ea05813e8ac97e9ef2943de17a72aea9493190caf5ba3dc')
sha256sums_x86_64=('4a0d775e2ec2dd30c1967c1584620464b7aa34156dc7030a818987acc3cd0def')
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
