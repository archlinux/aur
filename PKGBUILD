# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: [Vitaliy Berdinskikh](mailto:ur6lad@archlinux.org.ua) aka UR6LAD

pkgname=libmatthew-java
pkgver=0.8
pkgrel=5
pkgdesc="Libraries for Java: unix sockets, CGI, hexdump"
arch=('i686' 'x86_64')
url="http://www.matthew.ath.cx/projects/java"
license=('Expat')
depends=('java-runtime' 'glibc')
makedepends=('java-environment' 'apache-ant' 'gcc')
replaces=('matthew-java')
source=( "http://www.java2s.com/Code/JarDownload/libmatthew/libmatthew-$pkgver-x86_64-sources.jar.zip"
         "build.xml" "ant.patch" "Makefile" "setClasspath.sh" )
changelog=${pkgname}.ChangeLog.markdown

build() {
	cd "${srcdir}"
	
	mkdir ${pkgname}-${pkgver} && cd ${pkgname}-${pkgver}
	
	jar xf ../libmatthew-0.8-x86_64-sources.jar
	cp ../build.xml ../Makefile ./
	patch -p2 < ../ant.patch

	mkdir -p src/main/java
	mv cx src/main/java
	ant jars unix.h cgi.h
	make
}

package() {
	install -m755 -d "${pkgdir}"/usr/share/java/${pkgname} "${pkgdir}"/usr/lib

	cd "${srcdir}"

	install -m644 setClasspath.sh "${pkgdir}"/usr/share/java/${pkgname}

	cd ${pkgname}-${pkgver}

	for i in dist/*.jar; do
		install -m 644 ${i} "${pkgdir}"/usr/share/java/${pkgname}
	done
	for i in "${pkgdir}"/usr/share/java/${pkgname}/*.jar; do
		_tmpfilename=${i##*\/}
		ln -sf ${_tmpfilename} "${pkgdir}"/usr/share/java/${pkgname}/${_tmpfilename/-[0-9]\.[0-9]/}
	done
	for i in *.so; do
		install -m 644 ${i} "${pkgdir}"/usr/lib
	done
}

md5sums=('946a87b891bac3021d6cbf6f61321ed3'
         '9a463b93dc05caec6d80cfb1ae76798e'
         '14bfe88a88143b598ee5c9bd9f0fb087'
         '73bc9ff2922322215a4f0dd9b24e9c81'
         'f00a4d642f2e7f1c7c41f591f461d157')
sha256sums=('fe8c47c0b0db4598f1782bd926fdad48027af05da3a1e7b2f3376ba9d091d387'
            '815d92a888b6d78bdead61146af0aa79007dca6015e693a230f91aca366885a9'
            '119ce6358011568d6afb7bda5079feb4b221fca80e4414f56f60c69091720d52'
            'e735d7d37876e0a2ad125f46bcec6073772ce6cf42124f90f1181f4be8c96b27'
            '60196fbe850d098ccc80073eea893405249171a8328060940a1fd81d7d1c621c')
