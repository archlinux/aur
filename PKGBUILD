# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Maintainer: Andrew Rabert <ar@nullsum.net>
# Contributor: Jack Mitchell <jack@embed.me.uk>
# Contributor: Kevin MacMartin <prurigro at gmail dot com>

pkgname=xboxdrv
pkgver=0.8.8
pkgrel=7
pkgdesc='Userspace gamepad driver for Linux'
url='https://xboxdrv.gitlab.io/'
arch=('x86_64')
license=('GPL3')
depends=('libx11' 'dbus-glib' 'dbus-python' 'libusb' 'systemd')
makedepends=('scons' 'boost' 'pkg-config' 'libx11' 'python')
backup=("etc/default/xboxdrv")
source=(${pkgname}-${pkgver}.tar.gz::https://gitlab.com/xboxdrv/${pkgname}/-/archive/v${pkgver}/xboxdrv-v${pkgver}.tar.gz
        xboxdrv.service
        xboxdrv.default
        fix-60-sec-delay.patch
        scons-py3.patch
        scons-v4.2.0.patch
        xboxdrvctl-py3.patch)
sha512sums=('a7f4c35dbd56289fe7b24150c0452bd72fda99f01a2271b20175cb872d06798270492bee2a0a6449b43dc23593a8c1c955a0e4505186240b366f0c34cd9958a5'
            'f1a4e7b1a06e951c3a4f5bcdec5f14db542b34963950619f0d4b1ee324d64b18ca2f63642719ef65a63e424702fb0eb33e0259937906732e587b96a9582c2e6b'
            '4f6e9a12b208254e19daba477dd7787147a8b2c8a83007d92f8cfce6212c21ce3306f23a2669080f0e46986ca102ab08c262b42c678caf1a891326b4e2c40b5f'
            '58170b3f96f02e5ba0af5f6641482fb1c612ca70650e475d68b55c05a62ec0831033190b90e591d593fd6b25c2a155e6c4975f37eef1534245947156a5e3285f'
            'b3a3bbb51fa1c4ad4dd898136c3bf7c0f13193bdd07bbcb5c8243edb747c68223fe8c5bd2fd578f6c2b18844827524abb0533ce98b6e0e60fe936597cdba811d'
            'b7d9911bd52fb59f5dd655a4f81e61848ea2637ebd44768d963a525e62c4592d00f7f40d6eb4e14a184fbd0d6517df182ffb2cafd1e9a66406b86672ad63cdea'
            '4e6de460523c1ddfc608b3bd6fb211a7ca0516b64a2d91e01b51deaa4fcc57d64985bb2ccfca43873efef4987e0d04741f0e97dbd6b77037a4417a97cb8d0bf9')

prepare() {
  cd ${pkgname}-v${pkgver}
  sed 's|python|python2|g' -i examples/*.py
  patch -p1 < "${srcdir}/fix-60-sec-delay.patch"
  patch -p1 < "${srcdir}/scons-py3.patch"
  patch -p1 < "${srcdir}/scons-v4.2.0.patch"
  patch -p1 < "${srcdir}/xboxdrvctl-py3.patch"
}

build() {
  cd ${pkgname}-v${pkgver}
  scons \
    LINKFLAGS="${LDFLAGS}" \
    CXXFLAGS="${CPPFLAGS} ${CXXFLAGS}" \
    "${MAKEFLAGS}"
}

package() {
  cd ${pkgname}-v${pkgver}
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm 644 "${srcdir}/${pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}.service"
  install -Dm 644 "${srcdir}/${pkgname}.default" "${pkgdir}/etc/default/${pkgname}"
  install -Dm 644 README.md NEWS PROTOCOL -t "${pkgdir}/usr/share/doc/${pkgname}"
  install -Dm 644 examples/* -t "${pkgdir}/usr/share/doc/${pkgname}/examples"
  install -Dm 644 data/org.seul.Xboxdrv.conf -t "${pkgdir}/etc/dbus-1/system.d"
}

# vim: ts=2 sw=2 et:
