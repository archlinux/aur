# Maintainer: Aidan Coward <aidan -dot- coward -at- gmail -dot- com>

pkgname=xmage-beta
pkgver=1.4.38.dev_2019_09_21_06_22
pkgrel=0
_pkg_location="$(wget -qO- http://xmage.today/ | grep "files/" | head -n 1 | cut -c 62- | head -c -32)"

pkgdesc="Java-based program for playing Magic:The Gathering, including client and server"

arch=('any')
url="http://xmage.today"
license=('MIT')


source=("http://xmage.today/files/mage-full_$_pkg_location.zip"
	'https://raw.githubusercontent.com/magefree/mage/master/LICENSE.txt')

sha256sums=("SKIP"
	    "SKIP")

###########################
# x86_64 ONLY
# Due to compatibility issues with the current version of java in the repositories,
# xmage-beta installs a dedicated version of java to /usr/share/xmage-beta/java
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

makedepends=(
	'detox'
	'wget')
optdepends=('wmname: change window manager name for compatibility with certain WMs')
install="${pkgname}.install"

pkgver() {
	wget -qO- http://xmage.today/ | grep "files/" | head -n 1 | cut -c 62- | head -c -32 | sed s/-/_/g
}

package() {

	cd "${srcdir}"
	
	msg2 "removing mage folders from previous builds..."
	if [[ -f mage-client ]] ; then 
		rm -r mage-client
	fi
	
	if [[ -f mage-server ]] ; then
		rm -r mage-server
	fi

	msg2 "moving new mage folders..."
	mv xmage/mage-client ./
	mv xmage/mage-server ./

	rmdir xmage
	
	# clean up filenames
	detox -r -v ./* &> /dev/null

	msg2 "changing file format of included scripts..."
	awk '{ sub("\r$", ""); print }' mage-client/startClient.sh > mage-client/startClient-unix.sh
	awk '{ sub("\r$", ""); print }' mage-server/startServer.sh > mage-server/startServer-unix.sh

	msg2 "changing default locations of scripts..."
	awk '{ sub("\.\/lib", "/usr/share/xmage-beta/mage-client/lib"); print }' mage-client/startClient-unix.sh > mage-client/startClient-unix-lib.sh
	awk '{ sub("\.\/lib", "/usr/share/xmage-beta/mage-server/lib"); print }' mage-server/startServer-unix.sh > mage-server/startServer-unix-lib.sh

	msg2 "adding cd to relevant /usr/share/xmage-beta/ directory..."
	sed -i '2i cd /usr/share/xmage-beta/mage-client' mage-client/startClient-unix-lib.sh
	sed -i '2i cd /usr/share/xmage-beta/mage-server' mage-server/startServer-unix-lib.sh

if [[ "$CARCH" == 'x86_64' ]]; then
		msg2 "x86_64 architecture detected, changing location of java binary..."
		sed -i "s|java|/usr/share/xmage-beta/${_java_dir}/bin/java|g" mage-client/startClient-unix-lib.sh
		sed -i "s|java|/usr/share/xmage-beta/${_java_dir}/bin/java|g" mage-server/startServer-unix-lib.sh
fi

	msg2 "increasing default memory limit of client and server"
	sed -i 's|-Xmx512m|-Xmx2048m|g' mage-client/startClient-unix-lib.sh
	sed -i 's|-Xmx512m|-Xmx2048m|g' mage-server/startServer-unix-lib.sh

	msg2 "moving files..."
	install -Dm755 mage-client/startClient-unix-lib.sh ${pkgdir}/usr/bin/mage-client-beta
	install -Dm755 mage-server/startServer-unix-lib.sh ${pkgdir}/usr/bin/mage-server-beta

	msg2 "creating /usr/share/xmage-beta..."
	install -dm755 ${pkgdir}/usr/share/xmage-beta

	msg2 "copying files to /usr/share/xmage-beta..."
	cp -ra ./* ${pkgdir}/usr/share/xmage-beta/
	
	msg2 "setting permissions of /usr/share/xmage-beta..."
	chmod -R a+rwx ${pkgdir}/usr/share/xmage-beta

	msg2 "installing license: ${license}..."
	install -Dm644 ./LICENSE.txt "${pkgdir}"/usr/share/licences/"${pkgname}"/LICENSE.txt
}
