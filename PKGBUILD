# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Mathias Walters <waltersm@protonmail.com>

pkgname=maptool
_pkgname=MapTool
pkgver=1.13.2
pkgrel=1
pkgdesc="An open source virtual tabletop program"
arch=('x86_64')
url="https://rptools.net/tools/maptool"
license=('AGPL3')
depends=('java-runtime>=16')
makedepends=('git' 'dpkg' 'jdk19-openjdk' 'gradle7' 'xdg-utils' 'rpm-tools')
optdepends=()
source=("git+https://github.com/RPTools/${pkgname}.git#tag=${pkgver}")
sha256sums=('SKIP')
install='maptool.install'

_prefix="/opt/$pkgname"
_java_home='/usr/lib/jvm/java-19-openjdk'

prepare() {
	cd "${pkgname}"
	sed -i -r "s|jdkHome = jdkDownload.+$|jdkHome = \"$_java_home\"|" 'build.gradle'
}

build() {
	cd "${pkgname}"
	export JAVA_HOME="$_java_home"
	export PATH="$_java_home/bin:$PATH"
	gradle7 -Dorg.gradle.daemon=false --parallel jpackage
}

check() {
	cd "${pkgname}"
	export JAVA_HOME="$_java_home"
	export PATH="$_java_home/bin:$PATH"
	gradle7 -Dorg.gradle.daemon=false --parallel check
}

package() {
	cd "${pkgdir}"
	
	dpkg-deb -x "${srcdir}/${pkgname}/releases/"*.deb .
	mkdir -p "usr/share/licenses/${pkgname}"
	mv "${pkgdir}/${_prefix}/share/doc/copyright" "usr/share/licenses/${pkgname}/"
	rm -rf "${pkgdir}/${_prefix}/share"
	
	#rpmextract.sh "${srcdir}/${pkgname}/releases/"*.rpm
	#mv "usr/share/licenses/maptool-${pkgver}" "usr/share/licenses/${pkgname}"
	
	install -dm755 'usr/share/applications'
	mv "${pkgdir}/${_prefix}/lib/${pkgname}-${_pkgname}.desktop" "usr/share/applications/${pkgname}.desktop"
	sed -i 's|Exec=/opt/maptool/bin/MapTool|Exec=/usr/bin/MapTool|' "usr/share/applications/${pkgname}.desktop"
	
	mkdir -p 'usr/bin'
	ln -s "${_prefix}/bin/MapTool" "usr/bin/MapTool"
}
