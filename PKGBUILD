# Maintainer: Zach Hoffman <zach@zrhoffman.net>
pkgname=f5fpc
pkgver=7260.2025.0811.1
pkgrel=1
pkgdesc='Command-line VPN client using FastPPP to connect to F5Networks BIG-IP APM 13.0'
arch=(aarch64 armv7h x86_64)

source=('LICENSE')
mirror=vpn-mgmt.it.mtu.edu
source_aarch64=("linux_f5cli-${pkgver}.aarch64.deb::https://${mirror}/public/download/linux_f5cli.aarch64.deb")
source_armv7h=("linux_f5cli-${pkgver}.armv7h.deb::https://${mirror}/public/download/linux_f5cli.armhf.deb")
source_x86_64=("linux_f5cli-${pkgver}.x86_64.deb::https://${mirror}/public/download/linux_f5cli.x86_64.deb")
b2sums_aarch64=('abb9aa251a94672208f34221e333de88e71d204ff3b5a841cce192c0cfb366ef51bf0e02f52507ea3b8af44ec007fc83865673cbee66ef09cfe29044633007e0')
b2sums_armv7h=('f556860490e14b80a029223c4f0a2ce171f060de6a0b262a34589866cd87a9df283117574c203a7ec5de94b898fa25389d6682cee9993a3391010b8d755d0bc2')
b2sums_x86_64=('0be5dce285f6c0fc3dbb05dfe252a60b56693152c951055071adaa2f8db032eecdc534cf4513ee8d01a1325feddc69e5cb7eccf572ce7263c2ca439e073fa683')
b2sums=('c864e69799ffc4c13bf8af7d76bcc8beed195d9a41acb01d459aaa0c3cd5bae75290ef7be1fa6a0bfd6472e1c3f8df3a7f5d59767861ded0dc4a373a3ead447c')
sha256sums_aarch64=('df94f347dc2ad2e53cfc7ca2844ab44706ef92eea60a256fcd29e9f2ea8cdf08')
sha256sums_armv7h=('2501674ccffaa2a0e9bb545dfbfbb2958d723a7880f11b8590ae36dedf821a6e')
sha256sums_x86_64=('dbfceb58b76376f7ff3e686dc06462d6d66226d31e09488c462ba1b611907785')
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
