# Maintainer: balwierz <my user name at the most popular google email service>
pkgbase=cura
pkgname=cura
pkgver=15.06.01
pkgrel=1
pkgdesc="A full software solution for 3D printing aimed at RepRaps and the Ultimaker. This package contains both the binary Cura engine and the python front-end."
depends=('python2' 'wxpython' 'python2-opengl' 'python2-pyserial' 'python2-numpy' 'python2-power-git')
provides=('cura')
#replaces=('cura')
#conflicts=('cura')
url="https://github.com/daid/Cura"
license=('AGPLv3')
arch=('x86_64')
if [ "$CARCH" == x86_64 ]; then
	source+=(http://software.ultimaker.com/15.06/Cura-${pkgver}-Linux.deb)
	sha1sums+=('51f46906e7c0ea51941198bd66bbf29cbdb09af2')
#elif [ "$CARCH" == i686 ]; then
#	source+=(http://software.ultimaker.com/current/cura_${pkgver}-debian_i386.deb)
#	sha1sums+=('e18e5bd4bd72e2af8d97102aea5ecaaf4e93e856')
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


