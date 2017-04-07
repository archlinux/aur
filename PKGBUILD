# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=violetumleditor
pkgname=${_pkgname}-git
pkgver=2.5.3.r426
pkgrel=1
pkgdesc="Java UML diagram editor (git version)"
arch=('any')
url="http://sourceforge.net/projects/violet"
license=('GPL')
depends=('java-runtime>=8')
makedepends=('java-environment>=8' 'maven' 'git')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver/\.r*/}")
source=(${_pkgname}::git+https://github.com/violetumleditor/violetumleditor.git)
sha256sums=('SKIP')

pkgver() {
	cd ${srcdir}/${_pkgname}
	echo $( grep '<applicationVersion>' pom.xml | grep -E -o '[0-9]+(\.[0-9]+)*' ).r$( git rev-list --count HEAD )
}

prepare() {
	cd ${srcdir}/${_pkgname}
	sed -i -e '/violetproduct-exe/d' -e '/violetproduct-web/d' pom.xml
}

build() {
	cd ${srcdir}/${_pkgname}

	export JAVA_HOME=/usr/lib/jvm/default
	mvn package -Dmaven.test.skip=true
}

package() {
	bsdtar -x -f ${srcdir}/${_pkgname}/violetproduct-deb/target/violetumleditor-2.5.3.deb -C ${srcdir}
	bsdtar -x -f data.tar.gz -C "$pkgdir"

	mkdir -p "${pkgdir}"/usr/bin
	cat > "${pkgdir}/usr/bin/${_pkgname}" <<- EOF
		#!/bin/sh
		java -jar /usr/share/violetumleditor/violetumleditor.jar
	EOF
	chmod 755 "${pkgdir}/usr/bin/${_pkgname}"
}
