# Maintainer: Zach Hoffman <zach@zrhoffman.net>
_pkgname=f5vpn
pkgname=${_pkgname}-ng
pkgver=7271.0.0.4
pkgrel=4
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
sha256sums_aarch64=('4ad1008f04119975b169963960511174660403f63897be34f91abc4333418915')
sha256sums_x86_64=('04f8c670fabfe4d125849832973c3441d741ec31b1a325d799b3e702964988c0')
b2sums=('b2b3e60a956a4d55e12695d3a034832af321c57a3da6a907600062c723d8eb44b53473effb8346a3aef9e3423378e74e28b3f1d9ea643d19b4d7ebc4034880a6'
        '62cac1949c36ca2d6f74f72d83e953d9cc95d7cee60acb3f03afcdce71b00e10e3e22613c206858e94a1a91076917cb28d9b2a75133120a344a93fc4a6c6cefc'
        'SKIP')
b2sums_aarch64=('48036a2df2c810bdbbbc3ab686da4f0ba1e4bb2c675fa6b0a15c848b8a59353d46ee8a6ea53fff2573961c31207efc732f5fab44b1e23106137b9708d89d9a24')
b2sums_x86_64=('f8dac5cd7c42aeee508483041400392904e6a695bb8aca267c507c399240b0ea36764de05e591de7ad39024d01be80032fc8ae33c6d5416bd07fc2cab097b911')
depends=(curl gtk3 openssl icu webkit2gtk-4.1)
optdepends=(
  'xorg-xwayland: wayland support'
)
provides=("${pkgname}")
conflicts=("${_pkgname}")
url='https://techdocs.f5.com/kb/en-us/products/big-ip_apm/releasenotes/related/relnote-edge-client-7-2-7-1.html'
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
