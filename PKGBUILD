# Maintainer: Asger Hautop Drewsen <asgerdrewsen@gmail.com>

pkgname=jif
pkgver=3.5.0
pkgrel=1
pkgdesc="Security-typed programming language that extends Java with support for information flow control and access control, enforced at both compile time and run time"
arch=('any')
url="https://www.cs.cornell.edu/jif/"
license=('LGPL2')
depends=('java-environment')
makedepends=('apache-ant')
optdepends=()
source=("http://www.cs.cornell.edu/jif/releases/jif-${pkgver}.zip")
sha256sums=('1ef1603183234474d903b6c4bc7fea734c82827f6a6d7e2eecb3a873f617f57e')

build() {
	cd "jif-${pkgver}"
	java=$(archlinux-java get)

	ant configure jif-runtime -Djif-runtime-native.java-include-dir="/usr/lib/jvm/$java/include"

	# rm -rf *src
	chmod a+x bin/jc

	# ant clean
	# ant -Djif-runtime-native.java-include-dir="/usr/lib/jvm/$java/include"
}

check() {
	cd "jif-${pkgver}"
	JIF="$PWD"

	cd "${JIF}/tests"
	"${JIF}/bin/jifc" jif/principals/Alice.jif jif/principals/Bob.jif

	cd "${JIF}/examples/battleship"
	"${JIF}/bin/jifc" -classpath ${JIF}/tests *.jif
	"${JIF}/bin/jif" -classpath "${JIF}/tests:." Main > /dev/null
}


_make_wrapper() {
	cat > "$2" <<END
#!/bin/bash
"$1" "\$@"
END
	chmod a+x "$2"
}

package() {
	mkdir -p "${pkgdir}/opt"
	cp -dpr --no-preserve=ownership "${srcdir}/jif-${pkgver}" "${pkgdir}/opt/jif"

	mkdir -p "${pkgdir}/usr/bin"
	cd "${pkgdir}/usr/bin"

	_make_wrapper "/opt/jif/bin/jif" "jif"
	_make_wrapper "/opt/jif/bin/jifc" "jifc"
	_make_wrapper "/opt/jif/bin/jc" "jc"
}
