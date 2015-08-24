# Maintainer: Grey Christoforo <my first name [at] my last name [dot] net>

pkgname=cura
pkgver=15.06.03
pkgrel=1
pkgdesc="A software solution for 3D printing aimed at RepRaps and the Ultimaker."
depends=('qt5-svg' 'python-pyserial' 'python-numpy' 'uranium' 'curaengine')
makedepends=('qt5-tools')
provides=('cura')
url="https://ultimaker.com/en/products/cura-software"
license=('AGPLv3')
arch=('i686' 'x86_64')
source=(https://github.com/Ultimaker/Cura/archive/${pkgver}.tar.gz site-packages-dir.patch)
sha1sums=('d03d3e86fd40de6e791301b696c8c53ae288faa7'
          'a1a21f761ababccf366ce100c536b21e83c69fb9')

#install=cura.install

prepare(){
  cd Cura-${pkgver}
  patch -Np1 -i ../site-packages-dir.patch
}

build(){
  cd Cura-${pkgver}
  cmake ./ -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release -DURANIUM_SCRIPTS_DIR=/usr/share/uranium/scripts
  make
}

package(){
  cd Cura-${pkgver}
  #python setup.py install --root="$pkgdir/" --optimize=1
  make DESTDIR="${pkgdir}" install
	# remove python-power since we have it in the deps:
	#rm -rf "${srcdir}"/usr/share/cura/power/
	
	# change python to python2 everywhere:
	#sed -i 's|\/usr\/bin\/python|\/usr\/bin\/python2|' "${srcdir}"/usr/share/applications/cura.desktop "${srcdir}"/usr/share/cura/cura.py "${srcdir}"/usr/bin/cura
	
	# add a new line (pedantic):
	#echo >> "${srcdir}/usr/bin/cura"
	
	# add the path since we need to call slicer exactly from /usr/share/cura
	#sed -i '6 i os.chdir("/usr/share/cura")' "${srcdir}"/usr/share/cura/cura.py
	#sed -i 's|os.path.dirname(__file__)|"/usr/share/cura"|' "${srcdir}"/usr/share/cura/cura.py
	
	#cp -r "${srcdir}"/usr "${pkgdir}"/usr
	
}


