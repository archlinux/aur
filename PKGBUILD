# Maintainer: Tess Hoffman <tess@zrhoffman.net>
_pkgname=f5vpn
pkgname=${_pkgname}-ng
pkgver=7272.0.0.2
pkgrel=2
pkgdesc='VPN client using the Point-to-Point Protocol to connect to F5Networks BIG-IP APM'
arch=(aarch64 x86_64)
mirror=vpn.f5networks.net
source=('com.f5.f5vpn.service' 'desktop-file-dbus.patch'
  'license.html::https://cdn.f5.com/product/apm/apps/eula.html')
source_aarch64=("linux_${_pkgname}-${pkgver}.aarch64.deb::https://${mirror}/public/download/linux_${_pkgname}.aarch64.deb")
source_x86_64=("linux_${_pkgname}-${pkgver}.x86_64.deb::https://${mirror}/public/download/linux_${_pkgname}.x86_64.deb")
sha256sums=('0c26681df93149e4339bc2de9aaf92ef4ed4cb926b8e127da72113d02c0923e5'
            'c71a54a47cae863a095d03cee6b1b97c4fee49f799927abd13f44bd2374988bf'
            'SKIP')
sha256sums_aarch64=('32c1ad9ac210b0642ddf2fba5f047372183135bd821a46083bb78b0ba864fefc')
sha256sums_x86_64=('53c6fc43643200b90aac3d4a0b21e163b6e235d11b51bce1695aec083cf79059')
b2sums=('b2b3e60a956a4d55e12695d3a034832af321c57a3da6a907600062c723d8eb44b53473effb8346a3aef9e3423378e74e28b3f1d9ea643d19b4d7ebc4034880a6'
        '62cac1949c36ca2d6f74f72d83e953d9cc95d7cee60acb3f03afcdce71b00e10e3e22613c206858e94a1a91076917cb28d9b2a75133120a344a93fc4a6c6cefc'
        'SKIP')
b2sums_aarch64=('0d80c59208284c1905564391ba3ac48ba1875904f6cb512a6eed12ad0154a528e669165e92afc7dfb06be8761014c6597d73195bc4bd41df7b21158f6780d7b6')
b2sums_x86_64=('6ca40bbc82fd12fef75417cfec457363defbcb6ac2077cadc39e188cfe566a3a713b4c79738fe8dcd5b76d6fdb577abebbe458bf7e9e5671e2d08e5e6e9465fc')
depends=(curl gtk3 openssl icu libxml2-legacy webkit2gtk-4.1)
optdepends=(
  'xorg-xwayland: wayland support'
)
provides=("${pkgname}")
conflicts=("${_pkgname}")
url='https://techdocs.f5.com/kb/en-us/products/big-ip_apm/releasenotes/related/relnote-edge-client-7-2-7-2.html'
license=('commercial')

pkgver() {
  tar -xf data.tar.xz
  grep -oEm1 --text '[0-9]+(\.[0-9]+){3}' "usr/share/${pkgname}/svpn"
}

package() {
  # f5vpn-ng should not be run as root, but it calls svpn which must be privileged to run ip commands
  # TODO: Make a dedicated f5vpn service account own and run svpn.
  chmod u+s "${srcdir}/usr/share/${pkgname}/svpn"

  (
    cd "${srcdir}/usr/share/applications"
    patch -i "${srcdir}/desktop-file-dbus.patch"
  )
  install -Dm644 "com.f5.f5vpn.service" "${pkgdir}/usr/lib/systemd/user/com.f5.${_pkgname}.service"
  install -Dm644 'license.html' "${pkgdir}/usr/share/licenses/${_pkgname}/license.html"
  install -dm755 "${pkgdir}/usr/local/lib/F5Networks/SSLVPN/var/run" # For svpn.pid

  cp -a usr "${pkgdir}"
}
