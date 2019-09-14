pkgname=caitsith-lkm
_basever=0.2
_timestamp=20190820
pkgver=${_basever}_${_timestamp}
_kernver=$(uname -r)
pkgrel=1
pkgdesc='CaitSith LKM-based LSM version'
arch=('i686' 'x86_64')
url='http://caitsith.osdn.jp/'
license=('GPL')
depends=('linux' 'ncurses')
makedepends=('linux-headers')
optdepends=('caitsith-tools')
install=caitsith-lkm.install
source=("http://jaist.dl.osdn.jp/caitsith/66537/caitsith-patch-${_basever}-${_timestamp}.tar.gz"
	"http://jaist.dl.osdn.jp/caitsith/66537//caitsith-patch-${_basever}-${_timestamp}.tar.gz.asc")
sha256sums=('4170bcce1b77d30a031eea5125b903eccac4d87a1a5908c496d19ada74bb0c65'
            'd3fc5f9e75db27c4e13bcc8e32528abd13b75a3b3976c258cc9e43b3f3c816b9')
validpgpkeys=('43C83369623D7AD3A96C2FC7425F128D0C64F52A') # http://I-love.SAKURA.ne.jp/kumaneko-key
noextract=("caitsith-patch-${_basever}-${_timestamp}.tar.gz")

prepare() {
  cp -a "/usr/lib/modules/${_kernver}/build" "${srcdir}"
  cd "${srcdir}/build/"
  tar -zxf "${srcdir}/caitsith-patch-${_basever}-${_timestamp}.tar.gz"
  sed -i -e 's_/sbin/init_/usr/lib/systemd/systemd_' caitsith/config.h
}

build() {
  cd "${srcdir}/build/"
  make SUBDIRS=caitsith modules
}

package() {
  cd "${srcdir}/build"
  make SUBDIRS=caitsith MODLIB="${pkgdir}/usr/lib/modules/${_kernver}/kernel/" modules_install
  sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" "${startdir}/caitsith-lkm.install"
}
