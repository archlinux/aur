# Maintainer: Aidan Coward <aidan -dot- coward -at- gmail -dot- com>

pkgname=xmage
pkgver=1.4.41V0
pkgrel=0

pkgdesc="Java-based program for playing Magic:The Gathering, including client and server"

arch=('any')
url="http://xmage.de"
license=('MIT')


source=("http://xmage.de/files/xmage_${pkgver}.zip"
	'https://raw.githubusercontent.com/magefree/mage/master/LICENSE.txt')

sha256sums=("c3d07b1482c2041fe230dcf4c7c236741c5828cfc7ced3e5bb8c7548884d393f" 
	"SKIP")

###########################
# x86_64 ONLY
# Due to compatibility issues with the current version of java in the repositories,
# xmage now installs a dedicated version of java to /usr/share/xmage/java
#
# For all other architectures, the xmage package requires only jre8-openjdk
###########################

if [[ "$CARCH" == 'x86_64' ]]; then
		source+=('http://xmage.today/java/jre-8u201-linux-x64.tar.gz')
		sha256sums+=('12c745fbb8735bf450b8c6ba6f649bebe19915f05742975e443bdc8566170352')
		_java_version=8u201
		_java_dir=jre1.8.0_201

	else
		depends=('jre8-openjdk')
fi

makedepends=('detox')
optdepends=('wmname: change window manager name for compatibility with certain WMs')
install="${pkgname}.install"

package() {

	cd "${srcdir}"

	# clean up filenames
	detox -r -v ./* &> /dev/null

	msg2 "changing file format of included scripts..."
	awk '{ sub("\r$", ""); print }' mage-client/startClient.sh > mage-client/startClient-unix.sh
	awk '{ sub("\r$", ""); print }' mage-server/startServer.sh > mage-server/startServer-unix.sh

	msg2 "changing default locations of scripts..."
	awk '{ sub("\.\/lib", "/usr/share/xmage/mage-client/lib"); print }' mage-client/startClient-unix.sh > mage-client/startClient-unix-lib.sh
	awk '{ sub("\.\/lib", "/usr/share/xmage/mage-server/lib"); print }' mage-server/startServer-unix.sh > mage-server/startServer-unix-lib.sh

	msg2 "adding cd to relevant /usr/share/xmage/ directory..."
	sed -i '2i cd /usr/share/xmage/mage-client' mage-client/startClient-unix-lib.sh
	sed -i '2i cd /usr/share/xmage/mage-server' mage-server/startServer-unix-lib.sh

if [[ "$CARCH" == 'x86_64' ]]; then
		msg2 "x86_64 architecture detected, changing location of java binary..."
		sed -i "s|java|/usr/share/xmage/${_java_dir}/bin/java|g" mage-client/startClient-unix-lib.sh
		sed -i "s|java|/usr/share/xmage/${_java_dir}/bin/java|g" mage-server/startServer-unix-lib.sh
fi

	msg2 "increasing default memory limit of client and server"
	sed -i 's|-Xmx512m|-Xmx2048m|g' mage-client/startClient-unix-lib.sh
	sed -i 's|-Xmx512m|-Xmx2048m|g' mage-server/startServer-unix-lib.sh

	msg2 "moving files..."
	install -Dm755 mage-client/startClient-unix-lib.sh ${pkgdir}/usr/bin/mage-client
	install -Dm755 mage-server/startServer-unix-lib.sh ${pkgdir}/usr/bin/mage-server

	msg2 "creating /usr/share/xmage..."
	install -dm755 ${pkgdir}/usr/share/xmage

	msg2 "copying files to /usr/share/xmage..."
	cp -ra ./* ${pkgdir}/usr/share/xmage/
	
	msg2 "setting permissions of /usr/share/xmage..."
	chmod -R a+rwx ${pkgdir}/usr/share/xmage

	msg2 "installing license: ${license}..."
	install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licences/"${pkgname}"/LICENSE.txt
}
