# Maintainer: xiota <aur@mentalfossa.com>
# Contributor: Vítor Ferreira <vitor.dominor@gmail.com>
pkgname=xboxdrv-stable-git
pkgname_=xboxdrv
pkgver=0.8.8.r18.g662952a
pkgrel=1
pkgdesc="XBox/XBox 360 userspace gamepad driver and emulator - git stable branch"
url='https://xboxdrv.gitlab.io/'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('libx11' 'dbus-glib' 'dbus-python' 'libusb' 'systemd')
makedepends=('scons' 'boost' 'pkg-config' 'libx11' 'python')
provides=('xboxdrv' 'xboxdrv-git' 'xboxdrv-sl6566bk' 'xboxdrv-cebtenzzre-git' 'xboxdrv-develop-git')
conflicts=('xboxdrv' 'xboxdrv-git' 'xboxdrv-sl6566bk' 'xboxdrv-cebtenzzre-git' 'xboxdrv-develop-git')
backup=("etc/default/xboxdrv")
source=("${pkgname}::git+https://gitlab.com/xboxdrv/xboxdrv.git#branch=stable"
        xboxdrv.service
        xboxdrv.default
        fix-60-sec-delay.patch)
sha512sums=('SKIP'
            'f1a4e7b1a06e951c3a4f5bcdec5f14db542b34963950619f0d4b1ee324d64b18ca2f63642719ef65a63e424702fb0eb33e0259937906732e587b96a9582c2e6b'
            '4f6e9a12b208254e19daba477dd7787147a8b2c8a83007d92f8cfce6212c21ce3306f23a2669080f0e46986ca102ab08c262b42c678caf1a891326b4e2c40b5f'
            '58170b3f96f02e5ba0af5f6641482fb1c612ca70650e475d68b55c05a62ec0831033190b90e591d593fd6b25c2a155e6c4975f37eef1534245947156a5e3285f')

prepare() {
  cd ${pkgname}
  sed 's|python|python2|g' -i examples/*.py
  patch -p1 < "${srcdir}/fix-60-sec-delay.patch"
}

pkgver() {
  cd ${pkgname}
  # cutting off 'v' prefix present in the git tag
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname}
  scons \
    LINKFLAGS="${LDFLAGS}" \
    CXXFLAGS="${CPPFLAGS} ${CXXFLAGS}" \
    "${MAKEFLAGS}"
}

package() {
  cd ${pkgname}
  make PREFIX=/usr DESTDIR="${pkgdir}" install
  install -Dm 644 "${srcdir}/xboxdrv.service" "${pkgdir}/usr/lib/systemd/system/xboxdrv.service"
  install -Dm 644 "${srcdir}/xboxdrv.default" "${pkgdir}/etc/default/${pkgname_}"
  install -Dm 644 README.md NEWS PROTOCOL -t "${pkgdir}/usr/share/doc/${pkgname_}"
  install -Dm 644 examples/* -t "${pkgdir}/usr/share/doc/${pkgname_}/examples"
  install -Dm 644 data/org.seul.Xboxdrv.conf -t "${pkgdir}/etc/dbus-1/system.d"
}
