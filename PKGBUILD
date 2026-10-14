# Maintainer: Tess Hoffman <tess@zrhoffman.net>
_pkgname=f5vpn
pkgname=${_pkgname}-ng
pkgver=7273.0.0.3
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
            '4507e09374f3e6044952f375e4a1af31505b267c4e0bb066ff159e85694a3d6e')
sha256sums_aarch64=('caece158f64b5b59644a6995291e140b0f8b91fda9510fc8007c12716d02bf71')
sha256sums_x86_64=('829f3565f81128142e8865fc0c17af1d3fb80ba08ebe1dc70154716164538a04')
b2sums=('b2b3e60a956a4d55e12695d3a034832af321c57a3da6a907600062c723d8eb44b53473effb8346a3aef9e3423378e74e28b3f1d9ea643d19b4d7ebc4034880a6'
        '62cac1949c36ca2d6f74f72d83e953d9cc95d7cee60acb3f03afcdce71b00e10e3e22613c206858e94a1a91076917cb28d9b2a75133120a344a93fc4a6c6cefc'
        '234729d2ff102638d649e46aa7da193f3a46af396cf063876cbabb71b946ef2df4731519acc48f87e2a2d51f52e45ce494e04320a3fa006fbe5fb734820f51d8')
b2sums_aarch64=('76b9dd69e097f863e79b5e3e82876a6d98bd1d3f008199eb1f438e75c2fbed8a4d8331cc0a8525de13b349c2ab2273923b004b57a4242cf0f809cbe86a1d0ddf')
b2sums_x86_64=('b54070cf841d098b67934514003b63c81d9d8aba91c230f5cd88feae345482eef58da51420ed906c2f8a20a61dc6a0b6ffdd76c9733380c33b56b3785ba103e1')
depends=(curl gtk3 openssl icu libxml2-legacy webkit2gtk-4.1)
optdepends=(
  'xorg-xwayland: wayland support'
)
provides=("${pkgname}")
conflicts=("${_pkgname}")
url='https://techdocs.f5.com/kb/en-us/products/big-ip_apm/releasenotes/related/relnote-edge-client-7-2-7-3.html'
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
