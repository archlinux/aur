# Maintainer: Julien Machiels <julien.machiels@protonmail.com>
# Maintainer: Erik Sonnleitner <es@delta-xi.net>
pkgname=ripme-git
_pkgname=ripme
pkgver=1.5.14.r0.g8064772
pkgrel=2
pkgdesc="Automated picture album downloader for various websites"
arch=('i686' 'x86_64')
url="https://github.com/RipMeApp/ripme.git"
license=('MIT')
depends=('java-runtime')
makedepends=('git' 'maven')
source=('ripme::git+http://github.com/ripmeapp/ripme#branch=master')
provides=('ripme')
conflicts=('ripme' 'ripme-headless-git')
md5sums=('SKIP')

build() {
	cd "$_pkgname"
	mvn clean compile assembly:single
	echo -e "#!/bin/bash\njava -jar /usr/share/java/${pkgname}-${pkgver}.jar \"$@\"" >> ${srcdir}/${_pkgname}/ripme.sh
}

package() {
	install -D -m644 ${srcdir}/${_pkgname}/target/ripme*-jar-with-dependencies.jar ${pkgdir}/usr/share/java/${pkgname}-${pkgver}.jar
	install -D -m755 ${srcdir}/${_pkgname}/ripme.sh ${pkgdir}/usr/bin/ripme
}

pkgver() {
	cd "$_pkgname"
	git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
