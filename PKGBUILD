# Maintainer: AsamK <asmak ät gmx de>

pkgname=libmatthew-unix-java
_pkgname=libmatthew-java
pkgver=0.5
_pkgver=0.8.1
pkgrel=2
pkgdesc="Library for Java: unix sockets"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
url="http://www.matthew.ath.cx/projects/java"
license=('Expat')
depends=('java-runtime' 'glibc')
makedepends=('java-environment' 'gcc')
source=( "http://www.matthew.ath.cx/projects/java/${_pkgname}-${_pkgver}.tar.gz" )
sha256sums=('46782b940c71d8db07470633efcf65c2aeda94de9a846fe178a5918fb2ad026f')

prepare() {
	cd "${srcdir}"

	cd ${_pkgname}-${_pkgver}

	# source 1.5 not working in jdk 12 anymore
	sed -i "s/JVERCFLAGS+=-source 1.5/JVERCFLAGS+=-source 1.7/g" Makefile
}

build() {
	cd "${srcdir}"

	cd ${_pkgname}-${_pkgver}

	JAVA_HOME="/usr/lib/jvm/default" make "unix-${pkgver}.jar" "libunix-java.so"
}

package() {
	install -m755 -d "${pkgdir}"/usr/share/java/${pkgname} "${pkgdir}"/usr/lib

	cd "${srcdir}"

	cd ${_pkgname}-${_pkgver}

	install -m 644 "unix-${pkgver}.jar" "${pkgdir}"/usr/share/java/${pkgname}

	for i in "${pkgdir}"/usr/share/java/${pkgname}/*.jar; do
		_tmpfilename=${i##*\/}
		ln -sf ${_tmpfilename} "${pkgdir}"/usr/share/java/${pkgname}/${_tmpfilename/-[0-9]\.[0-9]/}
	done

	install -m 644 libunix-java.so "${pkgdir}"/usr/lib
}
