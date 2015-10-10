_dkmsname='psmouse-alpsv7'
_patchver='20140319'
_linuxver='3.16'
pkgname="${_dkmsname}-dkms"
pkgver=${_patchver}
pkgrel=4
pkgdesc='psmouse kernel module with support for alpsv7 touchpad'
arch='any'
url='http://permalink.gmane.org/gmane.linux.kernel.input/35013'
license=('GPL2')
depends=('dkms')
makedepends=('linux-headers')
options=('!strip')
install=INSTALL

source=(
	'alps-v7.patch'
	'dkms.conf'
	"https://www.kernel.org/pub/linux/kernel/v3.x/linux-${_linuxver}.tar.xz"
)

package() {
	# set correct values in install script
	sed -e "s/MNAME=.*/MNAME=${_dkmsname}/" -i "${startdir}/INSTALL"
	sed -e "s/MVER=.*/MVER=${_patchver}/" -i "${startdir}/INSTALL"
	sed -e "s/PACKAGE_NAME=.*/PACKAGE_NAME=${_dkmsname}/" -i "${startdir}/dkms.conf"
	sed -e "s/PACKAGE_VERSION=.*/PACKAGE_VERSION=${_patchver}/" -i "${startdir}/dkms.conf"

	cd "${srcdir}/linux-${_linuxver}"
	patch -p1 < "${srcdir}/alps-v7.patch"

	mkdir -p ${pkgdir}/usr/src/${_dkmsname}-${_patchver}/src
	cp ${srcdir}/linux-${_linuxver}/drivers/input/mouse/* ${pkgdir}/usr/src/${_dkmsname}-${_patchver}/src/
	cp ${srcdir}/dkms.conf ${pkgdir}/usr/src/${_dkmsname}-${_patchver}/
}

md5sums=('c3b68160d3cfd329f3806cdc0bdd580d'
         '2dec54975446412e7cf5cb621757a493'
         '5c569ed649a0c9711879f333e90c5386')
