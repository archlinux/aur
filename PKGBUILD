pkgname=caitsith-lkm
_basever=0.1
_timestamp=20150806
pkgver=${_basever}_${_timestamp}
_kernver=$(uname -r)
pkgrel=1
pkgdesc='CaitSith LKM-based LSM version'
arch=('i686' 'x86_64')
url='http://caitsith.sourceforge.jp/'
license=('GPL')
depends=('linux' 'ncurses')
makedepends=('linux-headers')
optdepends=('caitsith-tools')
install=caitsith-lkm.install
source=("http://sourceforge.jp/frs/redir.php?m=jaist&f=/caitsith/55464/caitsith-patch-${_basever}-${_timestamp}.tar.gz"
	"http://sourceforge.jp/frs/redir.php?m=jaist&f=/caitsith/55464/caitsith-patch-${_basever}-${_timestamp}.tar.gz.asc")
sha256sums=('817dc931d98b99db83de45e198ba780d59135467ae94e3adfa5ceafa3943a1cf'
	'865a3230a8d5dafb01bef4b3d7780a8655c93e1e6626a87f172495349a0a36eb')
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
