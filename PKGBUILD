# Maintainer: Kozec <kozec at kozec dot com>

pkgname='mcedit'
reponame='MCEdit-Unified'
pkgver='1.4.0.1'
pkgrel=2
pkgdesc='Minecraft world editor'
arch=('any')
url='https://github.com/mcedit/mcedit'
license='BSD'

makedepends=('cython2')
depends=('python2' 'python2-opengl' 'python2-numpy' 'python2-pygame'
         'python2-yaml' 'python2-pillow' 'python2-ftputil')
optdepends=('python2-leveldb_mcpe: for MCPE support')
conflicts=('mcedit-git' 'pymclevel-git')

source=(MCEdit MCEdit.desktop
	directories.patch
	numpy1.7-compatibility.patch
	https://github.com/Khroki/${reponame}/archive/${pkgver}.tar.gz
	)

prepare() {
	cd ${srcdir}/${reponame}-${pkgver}
	grep -rlZ python2\.7 * | while IFS= read -r -d '' filename; do sed -i '1 s/python2\.7/python\.7/' "$filename"; done
	grep -rlZ python * | while IFS= read -r -d '' filename; do sed -i '1 s/python/python2/' "$filename"; done
	grep -rlZ DejaVuSans\-Regular\.ttf * | while IFS= read -r -d '' filename; do sed -i 's/DejaVuSans\-Regular\.ttf/DejaVuSans\.ttf/g' "$filename"; done
	msg directories.patch
	patch -Np0 -i ../directories.patch || return 1
	msg numpy1.7-compatibility.patch
	patch -Np0 -i ../numpy1.7-compatibility.patch || return 1
}


build() {
	cd ${srcdir}/${reponame}-${pkgver}
	python2 config.py -auto
	python2 setup.py build_ext --inplace
}


package() {
	cd ${srcdir}/${reponame}-${pkgver}
	python2 setup.py install --prefix=/usr --root="$pkgdir/"
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/lib/mcedit"
	mkdir -p "${pkgdir}/usr/share/mcedit"
	mkdir -p "${pkgdir}/usr/share/applications"
	mkdir -p "${pkgdir}/usr/share/pixmaps"
	# Pys
	cp *.py "${pkgdir}/usr/lib/mcedit"
	cp *.pyc "${pkgdir}/usr/lib/mcedit"
	for i in albow editortools pymclevel utilities panels viewports leveldb_mcpe; do
		cp -R $i "${pkgdir}/usr/lib/mcedit/$i"
	done

	# Images and stuff
	echo "/usr/share/mcedit/splashes/splash1.png" > splash
	cp *.png "${pkgdir}/usr/share/mcedit"
	for i in stock-schematics toolicons stock-filters stock-brushes lang\
	item-textures Items splashes splash bo3.def RELEASE-VERSION.json\
	LR5_mzu.fot; do
		cp -R $i "${pkgdir}/usr/share/mcedit/$i"
	done
	ln -s "/usr/share/mcedit/favicon.png" "${pkgdir}/usr/share/pixmaps/MCEdit.png"
	
	# Launcher
	install -D -m755 "${srcdir}/MCEdit" "${pkgdir}/usr/bin/"
	install -D "${srcdir}/MCEdit.desktop" "${pkgdir}/usr/share/applications"
}

md5sums=('b08f609c8923067b13a9bd462999a6f4'
         '53fe3c41d58fd1f6429f90ba0b1831ac'
         '657f128f31d8818c2fda7e2c02a69149'
         '2a168455d07a33134b58e44bedeb6e52'
         'f89ddd094dc7819d54090d659d091e5b')
