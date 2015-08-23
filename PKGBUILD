# Maintainer: Kozec <kozec at kozec dot com>

pkgname='mcedit'
pkgver='0.1.8build799'
pkgrel=1
pkgdesc='Minecraft world editor'
arch=('any')
url='https://github.com/mcedit/mcedit'
license='BSD'

depends=('python2' 'python2-numpy' 'python2-opengl' 
	'python2-pygame' 'ttf-bitstream-vera' "pymclevel>=$pkgver")
conflicts=('mcedit-git' 'pymclevel-git')

source=(MCEdit MCEdit.desktop
	directories.patch
	disable-portable-mode.patch
	numpy1.7-compatibility.patch
	filters-in-home.patch
	https://github.com/mcedit/mcedit/archive/${pkgver}.tar.gz
	)

build() {
	cd ${srcdir}/${pkgname}-${pkgver}
	
	# Provided setup.py depends on something weird, but I'm not even
	# going to bother.
	
	msg directories.patch
	patch -Np0 -i ../directories.patch || return 1
	msg disable-portable-mode.patch
	patch -Np0 -i ../disable-portable-mode.patch || return 1
	msg numpy1.7-compatibility.patch
	patch -Np1 -i ../numpy1.7-compatibility.patch || return 1
	msg filters-in-home.patch
	patch -Np0 -i ../filters-in-home.patch || return 1
}


package() {
	cd ${srcdir}/${pkgname}-${pkgver}
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/lib/mcedit"
	mkdir -p "${pkgdir}/usr/share/mcedit"
	mkdir -p "${pkgdir}/usr/share/applications"
	mkdir -p "${pkgdir}/usr/share/pixmaps"
	# Pys
	cp *.py "${pkgdir}/usr/lib/mcedit"
	for i in albow editortools ; do
		cp -R $i "${pkgdir}/usr/lib/mcedit/$i"
	done
	# Images and stuff
	cp *.png "${pkgdir}/usr/share/mcedit"
	for i in stock-schematics toolicons filters; do
		cp -R $i "${pkgdir}/usr/share/mcedit/$i"
	done
	ln -s "/usr/share/mcedit/favicon.png" "${pkgdir}/usr/share/pixmaps/MCEdit.png"
	
	# Launcher
	install -D -m755 "${srcdir}/MCEdit" "${pkgdir}/usr/bin/"
	install -D "${srcdir}/MCEdit.desktop" "${pkgdir}/usr/share/applications"
}

md5sums=('b9de4195ddf84d85c0170e816ec0659e'
         'e598244d2770ee075d397d6c11dc140d'
         '732f8e3faa3806a9fcdf8697b9d8d5d8'
         'b8b5e679ed9bbf9f6a0e489599d2c587'
         'a4f4e6645e0f00898fed0830127c727f'
         '5f84a8bf43e385e16f476fbd8ee4dc51'
         '8745d3b8bb4765755d2c31e539f6476d')
