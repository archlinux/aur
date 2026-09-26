# Maintainer: Slavi Pantaleev <slavi at devture.com>

pkgname=bit4id-xpki
pkgver=1.4.11.836
pkgrel=2
pkgdesc="Bit4ID Universal Middleware (Smart Card driver)"
arch=('x86_64')
license=('unknown')
url="https://cdn.bit4id.com/es/middleware.htm"
install=$pkgname.install
options=('!strip')
backup=('usr/lib/bit4id/libbit4xpki.so.conf')
# Older bit4id-ipki versions shipped their own copy of /usr/lib/bit4id/libbit4xpki.so.
# Newer ones are an add-on on top of this package.
conflicts=('bit4id-ipki<1.4.10.542-4')

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

	# Remove pinmanager. It's packaged separately (as `bit4id-pki-manager`).
	rm -rf "$pkgdir/usr/share/bit4id/x"

	# Remove Bit4id's bundled CCID driver. Only Debian's postinst installs it; we rely on Arch's `ccid` package instead.
	rm -rf "$pkgdir/usr/share/bit4id/ccid"
	rmdir "$pkgdir/usr/share/bit4id" "$pkgdir/usr/share"
}
