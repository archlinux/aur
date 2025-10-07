# Maintainer: Aidan Coward <aidan -dot- coward -at- gmail -dot- com>
# Feedback is appreciated

pkgname=xmage
pkgver=1.4.58V1
pkgrel=0

pkgdesc="Java-based program for playing Magic:The Gathering, including client and server"

arch=('any')
url="http://xmage.today"
license=('MIT')

source=(
	"http://beta.xmage.today/files/mage-full_1.4.58-dev_2025-10-06_20-40.zip"
	'https://raw.githubusercontent.com/magefree/mage/master/LICENSE.txt'
	'https://raw.githubusercontent.com/magefree/Launcher/master/src/main/resources/icon-mage.png'
	'https://raw.githubusercontent.com/magefree/Launcher/refs/heads/master/src/deb/xmage.desktop')

sha256sums=("50eb7157eca40c81fe3cb8cbac2eba46eb7dd88230da20c75b0bc9db2b66500b" 
	"SKIP"
	"SKIP"
	"SKIP")

depends=('jre8-openjdk' 'java8-openjfx')
optdepends=('wmname: change window manager name for compatibility with certain WMs')
install="${pkgname}.install"

package() {

	echo "cleaning files"
        rm *.zip
        rm *.cmd

	echo "changing file format of included scripts..."
	awk '{ sub("\r$", ""); print }' xmage/mage-client/startClient.sh > xmage/mage-client/startClient-unix.sh
	awk '{ sub("\r$", ""); print }' xmage/mage-server/startServer.sh > xmage/mage-server/startServer-unix.sh

	echo "changing default locations of scripts..."
	sed -i 's|\.\/lib|\/usr\/share\/xmage\/xmage\/mage-client\/lib|' xmage/mage-client/startClient-unix.sh
	sed -i 's|\.\/lib|\/usr\/share\/xmage\/xmage\/mage-server\/lib|' xmage/mage-server/startServer-unix.sh

	echo "adding cd to relevant /usr/share/xmage/ directory..."
	sed -i '2i cd /usr/share/xmage/xmage/mage-client' xmage/mage-client/startClient-unix.sh
	sed -i '2i cd /usr/share/xmage/xmage/mage-server' xmage/mage-server/startServer-unix.sh

	echo "increasing default memory limit of client and server"
	sed -i 's|-Xmx2000m|-Xmx4096m|g' xmage/mage-client/startClient-unix.sh
	sed -i 's|-Xmx2000m|-Xmx4096m|g' xmage/mage-server/startServer-unix.sh

	echo "changing values in desktop file"
        sed -i 's|Exec=xmage|Exec=/usr/bin/mage-client|' xmage.desktop
        echo "Path=/usr/share/xmage/" >> xmage.desktop

	echo "moving files..."
	install -Dm755 xmage/mage-client/startClient-unix.sh "${pkgdir}"/usr/bin/mage-client
	install -Dm755 xmage/mage-server/startServer-unix.sh "${pkgdir}"/usr/bin/mage-server

	echo "creating /usr/share/xmage..."
	install -dm755 "${pkgdir}"/usr/share/xmage

	echo "copying files to /usr/share/xmage..."
	cp -ra ./* "${pkgdir}"/usr/share/xmage/
	
	echo "setting permissions of /usr/share/xmage..."
	chmod -R a+rwx "${pkgdir}"/usr/share/xmage

	echo "installing license: ${license}..."
	install -Dm644 LICENSE.txt "${pkgdir}"/usr/share/licences/"${pkgname}"/LICENSE.txt
	
	echo "installing mage-server systemd unit file to /usr/lib/systemd/system..."
	mkdir -p "${pkgdir}"/usr/lib/systemd/system
	install -m755 ../mage-server.service "${pkgdir}"/usr/lib/systemd/system
	
	echo "installing icon and .desktop file..."
	mkdir -p "${pkgdir}"/usr/share/icons
	install -m755 icon-mage.png "${pkgdir}"/usr/share/icons/
	mkdir -p "${pkgdir}"/usr/share/applications
	install -m755 xmage.desktop "${pkgdir}"/usr/share/applications/xmage.desktop
}
