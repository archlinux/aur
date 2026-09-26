# Maintainer: Slavi Pantaleev <slavi at devture.com>

pkgname=bit4id-pki-manager
pkgver=1.4.11.836
pkgrel=2
pkgdesc="Bit4ID PKI Manager application"
arch=('x86_64')
license=('unknown')
url="https://cdn.bit4id.com/es/middleware.htm"
options=('!strip')
# The app loads the system's /usr/lib/libpcsclite.so.1 and talks to pcscd.
# ccid provides the driver for most USB card readers.
depends=('pcsclite' 'ccid')

# Upstream (Bit4id) publishes an unversioned zip (containing a .deb and an .rpm),
# so we save it under a versioned name. The checksum will break when upstream replaces it with a newer release.
source=("Bit4id_Middleware-${pkgver}.zip::https://cdn.bit4id.com/es/soporte/downloads/middleware/Bit4id_Middleware.zip")
noextract=("Bit4id_Middleware-${pkgver}.zip")
sha256sums=('0f6d45d1f7d550f9188404feb23f977b8b19b4b7f5475eef8fc79647d9be9ff5')

prepare() {
	bsdtar -xf "Bit4id_Middleware-${pkgver}.zip" Bit4id_Middleware.deb
}

package() {
	bsdtar -xOf Bit4id_Middleware.deb data.tar.xz | bsdtar -xf - -C "$pkgdir"

	# Remove drivers. They are packaged separately (as `bit4id-xpki`).
	rm -rf "$pkgdir/usr/lib/bit4id"
	rm -rf "$pkgdir/usr/share/bit4id/ccid"

	# The app runs on its own bundled glibc, but loads the system's /usr/lib/libpcsclite.so.1 (hardcoded path).
	# With pcsclite >= 2.x, that is a thin wrapper which loads `libpcsclite_real.so.1`, which requires a newer glibc than the bundled one,
	# so the app finds no readers. The wrapper searches the app's LD_LIBRARY_PATH first,
	# so we point it at the bundled (compatible) client library.
	ln -s libpcsclite.so.1 "$pkgdir/usr/share/bit4id/x/pinmanager/lib/libpcsclite_real.so.1"

	# Upstream's postinst copies this into place, but we don't run it.
	# We also drop lines that `desktop-file-validate` complains about.
	install -Dm644 "$pkgdir/usr/share/bit4id/x/bit4pin.desktop" "$pkgdir/usr/share/applications/bit4id-pki-manager.desktop"
	sed -i '/^Encoding=/d; /^GenericName\[en_US\]=$/d' "$pkgdir/usr/share/applications/bit4id-pki-manager.desktop"
}
