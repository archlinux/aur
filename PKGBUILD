# Maintainer: Zach Hoffman <zach@zrhoffman.net>
pkgname=f5vpn
pkgver=7262.0.0.2
pkgrel=2
pkgdesc='VPN client using the Point-to-Point Protocol to connect to F5Networks BIG-IP APM'
arch=(aarch64 x86_64)
mirror=vpn-mgmt.it.mtu.edu
source=('LICENSE'
        'no-desktop-file-dbus.aarch64.patch'
        'no-desktop-file-dbus.x86_64.patch')
source_aarch64=("linux_${pkgname}-${pkgver}.aarch64.deb::https://${mirror}/public/download/linux_${pkgname}.aarch64.deb")
source_x86_64=("linux_${pkgname}-${pkgver}.x86_64.deb::https://${mirror}/public/download/linux_${pkgname}.x86_64.deb")
b2sums_aarch64=('1e57f41b96c6c0440f2312bf44ac17e54c91be6c683231f5a1f99bef0ca8b7fa4be19b363d7913e5d1ea5eef8fef40b44c086332d8c7b21c1bfe0c671695e7b1')
b2sums_x86_64=('7801f78662a85786a8ac00b150b7afd36bb182bee114d3f3e44cda60af2414cd3c3289fae2810e4f1fee036872297cc6da84cd4cabeb47c82dd88f81c2711228')
b2sums=('c864e69799ffc4c13bf8af7d76bcc8beed195d9a41acb01d459aaa0c3cd5bae75290ef7be1fa6a0bfd6472e1c3f8df3a7f5d59767861ded0dc4a373a3ead447c'
'd64f0d1a4d413701dd31464c086b84049fbf5919774f2440a8d9f139deedf8b9e83a229ad59cf5434c5ccd33a0151bb9621d941096b4cc1d641c86681f81eafa'
'5be3f5ebd0358e022c85081b45bc23b1e847542ae9035bece95c40fa5113a1fd9159ced013950d237206c2e6be94caa38b9d6414ea29ab65cd80043a2dfbfe5a')
sha256sums_aarch64=('4457c94ac6fdaf9faea8f32e3f87a72d977f8bdab859f05bf22d2e7f97bb65de')
sha256sums_x86_64=('5bd98349e5b83d27ea0839543d883ce2f8d9e54c5cee67220b8ba2a7ec53ea0d')
sha256sums=('85f06be8b8e438c4cefdad9e8975d1c48fd53446fe35e95d4260ba14ac7f98fd'
'fadc7ae9c2297a93101a98c24ed63087a05a6e24bb33ba4b795bfd4339dba7cf'
'3ecd8a10941a7d81b9d16aecdf6ac9caa1f957e32a2d2c65bde5181abd1fcb73')
depends=(libxml2-legacy openssl)
provides=("${pkgname}")
url='https://support.f5.com/csp/article/K32311645#link_04_05'
license=('commercial')

pkgver() {
  tar -xf data.tar.xz
  grep -oEm1 --text '[0-9]+(\.[0-9]+){3}' opt/f5/vpn/svpn
}

package() {
  (
  cd "${srcdir}/opt/f5/vpn"

  patch -i "${srcdir}/no-desktop-file-dbus.${CARCH}.patch" # Desktop file does not work with Dbus enabled

  chmod u+s svpn # f5vpn should not be run as root, but it calls svpn which must be run as root
  install -Dm644 "com.f5.${pkgname}.desktop" "${pkgdir}/usr/share/applications/com.f5.${pkgname}.desktop"
  install -dm755 "${pkgdir}/usr/bin/"
  install -dm755 "${pkgdir}/usr/local/lib/F5Networks/SSLVPN/var/run" # For svpn.pid
  ln -s '/opt/f5/vpn/f5vpn_launch_helper.sh' "${pkgdir}/usr/bin/${pkgname}"
  ln -s '/opt/f5/vpn/tunnelserver' "${pkgdir}/usr/bin/tunnelserver"

  for resolution in 16 24 32 48 64 96 128 256 512 1024; do
      install -Dm644 "logos/${resolution}x${resolution}.png" \
                      "${pkgdir}/usr/share/icons/hicolor/${resolution}x${resolution}/apps/${pkgname}.png"
  done
  )
  install -Dm644 'LICENSE' "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  cp -a opt "${pkgdir}"
}
