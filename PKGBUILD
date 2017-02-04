# Maintainer: Pavel Lymarev <x-user at bk dot ru>
# Contributor: Jameson Pugh <imntreal@gmail.com>
# Contributor: Rene Schoebel (wesley) <schoebel.r at gmail dot com>

pkgname=openjk-git
pkgver=3479.7b5f79ad
pkgrel=1
pkgdesc="Open Source Jedi Knight II + III Engine"
arch=('i686' 'x86_64')
url="https://github.com/JACoders/OpenJK"
license=('GPL')
depends=('libgl' 'openal' 'zlib' 'sdl2' 'libjpeg' 'glu')
optdepends=('libpng')
makedepends=('cmake' 'yasm' 'git')
provides=(openjk)
conflicts=(openjk)
source=("openjk::git+https://github.com/JACoders/OpenJK.git"
		'openjkmp.png'
		'openjksp.png'
		'openjkmp.desktop'
		'openjksp.desktop')
sha256sums=('SKIP'
            '0e82e720777eeb2043c2c25cdbce702c6d4ca077543aedfe51e5c4e96cf03969'
            'afb2c1a757720c70798e7f7218f823297a43bc61e0cb192e9443df67c2963903'
            'd3ad7dd270e57d36a22caef21bff17f2eb4acb0ad9087f6a17ca4a0bf9c566fc'
            'd03554bd926954218c243a1a97d39ea9700d064a2374f671249a533ebd970375')

_jkarch=i386
[ "$CARCH" == "x86_64" ] && {
        _jkarch=x86_64
}

pkgver() {
	cd openjk
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
	cd "${srcdir}/openjk"

	mkdir -p build
	cd build
	cmake ../ \
		-DCMAKE_BUILD_TYPE=Release \
		-DCMAKE_INSTALL_PREFIX=/opt/${pkgname} \
		-DCMAKE_SIZEOF_VOID_P=4
	make
}

package() {
	cd "${srcdir}/openjk/build"

	make DESTDIR="${pkgdir}" install

	mkdir -p "${pkgdir}/usr/bin"
	cat > ${pkgdir}/usr/bin/openjk << EOF
#!/bin/bash
cd /opt/${pkgname}/JediAcademy
exec ./openjk.${_jkarch} $@
EOF
	chmod +x ${pkgdir}/usr/bin/openjk
	cat > ${pkgdir}/usr/bin/openjk_sp << EOF
#!/bin/bash
cd /opt/${pkgname}/JediAcademy
exec ./openjk_sp.${_jkarch} \$@
EOF
	chmod +x ${pkgdir}/usr/bin/openjk_sp
	cat > ${pkgdir}/usr/bin/openjkded << EOF
#!/bin/bash
cd /opt/${pkgname}/JediAcademy
exec ./openjkded.${_jkarch} \$@
EOF
	chmod +x ${pkgdir}/usr/bin/openjkded

	install -Dm755 "${srcdir}/openjkmp.png" "${pkgdir}/usr/share/pixmaps/openjkmp.png"
	install -Dm755 "${srcdir}/openjksp.png" "${pkgdir}/usr/share/pixmaps/openjksp.png"
	install -Dm755 "${srcdir}/openjkmp.desktop" "${pkgdir}/usr/share/applications/openjkmp.desktop"
	install -Dm755 "${srcdir}/openjksp.desktop" "${pkgdir}/usr/share/applications/openjksp.desktop"
}
