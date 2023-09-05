# Maintainer: Alexander Aleschenko <alex.aleschenko@gmail.com>

pkgname=emu80-qt
pkgver=4.0.444
pkgrel=1
pkgdesc="Emulator for bunch of Soviet PCs"
arch=('x86_64')
url="https://emu80.org/"
license=("GPL3")
depends=("qt5-base")
source=("https://github.com/vpyk/emu80v4/archive/refs/tags/v${pkgver}.tar.gz" "cstdint.patch" "shortcut.desktop")
sha256sums=("f3a9488242804b4d5e39d6c63b2cba7abff9723d831f66f342c5c0de574a8c37" "a32506b1ac786a058044e178961456c4bdee0eec87f81b679deb25c0fb7e2bab" "bd817f4c7a0183e322fb25fa27160f5279ac0310ea8445a86edd9c944b43e839")

prepare() {
	cd ${srcdir}/emu80v4-${pkgver}
	dos2unix src/Cpu8080dasm.cpp
	dos2unix src/EmuObjects.h
	dos2unix src/EmuTypes.h
	patch --forward --strip=1 --input="${srcdir}/cstdint.patch"
	unix2dos src/EmuObjects.h
	unix2dos src/Cpu8080dasm.cpp
	unix2dos src/EmuTypes.h
}

build() {
	cd "emu80v4-${pkgver}"
	qmake src/Emu80qt.pro
	make
}

package() {
	cd "emu80v4-${pkgver}"
	destination=${pkgdir}/opt/${pkgname}

	install -d -m755 ${destination}
	cp -r dist/* ${destination}
	cp COPYING.txt ${destination}
	cp whatsnew.txt ${destination}
	cp doc/* ${destination}
	install -m0755 Emu80qt ${destination}/${pkgname}

	install -d -m755 ${pkgdir}/usr/bin
	ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
	install -D -m644 "${srcdir}/shortcut.desktop" "${pkgdir}/usr/share/applications/emu80-qt.desktop"
	install -D -m644 "src/qt/icons/emu80.png" "${pkgdir}/usr/share/pixmaps/emu80.png"
}
