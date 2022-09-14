# Contributor: Stunts <f.pinamartins@gmail.com>
pkgname=xboxdrv-develop-git
_pkgname=xboxdrv
pkgver=0.8.4.r455.g1d267b9
pkgrel=1
pkgdesc="XBox/XBox 360 userspace gamepad driver and emulator - git development branch"
arch=('i686' 'x86_64')
url="https://xboxdrv.gitlab.io"
license=('GPL3')

depends=(
  'bluez-libs'
  'dbus-glib'
  'dbus-python'
  'fmt'
  'libusb'
  'libx11'
  'systemd'
)
makedepends=(
  'git'
  'scons'
  'pkg-config'
)

provides=('xboxdrv')
conflicts=('xboxdrv')

source=(
  "${pkgname}"::'git+https://gitlab.com/xboxdrv/xboxdrv.git#commit=1d267b92326375f2b8f3dd895c34f8eacc703a4e'
  'xboxdrv.service'
  'xboxdrv.conf'
)
sha256sums=(
  'SKIP'
  '51387a52a97d2e004a4160432131f18326e9ae655447694e170f18bdb8d7204f'
  'f155dd059faecafa60ecaa0988aec815ee0c58f1af45075de82ae10c31db2750'
)

prepare() {
  cd ${pkgname}
  git submodule update --recursive --init
}

pkgver() {
  cd ${pkgname}
  # cutting off 'v' prefix present in the git tag
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd ${pkgname}
  mkdir -p build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX:PATH=/usr
  make
}

package() {
  cd ${pkgname}/build
  make install DESTDIR=${pkgdir}
  
  install -D -m755 ${srcdir}/xboxdrv.service ${pkgdir}/usr/lib/systemd/system/xboxdrv.service
  install -D -m644 ${srcdir}/xboxdrv.conf ${pkgdir}/etc/conf.d/xboxdrv
}
