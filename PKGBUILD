# Maintainer: thegala <thegala at disroot.org>
# Git repo is not in source because i can't add command line options to git
# in PKGBUILD
# I can't provide this in PKGBUILD
# Read this
#https://unix.stackexchange.com/questions/154919/how-to-modify-a-pkgbuild-which-uses-git-sources-to-pull-only-a-shallow-clone
# https://unix.stackexchange.com/questions/373207/how-to-pass-arguments-to-git-from-pkgbuild
# Also you can fis this problem with adding new dlagent in makgepkg.conf


_pkgname=freerouting
pkgname=${_pkgname}-git
pkgver=20170512.d61df24
pkgrel=1
pkgdesc="A printed circuit board routing software"
arch=('any')
url="http://www.freerouting.eu/"
license=('GPL')
depends=('jdk8-openjdk')
makedepends=('git')
source=('freeroute')
sha256sums=('bd4f5cf7968a03212463a4f7a051a263b6f0e593e4ee188bdd2b44b696d1c8cb')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    git log -1 --format='%cd.%h' --date=short | tr -d -
}
                    
prepare() {
    cd "${srcdir}"
    \rm -fr "${srcdir}/${_pkgname}"
    git clone --depth=1 https://github.com/Engidea/FreeRoutingNew.git ${_pkgname}
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
