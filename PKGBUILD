# Maintainer: thegala <gala at openaliasbox.org>

_pkgname=freerouting
pkgname=${_pkgname}-git
pkgver=20161125.d1459bd
pkgrel=1
pkgdesc="A printed circuit board routing software"
arch=('any')
url="http://www.freerouting.eu/"
license=('GPL')
depends=('jdk7-openjdk' 'javahelp2' 'icedtea-web')
makedepends=('git')
source=('freeroute'
		"${_pkgname}::git+https://github.com/Engidea/FreeRoutingNew.git")
sha256sums=('bd4f5cf7968a03212463a4f7a051a263b6f0e593e4ee188bdd2b44b696d1c8cb'
			'SKIP')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git log -1 --format='%cd.%h' --date=short | tr -d -
}
                    

build() {
	cd "${srcdir}/${_pkgname}"
	 if javac -classpath /usr/share/java/javahelp/jh.jar:/usr/share/icedtea-web/netx.jar:"${srcdir}/${_pkgname}/jarlibs/bsh-20b4.jar":"${srcdir}/${_pkgname}/jarlibs/jhall-2.0_05.jar" \
        `find -type f -name "*.java"`
	 then jar cfe FreeRouting.jar gui.MainApplication \
	      `find -type f \( -name "*.class" -o -name "*.properties" \)`
	 else echo "*** Some .java file was not compiled. See above" 1>&2
	      exit 1
	 fi
}

package() {
	install -Dm644 "${srcdir}/${_pkgname}/deploy/FreeRouting.jar" "${pkgdir}/usr/share/java/freerouting/freeroute.jar"
	install -Dm644 "${srcdir}/${_pkgname}/jarlibs/bsh-20b4.jar" "${pkgdir}/usr/share/java/freerouting/jarlibs/bsh-20b4.jar"
    install -Dm644 "${srcdir}/${_pkgname}/jarlibs/jhall-2.0_05.jar" "${pkgdir}/usr/share/java/freerouting/jarlibs/jhall-2.0_05.jar"
	install -Dm755 "${srcdir}/freeroute" "${pkgdir}/usr/bin/freeroute"
	# Allows Kicad to detect freerouting
	ln -s "/usr/share/java/freerouting/freeroute.jar" "${pkgdir}/usr/bin/freeroute.jar"
}
