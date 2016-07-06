# Maintainer: AudioLinux  <audiolinux AT fastmail DOT fm>
# Contributor: peace4all <markspost at rocketmail dot com>

pkgname=unified-remote-server
pkgver=3.4.0.740
pkgrel=1
pkgdesc="Unified Remote Server"
arch=('x86_64')
url="http://www.unifiedremote.com/"
depends=('libxext' 'libx11' 'bluez-libs')
optdepends=('bluez' 'bluez-utils')
license=('freeware')
install=$pkgname.install
source=("https://www.unifiedremote.com/download/linux-x64-deb" "urserver.service")
sha256sums=('b911eda84ec0c4b7acf65333400d0643f6b05bc9164d20b7962080ad820f8626' 'SKIP' )

package() {
	cd ${srcdir}

	# decompress data
	tar zxf data.tar.gz

	# fix and revert desktop file to old behaviour
	sed -i -e '9,24d;26d' $(find . -name 'urserver.desktop')

	# install folders
	mkdir -p ${pkgdir}/{opt,usr}
	cp -r {opt,usr} "${pkgdir}/"

	# clean up permissions
	find "${pkgdir}" -type d | xargs -I {} chmod -R 755 "{}"
	find "${pkgdir}" -type f | xargs -I {} chmod -R 644 "{}"
	chmod 755 "${pkgdir}/opt/urserver/urserver"
	chmod 755 "${pkgdir}/opt/urserver/urserver-start"
	chmod 755 "${pkgdir}/opt/urserver/urserver-stop"
	
	# add systemd service
        install -Dm644 "urserver.service" "$pkgdir/usr/lib/systemd/user/urserver.service"
}

