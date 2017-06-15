# Maintainer: Matt Sturgeon <matt at sturgeon dot me dot uk>

_name='MCPMappingViewer'
pkgname='mcp-mapping-viewer'
pkgver='1.0.1'
pkgrel=1
pkgdesc='A small GUI for viewing the mappings from Minecraft obfuscated code names to MCP code names.'
arch=('any')
url='https://github.com/bspkrs/MCPMappingViewer'
license=('MIT' 'Apache')

depends=('sh' 'java-runtime>=7')
makedepends=('java-environment>=7')

source=(${_name}
	${_name}.desktop
	${url}/archive/${pkgver}.tar.gz)

md5sums=('0b60fd59792482a0e69a2457d9d3e309'
         '61a50d4721e1378ac1c91023aec3010d'
         '715927a5df7c012dfe22e3f3c08dcc87')

build() {
	cd ${srcdir}/${_name}-${pkgver}
	./gradlew build
}

package() {
	cd ${srcdir}/${_name}-${pkgver}

	# Create pkgdir tree
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/share/applications"
	mkdir -p "${pkgdir}/usr/share/java/${pkgname}"
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}"

	# Install files into pkgdir
	# Use the -all jar so all libs are packed in the jar and we don't need to setup a classpath
	install -D -m755 "build/libs/${_name}-${pkgver}-all.jar" "${pkgdir}/usr/share/java/${pkgname}/${_name}.jar"

	# TODO Consider injecting variables into the script and .desktop file
	install -D -m755 "${srcdir}/${_name}" "${pkgdir}/usr/bin/"
	install -D -m644 "${srcdir}/${_name}.desktop" "${pkgdir}/usr/share/applications"

	# LICENSE and BON_LICENSE are MIT, GSON_LICENSE is Apache 2.0
	install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "BON_LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/BON.LICENSE"
	install -D -m644 "GSON_LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/GSON.LICENSE"
}

