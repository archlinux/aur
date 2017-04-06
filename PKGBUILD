# Maintainer: Joshua Hardy <joshinsilico@gmail.com>
pkgname=emspring
pkgver=0.84
pkgrel=1
pkgdesc="Single Particle Reconstruction from Images of kNown Geometry"
arch=(x86_64)
url="http://www.sachse.embl.de/emspring/"
license=('GPL')
depends=('python2-pip' 'libpng12' 'tcsh' 'qtwebkit' 'glu' 'java-environment')
source=("http://www.sachse.embl.de/emspring/_download/spring-latest-linux.tar.gz" "emspring.sh" "emspring.csh")
md5sums=('SKIP' 'SKIP' 'SKIP')
options=()

prepare() {
echo "----------------------------------------------------------"
echo "If you find Spring useful for your research, please cite:"
echo "Desfosses, A., Ciuffa, R., Gutsche, I., and Sachse, C. (2014). SPRING - an image processing package for single-particle based helical reconstruction from electron cryomicrographs. J Struct Biol 185, 15-26."
echo "----------------------------------------------------------"
}
build() {
cd ${srcdir}/spring_*
ln -s /usr/lib/libncursesw.so.6 parts/EMAN2/lib/libncursesw.so.5
#sh patches/binary_install_linux.sh
cd patches; wget https://bootstrap.pypa.io/get-pip.py; cd ..
PYTHONPATH=$PWD/lib/python2.7/site-packages LD_LIBRARY_PATH=$PWD/parts/EMAN2/lib ./parts/EMAN2/Python/bin/python patches/get-pip.py
PYTHONPATH=$PWD/lib/python2.7/site-packages LD_LIBRARY_PATH=$PWD/parts/EMAN2/lib ./parts/EMAN2/Python/bin/pip  install -U --prefix=$PWD appdirs packaging
sh patches/binary_install_linux.sh
}
package() {
	cd ${srcdir}/spring_*
	install -d $pkgdir/opt/emspring $pkgdir/etc/profile.d/ $pkgdir/usr/lib
	cp -r * $pkgdir/opt/emspring/.
	install -D -m755 $srcdir/emspring*sh $pkgdir/etc/profile.d/.
	ln -s /usr/lib/libncursesw.so.6 $pkgdir/usr/lib/libncursesw.so.5
}
