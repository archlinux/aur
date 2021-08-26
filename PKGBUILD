# Maintainer : djnk8 <djnk8@mailinator.com>
pkgname='band'
pkgver=1.10.7
pkgrel=1
pkgdesc='BAND desktop application'
arch=('x86_64')
source=(
	'https://ssl.pstatic.net/cmstatic/desktop/v1.10.7/BAND-1.10.7-amd64.deb'
)
url='https://www.hancom.com/'
license=('custom:band')
depends=('xdg-utils' 'util-linux-libs' 'pango' 'nss' 'nspr' 'mesa' 'libxtst' 'libxss' 'libxrender' 'libxrandr' 'libxi' 'libxext' 'libxdamage' 'libxcursor' 'libxcomposite' 'libxcb' 'libx11' 'libsecret' 'libnotify' 'libdrm' 'libcups' 'libappindicator-gtk3' 'hicolor-icon-theme' 'gtk3' 'glibc' 'glib2' 'gdk-pixbuf2' 'gcc-libs' 'expat' 'desktop-file-utils' 'dbus' 'cairo' 'atk' 'at-spi2-core' 'at-spi2-atk' 'alsa-lib')
sha256sums=(
	'c2062e680c2477e5314c333e91b965419c15154cccc015e10a9291857e49423b'
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
}
