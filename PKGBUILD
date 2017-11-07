# Maintainer: mrAppleXZ <mr.applexz@gmail.com>

pkgname=xboxdrv-sl6566bk
_pkgname=xboxdrv
pkgver=0.8.8
pkgrel=1
pkgdesc='Userspace gamepad driver for Linux with Speedlink SL-6566-BK patch. Based on the "xboxdrv" package.'
url='http://pingus.seul.org/~grumbel/xboxdrv'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('libx11' 'dbus-glib' 'libusb' 'python2-dbus' 'systemd')
makedepends=('scons' 'boost' 'pkg-config' 'libx11' 'python')
backup=("etc/default/xboxdrv")
conflicts=('xboxdrv')
provides=(xboxdrv=${pkgver})
source=(${_pkgname}-${pkgver}.tar.gz::https://github.com/xboxdrv/${_pkgname}/archive/v${pkgver}.tar.gz
        xboxdrv.service
        xboxdrv.default
        fix-60-sec-delay.patch
        scons-py3.patch
        sl6566bk.patch)
sha512sums=('3f27856da211a14e27a84fa5919da7965262adc36da16c75eed9bae891098183b5751a3e707573b4ab64e69096ea74d455e8f64827c88b38b65af94cc13b34ad'
            'a2eca367f6767e220d58cbb5b7555376d8b73b52ccbbfde937ef204ad67859e25d2331a80d5e57c7e7e3fc6c8cccfa862b64ddafd26c2aef818a979209910e7a'
            'c346eb1c81547c7b1917b6f847be3155eaa9968d0dc7818b52fed23a123f8055dd77209d00933022fb91af36f495530e9d5e29071a9c5059c14d7be33eec42e5'
            '58170b3f96f02e5ba0af5f6641482fb1c612ca70650e475d68b55c05a62ec0831033190b90e591d593fd6b25c2a155e6c4975f37eef1534245947156a5e3285f'
            'b3a3bbb51fa1c4ad4dd898136c3bf7c0f13193bdd07bbcb5c8243edb747c68223fe8c5bd2fd578f6c2b18844827524abb0533ce98b6e0e60fe936597cdba811d'
            'bf51b70d851a5e0c01995ba4770eded2b14b983252a9185443df01496c780d2051c8c41aaa4314ce155fc76fb46cdecb2ea02ff85693bf8f233eb9957bd96800')

prepare() {
  cd ${_pkgname}-${pkgver}
  sed 's|python|python2|g' -i examples/*.py
  patch -p1 < "${srcdir}/fix-60-sec-delay.patch"
  patch -p1 < "${srcdir}/sl6566bk.patch"
  # activate this patch when scons gets switched back to py3
  # patch -p1 < "${srcdir}/scons-py3.patch"
}

build() {
  cd ${_pkgname}-${pkgver}
  scons \
    LINKFLAGS="${LDFLAGS}" \
    CXXFLAGS="${CPPFLAGS} ${CXXFLAGS}" \
    "${MAKEFLAGS}"
}

package() {
  cd ${_pkgname}-${pkgver}
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm 644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
  install -Dm 644 "${srcdir}/${_pkgname}.default" "${pkgdir}/etc/default/${_pkgname}"
  install -Dm 644 README.md NEWS PROTOCOL -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -Dm 644 examples/* -t "${pkgdir}/usr/share/doc/${_pkgname}/examples"
  install -Dm 644 data/org.seul.Xboxdrv.conf -t "${pkgdir}/etc/dbus-1/system.d"
}

# vim: ts=2 sw=2 et:
