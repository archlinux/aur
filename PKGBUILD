# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Mathias Walters <waltersm@protonmail.com>

pkgname=maptool
_pkgname=MapTool
pkgver=1.14.3
pkgrel=1
pkgdesc="An open source virtual tabletop program"
arch=('x86_64')
url='https://rptools.net/tools/maptool'
license=('AGPL3')
depends=('java-runtime=21' 'java-openjfx=21')
makedepends=('git' 'dpkg' 'java-environment=21' 'gradle' 'xdg-utils' 'rpm-tools')
optdepends=()
source=(
	"git+https://github.com/RPTools/${pkgname}.git#tag=${pkgver}"
	"${pkgname}.sh")
sha256sums=('SKIP'
            '746ab40aa2226355f33135eb748bdc4c5653c8239574683b508510e0a0becf0a')
install="${pkgname}.install"

_prefix="opt/$pkgname"
_java_home='/usr/lib/jvm/java-21-openjdk'

prepare() {
	cd "${pkgname}"
	sed -i -r "s|jdkHome = jdkDownload.+$|jdkHome = \"$_java_home\"|" 'build.gradle'
}

build() {
	cd "${pkgname}"
	export JAVA_HOME="$_java_home"
	export PATH="$_java_home/bin:$PATH"
	gradle --no-daemon --parallel jpackage -x spotlessJavaCheck
}

check() {
	cd "${pkgname}"
	export JAVA_HOME="$_java_home"
	export PATH="$_java_home/bin:$PATH"
	gradle --no-daemon --parallel check
}

package() {
	cd "${pkgdir}"
	
	dpkg-deb -x "${srcdir}/${pkgname}/releases/"*.deb .
	
	install -dm755 "usr/share/java/${pkgname}"
	rm "${_prefix}/lib/app"/javafx*.jar
	mv "${_prefix}/lib/app"/*.jar "usr/share/java/${pkgname}"
	mv "${_prefix}/lib/"*.xml "usr/share/java/${pkgname}/${pkgname}-mimeinfo.xml"
	
	install -dm755 'usr/share/pixmaps'
	mv "${_prefix}/lib/"*.png "usr/share/pixmaps/${pkgname}.png"
	
	install -dm755 'usr/share/applications'
	mv "${pkgdir}/${_prefix}/lib/"*.desktop "usr/share/applications/${pkgname}.desktop"
	sed -i 's|Exec=/opt/maptool/bin/MapTool|Exec=/usr/bin/maptool|' "usr/share/applications/${pkgname}.desktop"
	sed -i -E 's|Icon=.*|Icon=maptool|' "usr/share/applications/${pkgname}.desktop"
	
	install -Dm755 "${srcdir}/${pkgname}.sh" "usr/bin/${pkgname}"
	
	rm -rf "${_prefix}"
}
