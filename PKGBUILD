# Maintainer: balwierz <my user name at the most popular google email service>
pkgbase=cura
pkgname=cura
pkgver=15.04
pkgrel=1
pkgdesc="A full software solution for 3D printing aimed at RepRaps and the Ultimaker."
depends=('python2' 'wxpython' 'python2-opengl' 'python2-pyserial' 'python2-numpy' 'python2-power-git')
provides=('cura')
url="https://github.com/daid/Cura"
license=('AGPLv3')
arch=('i686' 'x86_64')
if [ "$CARCH" == x86_64 ]; then
	source+=(http://software.ultimaker.com/current/cura_${pkgver}-debian_amd64.deb)
	sha1sums+=('16ebec62f0811a2cc1d7562b5d7d5bdd35f9ea54')
elif [ "$CARCH" == i686 ]; then
	source+=(http://software.ultimaker.com/current/cura_${pkgver}-debian_i386.deb)
	sha1sums+=('e18e5bd4bd72e2af8d97102aea5ecaaf4e93e856')
fi

install=.install

build()
{
	cd "${srcdir}"
	
	# unpack
	tar --xz -xf data.tar.xz
}

package()
{
	# remove python-power since we have it in the deps:
	rm -rf "${srcdir}"/usr/share/cura/power/
	
	# change python to python2 everywhere:
	sed -i 's|\/usr\/bin\/python|\/usr\/bin\/python2|' "${srcdir}"/usr/share/applications/cura.desktop "${srcdir}"/usr/share/cura/cura.py "${srcdir}"/usr/bin/cura
	
	# add a new line (pedantic):
	echo >> "${srcdir}/usr/bin/cura"
	
	# add the path since we need to call slicer exactly from /usr/share/cura
	sed -i '6 i os.chdir("/usr/share/cura")' "${srcdir}"/usr/share/cura/cura.py
	sed -i 's|os.path.dirname(__file__)|"/usr/share/cura"|' "${srcdir}"/usr/share/cura/cura.py
	
	cp -r "${srcdir}"/usr "${pkgdir}"/usr
	
}


