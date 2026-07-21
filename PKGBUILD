# Maintainer: Zach Hoffman <zach@zrhoffman.net>
pkgname=f5vpn
pkgver=7271.0.0.4
pkgrel=2
pkgdesc='VPN client using the Point-to-Point Protocol to connect to F5Networks BIG-IP APM'
arch=(aarch64 x86_64)
mirror=vpn-mgmt.it.mtu.edu
source=('no-desktop-file-dbus.patch'
  'license.html::https://cdn.f5.com/product/apm/apps/eula.html')
source_aarch64=("linux_${pkgname}-${pkgver}.aarch64.deb::https://${mirror}/public/download/linux_${pkgname}.aarch64.deb")
source_x86_64=("linux_${pkgname}-${pkgver}.x86_64.deb::https://${mirror}/public/download/linux_${pkgname}.x86_64.deb")
sha256sums=('4f4e0f6362ece63d5370e8059c182e869198fb203455bc0fa50ee3ed95a9cdd0'
            '4507e09374f3e6044952f375e4a1af31505b267c4e0bb066ff159e85694a3d6e')
sha256sums_aarch64=('4ad1008f04119975b169963960511174660403f63897be34f91abc4333418915')
sha256sums_x86_64=('04f8c670fabfe4d125849832973c3441d741ec31b1a325d799b3e702964988c0')
b2sums=('a7c4fe1a43f71fc39f42883dd80a234852bdadc0f4d595b63308cb511749a2f84ee475c4f3dd8eb74bfb854c2cfe56528d05b0a07ab637e78297e61ba7d9baf2'
        '234729d2ff102638d649e46aa7da193f3a46af396cf063876cbabb71b946ef2df4731519acc48f87e2a2d51f52e45ce494e04320a3fa006fbe5fb734820f51d8')
b2sums_aarch64=('48036a2df2c810bdbbbc3ab686da4f0ba1e4bb2c675fa6b0a15c848b8a59353d46ee8a6ea53fff2573961c31207efc732f5fab44b1e23106137b9708d89d9a24')
b2sums_x86_64=('f8dac5cd7c42aeee508483041400392904e6a695bb8aca267c507c399240b0ea36764de05e591de7ad39024d01be80032fc8ae33c6d5416bd07fc2cab097b911')
depends=(curl gtk3 openssl icu webkit2gtk-4.1)
optdepends=(
  'xorg-xwayland: wayland support'
)
provides=("${pkgname}")
url='https://techdocs.f5.com/kb/en-us/products/big-ip_apm/releasenotes/related/relnote-edge-client-7-2-7-1.html'
license=('commercial')

pkgver() {
  tar -xf data.tar.xz
  grep -oEm1 --text '[0-9]+(\.[0-9]+){3}' usr/share/f5vpn-ng/svpn
}

package() {
  # f5vpn-ng should not be run as root, but it calls svpn which must be run as root
  chmod u+s "${srcdir}/usr/share/f5vpn-ng/svpn"

  (
    cd "${srcdir}/usr/share/applications"
    patch -i "${srcdir}/no-desktop-file-dbus.patch" # Desktop file does not work with Dbus enabled
  )
  install -dm755 "${pkgdir}/usr/local/lib/F5Networks/SSLVPN/var/run" # For svpn.pid
  install -Dm644 'license.html' "${pkgdir}/usr/share/licenses/${pkgname}/license.html"

  cp -a usr "${pkgdir}"
}
