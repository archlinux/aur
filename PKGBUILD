# Maintainer: Adrian Wheeldon <arandomowl at gmail dot com>
pkgname=workcraft-git
pkgver=r2436.26f5b52
pkgrel=1
pkgdesc="A framework for interpreted graph models including petri nets and STGs"
arch=('i686' 'x86_64')
url="http://www.workcraft.org/"
license=('GPL')
makedepends=('git' 'java-environment')
depends=('java-runtime')
optdepends=(
	'graphviz: Graph manipulation',
	'stack: Concepts support')
provides=('workcraft')
conflicts=('workcraft')
source=(git+https://github.com/tuura/workcraft.git git+https://github.com/tuura/workcraft-dist-template.git git+https://github.com/tuura/workcraft-doc.git workcraft_start.sh)
md5sums=('SKIP' 'SKIP' 'SKIP' '83d559be23be014bbb68bef45e1aedb3')
pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
	cd "$srcdir/${pkgname%-git}"
	git submodule init
	git submodule update
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
	mkdir -p "$pkgdir"/usr/bin
	mkdir -p "$pkgdir"/opt/workcraft
	cp -RP "${pkgname%-git}"/* "$pkgdir"/opt/workcraft/
	cp workcraft_start.sh "$pkgdir"/usr/bin/workcraft
	cp -R "${pkgname%-git}"/dist-template/linux/tools "$pkgdir"/opt/workcraft/tools
	cp -R "${pkgname%-git}"/dist-template/linux/libraries "$pkgdir"/opt/workcraft/libraries
	cp -R "${pkgname%-git}"/doc/help "$pkgdir"/opt/workcraft/help
	cp -R "${pkgname%-git}"/doc/overview "$pkgdir"/opt/workcraft/overview
	cp -R "${pkgname%-git}"/doc/tutorial "$pkgdir"/opt/workcraft/tutorial
	rm -rf "$pkgdir"/opt/workcraft/doc/
	rm -rf "$pkgdir"/opt/workcraft/dist-template/
	chmod 755 "$pkgdir"/usr/bin/workcraft
}
