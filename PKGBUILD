# Maintainer: Adrian Wheeldon <arandomowl at gmail dot com>
pkgname=workcraft-git
pkgver=r2434.f520e4b
pkgrel=1
pkgdesc="A framework for interpreted graph models including petri nets and STGs"
arch=('i686' 'x86_64')
url="http://www.workcraft.org/"
license=('GPL')
makedepends=('git' 'java-environment')
depends=('java-runtime')
provides=('workcraft')
conflicts=('workcraft')
source=(git+https://github.com/tuura/workcraft.git workcraft_start.sh)
md5sums=('SKIP' '83d559be23be014bbb68bef45e1aedb3')
pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
build() {
	cd "$srcdir/${pkgname%-git}"
	if [ -e "/usr/bin/gradle" ]; then
		/usr/bin/gradle assemble	# Use current gradle installation if available
	else
		./gradlew assemble
	fi
}
package() {
	cd "$srcdir"
	mkdir -p "${pkgdir}"/usr/bin
	mkdir -p "${pkgdir}"/opt/workcraft
	cp -RP "${pkgname%-git}"/* "${pkgdir}"/opt/workcraft/
	cp workcraft_start.sh "${pkgdir}"/usr/bin/workcraft
	chmod 755 "${pkgdir}/usr/bin/workcraft"
}
