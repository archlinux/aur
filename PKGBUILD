# Maintainer: Aidan Coward <aidan -dot- coward -at- gmail -dot- com>
# Feedback is appreciated

pkgname=xmage
pkgver=1.4.47V0
pkgrel=0

pkgdesc="Java-based program for playing Magic:The Gathering, including client and server"

arch=('any')
url="http://xmage.de"
license=('MIT')


source=("http://xmage.de/files/xmage_${pkgver}.zip"
	'https://raw.githubusercontent.com/magefree/mage/master/LICENSE.txt'
	'https://raw.githubusercontent.com/magefree/Launcher/master/src/main/resources/icon-mage.png')

sha256sums=("115a1611abd659a41897a9241650804a3eead59a9a3534a427570cc8ad355683" 
	"SKIP"
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
	sed -i 's|\.\/lib|\/usr\/share\/xmage\/mage-client\/lib|' mage-client/startClient-unix.sh
	sed -i 's|\.\/lib|\/usr\/share\/xmage\/mage-server\/lib|' mage-server/startServer-unix.sh

	msg2 "adding cd to relevant /usr/share/xmage/ directory..."
	sed -i '2i cd /usr/share/xmage/mage-client' mage-client/startClient-unix.sh
	sed -i '2i cd /usr/share/xmage/mage-server' mage-server/startServer-unix.sh

if [[ "$CARCH" == 'x86_64' ]]; then
		msg2 "x86_64 architecture detected, changing location of java binary..."
		sed -i "s|java|/usr/share/xmage/${_java_dir}/bin/java|g" mage-client/startClient-unix.sh
		sed -i "s|java|/usr/share/xmage/${_java_dir}/bin/java|g" mage-server/startServer-unix.sh
fi

	msg2 "increasing default memory limit of client and server"
	sed -i 's|-Xmx512m|-Xmx2048m|g' mage-client/startClient-unix.sh
	sed -i 's|-Xmx512m|-Xmx2048m|g' mage-server/startServer-unix.sh

	msg2 "moving files..."
	install -Dm755 mage-client/startClient-unix.sh ${pkgdir}/usr/bin/mage-client
	install -Dm755 mage-server/startServer-unix.sh ${pkgdir}/usr/bin/mage-server

	msg2 "creating /usr/share/xmage..."
	install -dm755 ${pkgdir}/usr/share/xmage

	msg2 "copying files to /usr/share/xmage..."
	cp -ra ./* ${pkgdir}/usr/share/xmage/
	
	msg2 "setting permissions of /usr/share/xmage..."
	chmod -R a+rwx ${pkgdir}/usr/share/xmage

	msg2 "installing license: ${license}..."
	install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licences/"${pkgname}"/LICENSE.txt
	
	msg2 "installing mage-server systemd unit file to /usr/lib/systemd/system..."
	mkdir -p "${pkgdir}"/usr/lib/systemd/system
	install -m755 ../mage-server.service "${pkgdir}"/usr/lib/systemd/system
	
	msg2 "installing icon and .desktop file..."
	mkdir -p "${pkgdir}"/usr/share/icons
	install -m755 icon-mage.png "${pkgdir}"/usr/share/icons/
	mkdir -p "${pkgdir}"/usr/share/applications
	install -m755 ../xmage.desktop "${pkgdir}"/usr/share/applications/xmage.desktop
}

