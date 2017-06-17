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

source=('bin'
        'desktop'
        "${url}/archive/${pkgver}.tar.gz")

sha256sums=('f5bac19becef64725e04bab40b2cc2d23b6f9453e641e56320f02a34e491617f'
            '857ef429e636f7ee1258b2543f2db09802cdd69c55fab58ae7fb6af649f79b7f'
            '80cbdcec1e46d4cc55aa8a80807bb9c19ea4832500c70e320d8472bc48a14a1c')

build() {
	cd "${srcdir}/${_name}-${pkgver}"
	./gradlew build
}

package() {
	cd "${pkgdir}"

	tar="${srcdir}/${_name}-${pkgver}"

	# Create pkgdir tree
	mkdir -p "usr/bin"
	mkdir -p "usr/share/applications"
	mkdir -p "usr/share/java/${pkgname}"
	mkdir -p "usr/share/licenses/${pkgname}"

	# Install files into pkgdir
	# Use the -all jar so all libs are packed in the jar and we don't need to setup a classpath
	install -D -m755 "${tar}/build/libs/${_name}-${pkgver}-all.jar" "usr/share/java/${pkgname}/${_name}.jar"

	# TODO Consider injecting variables into the bin and desktop files
	install -D -m755 "${srcdir}/bin" "usr/bin/${_name}"
	install -D -m644 "${srcdir}/desktop" "usr/share/applications/${_name}.desktop"

	# LICENSE and BON_LICENSE are MIT, GSON_LICENSE is Apache 2.0
	install -D -m644 "${tar}/LICENSE" "usr/share/licenses/${pkgname}/LICENSE"
	install -D -m644 "${tar}/BON_LICENSE.txt" "usr/share/licenses/${pkgname}/BON.LICENSE"
	install -D -m644 "${tar}/GSON_LICENSE.txt" "usr/share/licenses/${pkgname}/GSON.LICENSE"
}

