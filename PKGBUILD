# Maintainer: Erik Sonnleitner <es@delta-xi.net>
pkgname=ripme-git
_pkgname=ripme
pkgver=1.2.7
#pkgver=r386.bd70b6f
pkgrel=1
pkgdesc="Automated picture album downloader for various websites"
arch=('i686' 'x86_64')
url="https://github.com/4pr0n/ripme.git"
license=('MIT')
#groups=()
depends=('java-runtime-headless')
makedepends=('maven')
source=('ripme::git+http://github.com/4pr0n/ripme#branch=master')
#optdepends=()
#provides=()
#conflicts=()
#replaces=()
#backup=()
#options=()
#install=
#changelog=
#source=($pkgname-$pkgver.tar.gz)
#noextract=()
md5sums=('SKIP') #autofill using updpkgsums

build() {
	cd "$_pkgname"
	mvn clean compile assembly:single
	echo -e "#!/bin/bash\njava -jar /usr/share/java/${pkgname}-${pkgver}.jar" >> ${srcdir}/${_pkgname}/ripme.sh
}

package() {
	install -D -m644 ${srcdir}/${_pkgname}/target/ripme*-jar-with-dependencies.jar ${pkgdir}/usr/share/java/${pkgname}-${pkgver}.jar
	install -D -m755 ${srcdir}/${_pkgname}/ripme.sh ${pkgdir}/usr/bin/ripme
}

pkgver() {
	## would be: fetching git version
	#  cd "$srcdir$pkgname"
	#  cd "$_pkgname"
	#  ( set -o pipefail
	#    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	#    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	#  )

	# fetch actual version from sources
	cat ${srcdir}/${_pkgname}/pom.xml | grep '<version>' | head -n1 | cut -d'>' -f2 | cut -d'<' -f1
}
