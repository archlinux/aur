# Maintainer: IotaBread <iotabread at gmail dot com>
_pkgname=vineflower
pkgname=vineflower-git
_version="1.11.1"
pkgver=1.11.1.r1750.a1967e83
pkgrel=1
pkgdesc="Modern Java & JVM language decompiler focused on output quality & readability"
arch=('any')
url="https://vineflower.org"
license=('Apache-2.0')
depends=('java-runtime>=17' 'sh')
makedepends=('java-environment>=17' 'git')
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
