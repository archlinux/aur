# Contributor: Vítor Ferreira <vitor.dominor@gmail.com>
pkgname=xboxdrv-stable-git
pkgname_=xboxdrv
pkgver=0.8.8.r18.g662952a
pkgrel=1
pkgdesc="XBox/XBox 360 userspace gamepad driver and emulator - git stable branch"
url='https://xboxdrv.gitlab.io/'
arch=('i686' 'x86_64')
license=('GPL3')

depends=(
  'dbus-glib'
  'dbus-python'
  'libusb'
  'libx11'
  'systemd'
)
makedepends=(
  'boost'
  'git'
  'libx11'
  'pkg-config'
  'python'
  'scons'
)

provides=('xboxdrv')
conflicts=('xboxdrv')
backup=("etc/default/xboxdrv")

source=(
  "${pkgname}::git+https://gitlab.com/xboxdrv/xboxdrv.git#branch=stable"
  fix-60-sec-delay.patch
  xboxdrv.default
  xboxdrv.service
)
sha256sums=(
  'SKIP'
  '0383f5bd248530c2b43f6e2aa591530da50bbea63846c55c04387e7cbe939af9'
  '68a286300d28bbfc97eb694c6cc413776f0bc16e35de6d1969f13ef1e7d1cac5'
  'd631a8c3af7e2b4ef22f1494ded5d7a8029a8dd9756ef8907f909ef6aa0afc2b'
)

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
