# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=violetumleditor
pkgname=${_pkgname}-git
pkgver=3.0.0+0+495649c5
pkgrel=1
pkgdesc="Java UML diagram editor (git version)"
arch=('any')
url="https://sourceforge.net/projects/violet"
license=('GPL')
depends=('java-runtime>=8')
makedepends=('java-environment>=8' 'maven' 'git')
conflicts=("${_pkgname}")
provides=("${_pkgname}=${pkgver%%+*}")
source=(${_pkgname}::git+https://github.com/violetumleditor/violetumleditor.git)
sha256sums=('SKIP')
_release_commit='495649c5798d207de3410ceacca3eb0221fc4e6f'

pkgver() {
	cd ${srcdir}/${_pkgname}
	printf "%s+%s+%s" \
	       "$( grep '<applicationVersion>' pom.xml | grep -E -o '[0-9]+(\.[0-9]+)*' )" \
	       "$( bc <<< "`git rev-list --count HEAD` - `git rev-list --count ${_release_commit}`" )" \
	       "$( git describe --always )"
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
