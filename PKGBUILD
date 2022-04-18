# Maintainer: KatTheFox <katthefoxmaid at gmail dot com>
# Contributor: 7k5x <7k5xlp0onfire at gmail dot com>
# Submitter : djnk8 <djnk8 at mailinator dot com>
pkgname='band'
pkgver=1.10.10
pkgrel=1
pkgdesc='BAND desktop application'
arch=('x86_64')
source=(
	"https://ssl.pstatic.net/cmstatic/desktop/v${pkgver}/BAND-${pkgver}-amd64.deb"
	'LICENSE'
)
url='https://band.us/'
license=('custom:band')
depends=('xdg-utils' 'util-linux-libs' 'pango' 'nss' 'nspr' 'mesa' 'libxtst' 'libxss' 'libxrender' 'libxrandr' 'libxi' 'libxext' 'libxdamage' 'libxcursor' 'libxcomposite' 'libxcb' 'libx11' 'libsecret' 'libnotify' 'libdrm' 'libcups' 'libappindicator-gtk3' 'hicolor-icon-theme' 'gtk3' 'glibc' 'glib2' 'gdk-pixbuf2' 'gcc-libs' 'expat' 'desktop-file-utils' 'dbus' 'cairo' 'atk' 'at-spi2-core' 'at-spi2-atk' 'alsa-lib')
sha256sums=(
	'c1ed7394c5e6cf010248b241cda9a5249e80930d8c628a5beb15c85ba9422853'
	'263470054abd943b85dd3fa80807b8747d93dcc514cfc64f547e5029cc48d169'
)
pre_install() {

	# 설치전 작업

	# 1. kill BAND process
	echo "Closing BAND Desktop..."
	while pkill -TERM -f "/usr/share/BAND/BAND" > /dev/null
	do
	    sleep 1
	done

}

post_install() {
	gtk-update-icon-cache -q -t -f usr/share/icons/hicolor

	# Link to the binary
	ln -sf '/opt/BAND/band' '/usr/bin/band'

	# SUID chrome-sandbox for Electron 5+
	chmod 4755 '/opt/BAND/chrome-sandbox' || true

	update-mime-database /usr/share/mime || true
	update-desktop-database /usr/share/applications || true
	update-desktop-database -q
}

pre_upgrade() {
	pre_install
}

post_upgrade() {
	post_install
}

post_remove() {
	gtk-update-icon-cache -q -t -f usr/share/icons/hicolor

	# Delete the link to the binary
	rm -f '/usr/bin/band'
	update-desktop-database -q
}

package() {
	msg2 "Extracting package binaries(data.tar.xz)..."
	bsdtar -xf ${srcdir}/data.tar.xz -C "${pkgdir}/"
	install -Dm644 -t "${pkgdir}/usr/share/licenses/band/LICENSE" ${srcdir}/LICENSE
}
