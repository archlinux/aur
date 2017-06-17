# Maintainer: Matt Sturgeon <matt at sturgeon dot me dot uk>

_name='MCPMappingViewer'
pkgname='mcp-mapping-viewer'
pkgver='1.0.1'
pkgrel=2
pkgdesc='A small GUI for viewing the mappings from Minecraft obfuscated code names to MCP code names.'
arch=('any')
url='https://github.com/bspkrs/MCPMappingViewer'
license=('MIT' 'Apache')

depends=('sh' 'java-runtime>=7')
makedepends=('java-environment>=7')

source=('bin'
        'desktop'
        "${url}/archive/${pkgver}.tar.gz")

sha256sums=('f5bac19becef64725e04bab40b2cc2d23b6f9453e641e56320f02a34e491617f'
            '147e6e24a8ed67124d8b5f6d5dc73c133d3ad1baee6a42ab01a26bd7306b96b2'
            '80cbdcec1e46d4cc55aa8a80807bb9c19ea4832500c70e320d8472bc48a14a1c')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	./gradlew build
}

package() {
	cd "${pkgdir}"

	tar="${srcdir}/${_name}-${pkgver}"
	jar="${tar}/build/libs/${_name}-${pkgver}-all.jar"
	icon="${tar}/build/resources/main/bspkrs/mmv/gui/icon/bspkrs128.png"

	# Create pkgdir tree
	mkdir -p "usr/bin"
	mkdir -p "usr/share/applications"
	mkdir -p "usr/share/java/${pkgname}"
	mkdir -p "usr/share/licenses/${pkgname}"
	mkdir -p "usr/share/pixmaps"

	# Install files into pkgdir
	# Use the -all jar so all libs are packed in the jar and we don't need to setup a classpath
	install -D -m755 "${jar}" "usr/share/java/${pkgname}/${_name}.jar"
	install -D -m644 "${icon}" "usr/share/pixmaps/${_name}.png"

	# TODO Consider injecting variables into the bin and desktop files
	install -D -m755 "${srcdir}/bin" "usr/bin/${_name}"
	install -D -m644 "${srcdir}/desktop" "usr/share/applications/${_name}.desktop"

	# LICENSE and BON_LICENSE are MIT, GSON_LICENSE is Apache 2.0
	install -D -m644 "${tar}/LICENSE" "usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "${tar}/BON_LICENSE.txt" "usr/share/licenses/${pkgname}/BON.LICENSE"
	install -D -m644 "${tar}/GSON_LICENSE.txt" "usr/share/licenses/${pkgname}/GSON.LICENSE"
}

