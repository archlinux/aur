# Maintainer: Aidan Coward <aidan -dot- coward -at- gmail -dot- com>

pkgname=xmage
pkgver=1.4.34V0.1
pkgrel=1
_java_version=8u201
_java_dir=1.8.0_201

pkgdesc="Java-based program for playing Magic:The Gathering, including client and server"

arch=('any')
url="http://xmage.de"
license=('MIT')

makedepends=('detox')
depends=('jre8-openjdk')
optdepends=('wmname: change window manager name for compatibility with certain WMs')

source=("http://xmage.de/files/xmage_${pkgver}.zip"
	'https://raw.githubusercontent.com/magefree/mage/master/LICENSE.txt')

sha256sums=("0f731af1cfa07faae133afff7ec5d9c039c18829f8cb67587a49d82bf683d158" 
	"SKIP")

package() {

	cd "${srcdir}"
	
	msg2 "downloading dedicated java version..."
	wget -c --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u201-b09/42970487e3af4f5aa5bca3f542482c60/jre-8u201-linux-x64.tar.gz
	
	msg2 "uncompressing java..."
	tar -xzvf jre-${_java_version}-linux-x64.tar.gz

	# clean up filenames
	detox -r -v ./*

	msg2 "changing file format of included scripts..."
	awk '{ sub("\r$", ""); print }' mage-client/startClient.sh > mage-client/startClient-unix.sh
	awk '{ sub("\r$", ""); print }' mage-server/startServer.sh > mage-server/startServer-unix.sh

	msg2 "changing default locations of scripts..."
	awk '{ sub("\.\/lib", "/usr/share/xmage/mage-client/lib"); print }' mage-client/startClient-unix.sh > mage-client/startClient-unix-lib.sh
	awk '{ sub("\.\/lib", "/usr/share/xmage/mage-server/lib"); print }' mage-server/startServer-unix.sh > mage-server/startServer-unix-lib.sh

	msg2 "adding cd to relevant /usr/share/xmage/ directory..."
	sed -i '2i cd /usr/share/xmage/mage-client' mage-client/startClient-unix-lib.sh
	sed -i '2i cd /usr/share/xmage/mage-server' mage-server/startServer-unix-lib.sh

	msg2 "changing location of java binary..."
	sed -i "s|java|/usr/share/xmage/jre${_java_dir}/bin/java|g" mage-client/startClient-unix-lib.sh
	sed -i "s|java|/usr/share/xmage/jre${_java_dir}/bin/java|g" mage-server/startServer-unix-lib.sh

	msg2 "increasing default memory limit of client and server"
	sed -i 's|-Xmx512m|-Xmx1024m|g' mage-client/startClient-unix-lib.sh
	sed -i 's|-Xmx512m|-Xmx1024m|g' mage-server/startServer-unix-lib.sh

	msg2 "moving files..."
	install -Dm755 mage-client/startClient-unix-lib.sh ${pkgdir}/usr/bin/mage-client
	install -Dm755 mage-server/startServer-unix-lib.sh ${pkgdir}/usr/bin/mage-server

	msg2 "creating /usr/share/xmage..."
	install -dm777 ${pkgdir}/usr/share/xmage

	msg2 "copying files to /usr/share/xmage..."
	cp -ra ./* ${pkgdir}/usr/share/xmage/
	
	msg2 "setting permissions of /usr/share/xmage..."
	chmod -R a+rwx ${pkgdir}/usr/share/xmage

	msg2 "installing license: ${license}..."
	install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licences/"${pkgname}"/LICENSE.txt
}

