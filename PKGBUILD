pkgname=caitsith-lkm
_basever=0.1
_timestamp=20160214
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
source=("http://sourceforge.jp/frs/redir.php?m=jaist&f=/caitsith/55464/caitsith-patch-${_basever}-${_timestamp}.tar.gz"
	"http://sourceforge.jp/frs/redir.php?m=jaist&f=/caitsith/55464/caitsith-patch-${_basever}-${_timestamp}.tar.gz.asc")
sha256sums=('5fa641d6681321a38c7f7c0f363ec4ea4db6d9870114d47a58e1ec0e256d848d'
	'bde46fd448566997929ece6082654c47eb4fb55e5a042a3c952cc72931a71210')
validpgpkeys=('43C83369623D7AD3A96C2FC7425F128D0C64F52A') # http://I-love.SAKURA.ne.jp/kumaneko-key
noextract=("caitsith-patch-${_basever}-${_timestamp}.tar.gz")

build() {
  cp -a "/usr/lib/modules/${_kernver}/build" "${srcdir}"
  cd "${srcdir}/build/"
  tar -xf "${srcdir}/caitsith-patch-${_basever}-${_timestamp}.tar.gz"
  make SUBDIRS=caitsith SYSSRC=/lib/modules/${_kernver}/build modules || return 1
}

package() {
  install -D -m644 "${srcdir}/build/caitsith/caitsith.ko" "${pkgdir}/usr/lib/modules/${_kernver}/kernel/extra/caitsith.ko"
  install -D -m644 "${srcdir}/build/caitsith/caitsith_test.ko" "${pkgdir}/usr/lib/modules/${_kernver}/kernel/extra/caitsith_test.ko"

  sed -i -e "s/KERNEL_VERSION='.*'/KERNEL_VERSION='${_kernver}'/" "${startdir}/caitsith-lkm.install" || return 1
}
