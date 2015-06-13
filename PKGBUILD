# Maintainer: (epsilom) Xavier Corredor <xavier.corredor.llano (a) gmail.com>
pkgname=jaziku-devel
_pkgname=jaziku
pkgver=1.0.0
pkgrel=1
pkgdesc="Jaziku is statistical inference software for the teleconnections analysis"
url="http://hg.ideam.gov.co:8000/meteorologia/jaziku/summary"
arch=('i686' 'x86_64')
license=('GPLv3')
depends=('python2' 'python2-distribute' 'python2-scipy' 'python2-dateutil' 'python2-matplotlib' 'python2-numpy' 'python2-pillow' 'python2-clint' 'imagemagick' 'hpgl' 'ncl' 'dos2unix')
#makedepends=('python2-distribute')
source=("https://docs.google.com/uc?id=0B2KQf7Dbx7DUakRMcEM3WUstMFE&export=download")
md5sums=('2c33714ec0494b8a2624c0d00f0add16')

build() {
	cd ${srcdir}/$_pkgname-$pkgver
	cd bin
	mv jaziku jaziku_devel
	mv sisdhim2jaziku sisdhim2jaziku_devel
	mv cpt2jaziku cpt2jaziku_devel
	mv normalize_format normalize_format_devel
	
	sed -i 's/from jaziku/from jaziku_devel/g' jaziku_devel
	sed -i 's/from jaziku/from jaziku_devel/g' sisdhim2jaziku_devel
	sed -i 's/from jaziku/from jaziku_devel/g' cpt2jaziku_devel
	sed -i 's/from jaziku/from jaziku_devel/g' normalize_format_devel
	
	cd ..
	find . -iname '*.py' | xargs sed -i 's/from jaziku/from jaziku_devel/g'
    mv jaziku jaziku_devel
    sed -i 's|"jaziku"|"jaziku_devel"|g' jaziku_devel/env/globals_vars.py
    
	sed -i 's|bin/jaziku|bin/jaziku_devel|g' setup.py
	sed -i 's|bin/sisdhim2jaziku|bin/sisdhim2jaziku_devel|g' setup.py
	sed -i 's|bin/cpt2jaziku|bin/cpt2jaziku_devel|g' setup.py
	sed -i 's|bin/normalize_format|bin/normalize_format_devel|g' setup.py

	sed -i 's|jaziku/|jaziku_devel/|g' MANIFEST.in
	python2 ./setup.py build || return 1
}

package(){
	cd ${srcdir}/$_pkgname-$pkgver
	python2 ./setup.py install --root=$pkgdir || return 1
}
