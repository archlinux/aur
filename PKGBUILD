# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>
pkgname=comodo-modules
pkgver=20150307_4.1.2_2
pkgrel=1
pkgdesc="Modules for Comodo Antivirus for providing realtime protection"
arch=('i686' 'x86_64')
url="http://www.bondoffamily-net.com/~kinta-chan"
license=('GPL3')
depends=('linux>=4.1' 'linux<4.2' 'comodo')
makedepends=('linux-headers>=4.1' 'linux-headers<4.2')
install=comodo-modules.install
_date=20150307
source=("driver-${_date}.tar::${url}/techknow/DownLoad/redirfs/beta/driver.tar")
md5sums=('bdf595fdb2493def6e6e128f96b83916')

pkgver() {
  _ver=$(pacman -Q linux | cut -d " " -f 2)
  echo ${_date}_${_ver/-/_}
}

prepare() {
	cd "$srcdir/driver"

  # make sure we build for the installed kernel, not the booted one
  _ver=$(pacman -Q linux | cut -d " " -f 2)
  _kernel=$_ver-ARCH
  sed -i "s:\`uname -r\`:${_kernel}:g" Makefile
}

build() {
	cd "$srcdir/driver"
	ROOT_PATH="$srcdir/driver" make all
}

package() {
	cd "$srcdir/driver"
	ROOT_PATH="$srcdir/driver" make INSTALL_MOD_PATH="$pkgdir/usr" install

  # fix .install file
  sed -i "s:KERNEL=.*:KERNEL=${_kernel}:" "${startdir}/comodo-modules.install"
}
