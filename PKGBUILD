# Maintainer: Ashley Whetter <(firstname) @ awhetter.co.uk>
# Contributor: Patrik Pira
pkgname=('pcoip-client' 'pcoip-client-clipboard')
pkgver=25.10.1
pkgrel=1
_ubuntuver=22.04
pkgdesc='HP Anywhere PCOIP client'
url='https://anyware.hp.com/'
arch=('x86_64')
license=('custom:HPAnywhere')
depends=(
	'libcap>=2.10'
	'libxcb>=1.7.5'
	'pcsclite>=1.3.3'
	'alsa-lib>=1.0.17'
	#libatomic1 (>= 4.8) is gcc-libs which is in base
	#libc6 (>= 2.34) is glibc which is in base
	'dbus>=1.9.14'
	'libdrm>=2.4.38'
	'libglvnd'
	'expat>=2.1'
	'fontconfig>=2.12.6'
	'freetype2>=2.9.1'
	'mesa>=21.1.0'
	#libgcc-s1 (>= 3.4) is gcc-libs which is in base
	'glib2>=2.26.0'
	'krb5>=1.17'
	'nspr>=4.9'
	'nss>=3.30'
	'protobuf-21' #>=3.12.4
	'libpulse>=0.99.1'
	#libstdc++6 (>= 12) is gcc-libs which is in base
	'systemd>=183'
	'libva>=2.1.0'
	#'wayland>=1.15.0' the wayland Qt platform plugin does not work with system libQt6WaylandClient
	'libx11>=1.2.99.901'
	'xcb-util-image>=0.2.1'
	'xcb-util-keysyms>=0.4.0'
	'xcb-util-renderutil'
	'xcb-util-wm>=0.4.1'
	'xcb-util>=0.4.0'
	'libxext'
	'libxi>=1.2.99.4'
	'libxkbcommon-x11>=0.5.0'
	'zlib>=1.4.0'
	# Undeclared in .deb file
	'libpng>=1.6.2'
)
makedepends=('fakeroot' 'patchelf')
# Find the latest at
# https://dl.anyware.hp.com/DeAdBCiUYInHcSTy/pcoip-client/deb/ubuntu/dists/noble/main/binary-amd64/Packages
source=(
	"https://dl.anyware.hp.com/DeAdBCiUYInHcSTy/pcoip-client/deb/ubuntu/pool/jammy/main/p/pc/pcoip-client_${pkgver}-${_ubuntuver}/pcoip-client_${pkgver}-${_ubuntuver}_amd64.deb"
	'LICENSE.pdf::https://anyware.hp.com/sites/default/files/documents/2025-06/HP%20Anyware%20EULA_June2025_0.pdf'
)
sha256sums=(
	'68439e6f51f0b79c9a8602716025b832e0fdc9bdb06357dfad6d406debe47339'
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
	# We can't move /usr/libexec to /usr/lib or we get runtime errors
	#mv $pkgdir/usr/libexec/pcoip-client $pkgdir/usr/lib/
	#rm -rf $pkgdir/usr/libexec
	#ln -sf /usr/lib/pcoip-client/pcoip-client $pkgdir/usr/bin

	# Patch the bundled Qt to look at the bundled Qt libraries not the system ones.
	#find $pkgdir/usr/lib/x86_64-linux-gnu/pcoip-client/ -type f -name '*.so' | \
	#	xargs -I '{}' sh -c 'patchelf --set-rpath \$ORIGIN/$(realpath --relative-to=$(dirname {}) '"$pkgdir"'/usr/lib/x86_64-linux-gnu/pcoip-client/) {}'
	ln -s '.' $pkgdir/usr/lib/x86_64-linux-gnu/pcoip-client/lib

	#chmod +x "$pkgdir"/usr/lib/x86_64-linux-gnu/pcoip-client/lib*so*

	setcap "cap_setgid+p" "$pkgdir/usr/libexec/pcoip-client/pcoip-client"
	setcap "cap_setgid+i" "$pkgdir/usr/libexec/pcoip-client/usb-helper"

	# Remove urlhandler as it collides with the dedicated urlhandler
	sed -i -e 's!MimeType=x-scheme-handler/pcoip;!!' \
		$pkgdir/usr/share/applications/pcoip-client.desktop

	install -Dm644 'LICENSE.pdf' "$pkgdir/usr/share/licenses/$pkgname/LICENSE.pdf"
}

package_pcoip-client-clipboard() {
	pkgdesc='HP Anywhere PCOIP client clipboard synchronization plugin'
	depends=('pcoip-client' 'graphicsmagick>=1.3.26')

	tar -C $pkgdir/ -xvf $srcdir/pcoip-client/data.tar.gz \
		./usr/lib/x86_64-linux-gnu/org.hp.pcoip-client/vchan_plugins/libvchan-plugin-clipboard.so
	chmod +x $pkgdir/usr/lib/x86_64-linux-gnu/org.hp.pcoip-client/vchan_plugins/libvchan-plugin-clipboard.so
	patchelf --replace-needed libGraphicsMagick++-Q16.so.12 libGraphicsMagick++.so.12 \
		$pkgdir/usr/lib/x86_64-linux-gnu/org.hp.pcoip-client/vchan_plugins/libvchan-plugin-clipboard.so
}
