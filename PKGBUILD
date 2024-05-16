# Maintainer: Zach Hoffman <zach@zrhoffman.net>
pkgname=f5fpc
pkgver=7246.2024.0201.1
_pkgver_aarch64=7245.2023.1006.1
pkgrel=3
pkgdesc='Command-line VPN client using FastPPP to connect to F5Networks BIG-IP APM 13.0'
arch=(aarch64 armv7h x86_64)

source=('LICENSE')
mirror=vpn.chapman.edu
mirror_aarch64=remote.abdn.ac.uk
source_aarch64=("linux_f5cli-${_pkgver_aarch64}.aarch64.deb::https://${mirror_aarch64}/public/download/linux_f5cli.aarch64.deb")
source_armv7h=("linux_f5cli-${pkgver}.armv7h.deb::https://${mirror}/public/download/linux_f5cli.armhf.deb")
source_x86_64=("linux_f5cli-${pkgver}.x86_64.deb::https://${mirror}/public/download/linux_f5cli.x86_64.deb")
b2sums_aarch64=('a6cc4b14a636b504840ebc22ff0c3ada6115de75e833b51a0922f6eba3a4310a61ebee400d82fd9312a72c22628f65a5e4162dd3cc80c062e993b832afb425fd')
b2sums_armv7h=('4ea700d95d792c9453bd4d10d067ea7a46b84ed9171c1dbc61f738b7e1eedc2117329d838c4518e600e778b87a26e4a2600bb8a08fa9c134d26fb5aa5eaa6894')
b2sums_x86_64=('85fdef0868c6ff352419ce1841da1b89354dfaf2b7271e53b90dc66b91a831b4cb07bb2919e876db9bb3dc66705aa8c1ac19d616a8c25037c194e802acbbdcf9')
b2sums=('c864e69799ffc4c13bf8af7d76bcc8beed195d9a41acb01d459aaa0c3cd5bae75290ef7be1fa6a0bfd6472e1c3f8df3a7f5d59767861ded0dc4a373a3ead447c')
sha256sums_aarch64=('a83a0feb6b20f08d1da0a4fde648cb9793d678fc3b7b1f2eed43822bc747f83d')
sha256sums_armv7h=('848cec0814c121eefb9486d31599b894cd8c74afe59a7b3466d34d80c10c65b1')
sha256sums_x86_64=('ba3aa0d08d95a16442e8c60c041bff11ddbd9b7c54254029784651cd9f0312e1')
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
