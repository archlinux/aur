#Maintainer: David Becker <dasmau89@gmail.com>
pkgname=freegemas
pkgver=1.0
pkgrel=1
pkgdesc="An open source version of the well known Bejeweled, for GNU/Linux and Windows. It's written in C++ using SDL2"
arch=("any")
url="https://github.com/JoseTomasTocino/freegemas"
license=('GPL2')
depends=("sdl2" "sdl2_image" "sdl2_mixer" "sdl2_ttf")
makedepends=("git" "cmake")

source=("git+https://github.com/JoseTomasTocino/freegemas.git")
sha256sums=("SKIP")
_builddir="build"
build(){
	cd ${srcdir}/${pkgname}
	mkdir ${_builddir} && cd ${_builddir}
	cmake ..
	make
}
package() {
	cd ${srcdir}/${pkgname}
    
	mkdir -p ${pkgdir}/opt
    mkdir -p ${pkgdir}/opt/${pkgname}
	install -D -m755 ${_builddir}/${pkgname} ${pkgdir}/opt/${pkgname}/${pkgname} || return 1
    
	mv media ${pkgdir}/opt/${pkgname}/ || return 1

	cat > ${pkgdir}/opt/${pkgname}/${pkgname}.sh << EOF
#!/bin/sh
cd /opt/${pkgname}
./${pkgname}
EOF
	chmod +x  ${pkgdir}/opt/${pkgname}/${pkgname}.sh
    mkdir -p ${pkgdir}/usr/bin
    ln -s ${pkgdir}/opt/${pkgname}/${pkgname}.sh ${pkgdir}/usr/bin/${pkgname}
}
