# Maintainer: Slavi Pantaleev <slavi at devture.com>

pkgname=infonotary-client-software
pkgver=3.0.28
pkgrel=1
pkgdesc="InfoNotary client software - InfoNotary e-Doc Signer and InfoNotary Smart Card Manager."
arch=('x86_64')
url="http://www.infonotary.com/"
license=('unknown')
# Version 3 is a jpackage'd Java (Swing + JavaFX/GTK3) application with a bundled JRE.
# The deb only declares `xdg-utils`; the rest was determined by inspecting the bundled native libraries.
depends=(
	glibc
	zlib
	libgcc
	libstdc++
	gtk3
	freetype2
	fontconfig
	libx11
	libxext
	libxrender
	libxtst
	libxi
	libxxf86vm
	libgl
	pcsclite
	xdg-utils
	hicolor-icon-theme
)
replaces=(infonotary-scardmanager)
conflicts=(infonotary-scardmanager)
optdepends=(
	'ccid: generic USB Chip/Smart Card Interface Devices driver'
	'omnikey_ifdokccid: driver for OmniKey smart card readers'
	'bit4id-ipki: Bit4ID Universal Middleware (Smart Card driver)'
	'bit4id-xpki: Bit4ID Universal Middleware (Smart Card driver)'
	'sac-core: SafeNet Authentication Client (Smart Card driver for Thales/Gemalto IDPrime)'
	'pcsc-tools: smartcard tools (pcsc_scan)'
	'opensc: a set of libraries and utilities to work with smart cards'
	'alsa-lib: sound support'
)
source=('http://repository.infonotary.com/install/linux/DEBS24/pool/non-free/i/infonotary-client-software/infonotary-client-software_'$pkgver'_all.deb')
sha256sums=('077e592e3dc2d4e6cfd1d9ca25646ed3a1bad2d6937a1eca6e0b4418ae2a4284')
install=$pkgname.install

package() {
	bsdtar -xf "$srcdir/infonotary-client-software_${pkgver}_all.deb" 'data.tar.*'
	bsdtar -xf data.tar.* -C "$pkgdir" --no-same-owner --no-same-permissions

	# The deb mistakenly ships a per-user Thunar custom-actions file (`~/.config/Thunar/uca.xml`) at `/.config`.
	rm -r "$pkgdir/.config"

	# The deb ships files with odd permissions (group-writable, 754, executable data files, ..)
	chmod -R go-w "$pkgdir"
	chmod 755 "$pkgdir"/usr/bin/*
	chmod 644 "$pkgdir"/usr/share/applications/*.desktop "$pkgdir"/usr/share/mime/packages/*.xml
	find "$pkgdir/usr/share/icons" -type f -exec chmod 644 {} +
}
