# Maintainer: copygirl <copygirl@mcft.net>
_pkgname=vsmodelcreator
pkgname=${_pkgname}-git
pkgver=r225.75c385c
pkgrel=1
pkgdesc="Vintage Story Model Creator"
arch=("any")
url="https://github.com/anegostudios/vsmodelcreator"
license=("Apache")
depends=("java-runtime>=8")
makedepends=("git" "java-environment>=8")
options=()
source=("git://github.com/anegostudios/vsmodelcreator.git"
        "vsmodelcreator.desktop"
        "vsmodelcreator.sh")
md5sums=("SKIP"
         "93ebcec3e1e896caf3685171c1d74df4"
         "c73547c2875d92655e67ed75fd98dd85")

pkgver() {
	cd "${_pkgname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${_pkgname}"
	# Build the application
	mkdir -p bin
	javac -cp "libs/*" -d bin $(find src -name "*.java")
	# Create a .jar file
	jar cfe ${_pkgname}.jar "at.vintagestory.modelcreator.Start" -C bin . -C assets .
	# (Specifying the main entry class here, but
	#  not actually using it in the launch script.)
}

package() {
	cd ${_pkgname}
	# Create directory structure for application in /usr/share/java/vsmodelcreator
	install -dm 755 ${pkgdir}/usr/share/java/${_pkgname}/{,libs,natives/linux}
	# Copies .jar file, libs and native libraries
	install -Dm 755 vsmodelcreator.jar ${pkgdir}/usr/share/java/${_pkgname}/
	install -Dm 644 libs/* ${pkgdir}/usr/share/java/${_pkgname}/libs/
	install -Dm 644 natives/linux/* ${pkgdir}/usr/share/java/${_pkgname}/natives/linux/
	# TODO: See if we can depend on other packages that provide our native dependencies.
	
	cd ${srcdir}
	# Create directory structure for launchers
	install -dm 755 ${pkgdir}/usr/{bin,share/{pixmaps,applications}}
	# Copy console launcher .sh
	install -Dm 755 ${_pkgname}.sh ${pkgdir}/usr/bin/${_pkgname}
	# Copy application icon and .desktop launcher file
	install -Dm 644 ${_pkgname}/assets/appicon.ico ${pkgdir}/usr/share/pixmaps/${_pkgname}.ico
	install -Dm 644 ${_pkgname}.desktop ${pkgdir}/usr/share/applications/
}
