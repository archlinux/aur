# Maintainer: Patrick Northon <northon_patrick3@yahoo.ca>
# Contributor: Mathias Walters <waltersm@protonmail.com>

pkgname=maptool
_pkgname=MapTool
pkgver=1.18.5
pkgrel=1
pkgdesc="An open source virtual tabletop program"
arch=('any')
url='https://rptools.net/tools/maptool'
license=('AGPL-3.0-or-later')
depends=()
_java_ver=24
makedepends=('git' 'dpkg' "java-environment-openjdk=$_java_ver" 'gradle8' 'xdg-utils' 'rpm-tools')
source=(
	"git+https://github.com/RPTools/${pkgname}.git#tag=${pkgver}"
	"${pkgname}.sh")
sha256sums=('ef89f6a5d629f3ce3c6f789e527fd8aca1e607d4e2a9f2512265245e287615ca'
            '16720b6f986f79eed2a9517433a6c0880c2b80f0d7c8611fb1359c85d1b372bc')
install="${pkgname}.install"

_prefix="opt/$pkgname"
_java_home="/usr/lib/jvm/java-${_java_ver}-openjdk"

prepare() {
	cd "${pkgname}"
	sed -i -r "s|jdkHome = jdkDownload.+$|jdkHome.set('$_java_home')|" 'build.gradle'
	sed -i 's/ForkJoinPool.commonPool().invokeAll(tasks);/try { ForkJoinPool.commonPool().invokeAll(tasks); } catch(InterruptedException ignore) {}/' 'src/main/java/net/rptools/maptool/util/NetUtil.java'
}

build() {
	cd "${pkgname}"
	export JAVA_HOME="$_java_home"
	export PATH="$_java_home/bin:$PATH"
	gradle8 --no-daemon --parallel jpackage -x spotlessJavaCheck
}

#check() {
#	cd "${pkgname}"
#	export JAVA_HOME="$_java_home"
#	export PATH="$_java_home/bin:$PATH"
#	gradle --no-daemon --parallel check -x spotlessJavaCheck
#}

package() {
	depends+=("java-runtime=${_java_ver}" 'java-openjfx')

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
	sed -i "s|MAP_TOOL_JAVA=|MAP_TOOL_JAVA=\"\${MAP_TOOL_JAVA:-${_java_home}}\"|" "usr/bin/${pkgname}"

	rm -rf "${_prefix}"
}
