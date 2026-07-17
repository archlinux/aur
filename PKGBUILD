# Maintainer: Zach Hoffman <zach@zrhoffman.net>
pkgname=f5fpc
pkgver=7270.0.0.1
pkgrel=4
pkgdesc='Command-line VPN client using FastPPP to connect to F5Networks BIG-IP APM 13.0'
arch=(aarch64 armv7h x86_64)

source=('LICENSE')
mirror=supportvpn.brown.edu
source_aarch64=("linux_f5cli-${pkgver}.aarch64.deb::https://${mirror}/public/download/linux_f5cli.aarch64.deb")
source_armv7h=("linux_f5cli-${pkgver}.armv7h.deb::https://${mirror}/public/download/linux_f5cli.armhf.deb")
source_x86_64=("linux_f5cli-${pkgver}.x86_64.deb::https://${mirror}/public/download/linux_f5cli.x86_64.deb")
b2sums_aarch64=('d6a3e657791393ae1d9bbe52b052c85e8b964024942fe07fa37d72fbd63339ddfcedcb510d4c848abd3a5040c06ea796a5bde4f054c0f97cd6313bc4bd07c7a4')
b2sums_armv7h=('2de023b322bf70920018168bff66a7d259ad46132ced26445786e00954e4da22a5f6525654c30d1fd13c68beb9960834397f63e12a1ae495642f249a089fc94b')
b2sums_x86_64=('a0daf3c6be1cb4550396352986ab185bf3551225465581425edcce04a035f75ccc49475ff4d69d78d124a7eb684599f3fdf7543e017fdd0f7be2a6f0317ca6e8')
b2sums=('c864e69799ffc4c13bf8af7d76bcc8beed195d9a41acb01d459aaa0c3cd5bae75290ef7be1fa6a0bfd6472e1c3f8df3a7f5d59767861ded0dc4a373a3ead447c')
sha256sums_aarch64=('bded0295236cae5f7eb15e20ccba71ca1781dbc66b56bf4a7bb850138688015e')
sha256sums_armv7h=('650797153193d10d73ef6edf8585d5269f2b3e3975e0d788d27969087f62260d')
sha256sums_x86_64=('0f86df9183d7730cde54975c5fb1392416eed23d6597088c9847a4b0ca30f6c7')
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
