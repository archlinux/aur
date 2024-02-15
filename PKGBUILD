# Maintainer: IotaBread <iotabread at gmail dot com>
_pkgname=vineflower
pkgname=vineflower-git
_version="1.10.0"
pkgver=1.10.0.r1638.59d30884
pkgrel=1
pkgdesc="Modern Java & JVM language decompiler focused on output quality & readability"
arch=('any')
url="https://vineflower.org"
license=('Apache-2.0')
depends=('java-runtime>=11' 'sh')
makedepends=('git')
provides=("${_pkgname}=${_version}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+https://github.com/Vineflower/vineflower#branch=develop/${_version}")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/${_pkgname}"
	printf "${_version}.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${_pkgname}"
	# Skip tests to speed up building
	./gradlew build -x test
}

package() {
	cd "$srcdir/${_pkgname}"
	install -Dm644 "build/libs/${_pkgname}-${_version}+local.jar" "$pkgdir/usr/share/java/${_pkgname}/${_pkgname}.jar"
	install -d "$pkgdir/usr/bin"
	printf '#!/usr/bin/sh\nexec java -jar /usr/share/java/%s/%s "$@"\n' "${_pkgname}" "${_pkgname}.jar" > $pkgdir/usr/bin/${_pkgname}
	chmod 755 $pkgdir/usr/bin/${_pkgname}
}
