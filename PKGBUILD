# Maintainer: copygirl <copygirl@mcft.net>
_pkgname=vsmodelcreator
pkgname=${_pkgname}-git
pkgver=r223.3327409
pkgrel=1
pkgdesc="Vintage Story Model Creator"
arch=('any')
url="https://github.com/anegostudios/vsmodelcreator"
license=('Apache')
depends=('java-runtime>=8')
makedepends=('git' 'java-environment>=8')
options=()
source=("${_pkgname}::git://github.com/anegostudios/vsmodelcreator.git"
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
	javac -cp 'libs/*' -d bin $(find src -name "*.java")
	# Create a .jar file
	jar cfe "${_pkgname}.jar" at.vintagestory.modelcreator.Start -C bin . -C assets .
	# (Specifying the main entry class here, but
	#  not actually using it in the launch script.)
}

package() {
	cd "${_pkgname}"
	mkdir -p "${pkgdir}/usr/share/java/${_pkgname}"
	# Copy executable and library .jar files
	cp --parents vsmodelcreator.jar "${pkgdir}/usr/share/java/${_pkgname}/"
	cp --parents libs/* "${pkgdir}/usr/share/java/${_pkgname}/"
	# Copy native libraries
	cp --parents natives/linux/* "${pkgdir}/usr/share/java/${_pkgname}/"
	# TODO: See if we can depend on other packages that provide our dependencies.
	
	cd ".."
	mkdir -p ${pkgdir}/usr/{bin,share/{applications,pixmaps}}
	# Copy launcher .sh file
	cp "${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
	# Copy .desktop file and icon
	cp "${_pkgname}.desktop" "${pkgdir}/usr/share/applications"
	cp "${_pkgname}/assets/appicon.ico" "${pkgdir}/usr/share/pixmaps/vsmodelcreator.ico"
}
