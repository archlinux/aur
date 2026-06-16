# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=violetumleditor
pkgname=${_pkgname}-git
epoch=1
pkgver=2.3.2+r838+70c092a9
pkgrel=1
pkgdesc="Java UML diagram editor (git version)"
arch=('any')
url="https://sourceforge.net/projects/violet"
license=('GPL2')
depends=('java-runtime>=17')
makedepends=('java-environment>=17' 'maven' 'git')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver%%+*}")
source=(${_pkgname}::git+https://github.com/violetumleditor/product.git)
sha256sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_pkgname}
	printf "%s+r%s+%s" \
	       "$( grep '<applicationVersion>' pom.xml | grep -E -o '[0-9]+(\.[0-9]+)*' )" \
	       "$( git rev-list --count HEAD )" \
	       "$( git rev-parse --short HEAD )"
}

prepare() {
	cd ${_pkgname}
	sed -i -e '/violetproduct-exe/d' -e '/violetproduct-web/d' pom.xml
}

build() {
	cd ${_pkgname}

	export JAVA_HOME=/usr/lib/jvm/default
	mvn package -Dmaven.test.skip=true
}

package() {
	bsdtar -x -f ${_pkgname}/violetproduct-deb/target/violetumleditor-*.deb -C ${srcdir}
	bsdtar -x -f data.tar.gz -C "$pkgdir"

	mkdir -p "${pkgdir}"/usr/bin
	cat > "${pkgdir}/usr/bin/${_pkgname}" <<- EOF
		#!/bin/sh
		java -jar /usr/share/violetumleditor/violetumleditor.jar
	EOF
	chmod 755 "${pkgdir}"/usr/bin/${_pkgname}
}
