# Maintainer: Ashley Whetter <(firstname) @ awhetter.co.uk>
# Contributor: Patrik Pira
pkgname=('pcoip-client' 'pcoip-client-clipboard')
pkgver=22.09.4
pkgrel=1
_ubuntuver=22.04
pkgdesc='Teradici PCOIP client'
url='https://teradici.com/'
arch=('x86_64')
license=('custom:Teradici')
depends=('openssl-1.1' 'pcsclite' 'qt5-networkauth' 'qt5-declarative' 'protobuf3.12' 'hiredis0.14' 'ffmpeg4.4')
makedepends=('fakeroot' 'patchelf')
install=$pkgname.install
# Find the latest at
# https://dl.teradici.com/DeAdBCiUYInHcSTy/pcoip-client/deb/ubuntu/dists/jammy/main/binary-amd64/Packages
source=(
	"https://dl.teradici.com/DeAdBCiUYInHcSTy/pcoip-client/deb/ubuntu/pool/jammy/main/p/pc/pcoip-client_${pkgver}-${_ubuntuver}/pcoip-client_${pkgver}-${_ubuntuver}_amd64.deb"
	'LICENSE.pdf::https://docs.teradici.com/sites/default/files/documents/2022-02/EULA%20%28Feb%202022%29.pdf'
)
sha256sums=(
	'a315601a1164418a7debe503a97486c0551c3f219db2ca6d9a7e8975702560f8'
	'c1ce23848fb8d3b08cfcb87ab9fc0572e14e274740e8142ebd07a18c050dd16e'
)

prepare() {
	cd $srcdir
	mkdir -p pcoip-client
	bsdtar -C pcoip-client -xvf pcoip-client_${pkgver}-${_ubuntuver}_amd64.deb
}

package_pcoip-client() {
  tar -C $pkgdir/ -xvf $srcdir/pcoip-client/data.tar.gz

	# Remove empty directories
	rm -rf $pkgdir/usr/lib/x86_64-linux-gnu/org.hp.pcoip-client
	rm -rf $pkgdir/var
	rm -rf $pkgdir/usr/share/icons/hicolor/128x128
	rm -rf $pkgdir/usr/lib/x86_64-linux-gnu/pcoip-client/pkgconfig
	# Remove pcoip-configure-kernel-networking
	rm -rf $pkgdir/usr/sbin $pkgdir/usr/share/man
	# Move /usr/libexec to /usr/lib
	mv $pkgdir/usr/libexec/pcoip-client $pkgdir/usr/lib/
	rm -rf $pkgdir/usr/libexec

	ln -s . $pkgdir/usr/lib/x86_64-linux-gnu/pcoip-client/lib

	mv $pkgdir/usr/bin/libFlxCore64.so.2019.04 $pkgdir/usr/lib/x86_64-linux-gnu/pcoip-client/
	mv $pkgdir/usr/bin/libFlxComm64.so.2019.04 $pkgdir/usr/lib/x86_64-linux-gnu/pcoip-client/

	chmod +x $pkgdir/usr/lib/x86_64-linux-gnu/pcoip-client/lib*so*

	# Remove urlhandler as it collides with the dedicated urlhandler
	sed -i -e 's!MimeType=x-scheme-handler/pcoip;!!' \
		$pkgdir/usr/share/applications/pcoip-client.desktop

	install -Dm644 'LICENSE.pdf' "$pkgdir/usr/share/licenses/$pkgname/LICENSE.pdf"
}

package_pcoip-client-clipboard() {
	pkgdesc='Teradici PCOIP client clipboard synchronization plugin'
	depends=('pcoip-client' 'graphicsmagick')

	tar -C $pkgdir/ -xvf $srcdir/pcoip-client/data.tar.gz \
		./usr/lib/x86_64-linux-gnu/org.hp.pcoip-client/vchan_plugins/libvchan-plugin-clipboard.so
	chmod +x $pkgdir/usr/lib/x86_64-linux-gnu/org.hp.pcoip-client/vchan_plugins/libvchan-plugin-clipboard.so
	patchelf --replace-needed libGraphicsMagick++-Q16.so.12 libGraphicsMagick++.so.12 \
		$pkgdir/usr/lib/x86_64-linux-gnu/org.hp.pcoip-client/vchan_plugins/libvchan-plugin-clipboard.so

	mv $pkgdir/usr/lib/x86_64-linux-gnu/org.hp.pcoip-client $pkgdir/usr/lib/
	rm -rf $pkgdir/usr/lib/x86_64-linux-gnu
}
