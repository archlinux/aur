# Maintainer: Costin Botescu <costin.botescu@gmail.com>
pkgname=flashalizer
pkgver=1.6
_rel_at_source=0
pkgrel=2
pkgdesc="GUI to make .swf files"
arch=('any')
url="https://github.com/colin-i/${pkgname}"
license=('0BSD')
depends=('java-runtime' 'jna-bin' 'javassist-bin' 'actionswf')
makedepends=('ant') #java-runtime and java-environment are provided by jdk-openjdk, required by ant
source=("${pkgname}-${pkgver}-${_rel_at_source}.tar.gz::https://github.com/colin-i/${pkgname}/archive/${pkgname}-${pkgver}-${_rel_at_source}.tar.gz")
sha256sums=('bec8c3cd2c8184c6364c79676f5929addb8a4ae20ec3da0bb672c66be74a115d')

_tag() {
	cd "${pkgname}-${pkgname}-${pkgver}-${_rel_at_source}"
}

prepare() {
	_patches="`cat ../list`"
	_tag
	for _var in ${_patches[@]}; do
		echo ${_var}
		patch --strip=1 --input=../../${_var}
	done
}

build() {
	_tag
	mkdir libs
	ln -s /usr/share/java/jna/jna.jar libs/jna.jar
	ln -s /usr/share/java/jna/jna-platform.jar libs/jna-platform.jar
	ln -s /usr/share/java/javassist.jar libs/javassist.jar
	printf 'Main-Class: flashalizer\nClass-Path: jna/jna.jar jna/jna-platform.jar javassist.jar\n' > MANIFEST.MF
	ant -Djava.lib="$PWD/libs" build
}

package() {
	_tag
	install -Dm644 dist/flashalizer.jar "$pkgdir/usr/share/java/flashalizer.jar"
	install -Dm755 /dev/stdin "$pkgdir/usr/bin/flashalizer" <<'EOF'
#!/bin/sh
exec java --add-opens=java.base/java.lang=ALL-UNNAMED --enable-native-access=ALL-UNNAMED -jar /usr/share/java/flashalizer.jar "$@"
EOF
}
