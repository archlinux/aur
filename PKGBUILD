# Maintainer: Matthew Hiles <matthew.hiles@hpe.com>
pkgname=via
pkgver=4.2.0.2105106
pkgrel=3
epoch=
pkgdesc="Aruba Networks' Virtual Intranet Access (VIA)"
arch=('x86_64')
url="https://asp.arubanetworks.com/downloads;fileTypes=SOFTWARE;products=Aruba%20Virtual%20Intranet%20Access%20%28VIA%29;fileContents=Linux"
license=('unknown') # have not been able to find this
groups=()
# auto generated dpends might be excessive...
depends=(brotli bzip2 dbus double-conversion e2fsprogs freetype2 gcc-libs glib2 glibc graphite harfbuzz icu keyutils krb5 libcap libffi libgcrypt libglvnd libgpg-error libnm libpng libproxy libx11 libxau libxcb libxdmcp libxml2 lz4 md4c nspr nss openssl pcre pcre2 qt5-base systemd-libs tdb util-linux-libs via xz zlib zstd)
makedepends=()
checkdepends=()
optdepends=(networkmanager)
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
options=(!strip)
source=("https://h30326.www3.hpe.com/hpn/via-${pkgver}-rpm.x86_64.rpm?merchantId=ASP_DROPBOX")
noextract=()
sha256sums=('ef2bee83b0041e33b4250f0c53f6d25365182daee5723d2b6c04e80c203cdbcf')
validpgpkeys=()

prepare() {
	cd "$srcdir"
	## Make work with arch's root fs layout
	cd usr
	mv lib64 lib
	cd ..
	## fix up some file conflicts with via (the QMK keyboard configurator)
	find -name via.png -execdir mv {} anvia.png \;
	mv usr/share/applications/via.desktop usr/share/applications/anvia.desktop
	sed -i -e 's/Icon=via/Icon=anvia/' usr/share/applications/anvia.desktop
}

package() {
	#cd "$pkgname-$pkgver"
	cp -R "$srcdir/usr" "$srcdir/etc" "$pkgdir/"
	cp -R "$srcdir/lib64/security" "$pkgdir/usr/lib/"
	## autostart by default is bad :|
	rm "${pkgdir}/etc/xdg/autostart/via-auto.desktop"
	rmdir "${pkgdir}/etc/xdg/autostart"
	rmdir "${pkgdir}/etc/xdg"
	#rpmextract.sh ../$pkgname-$pkgver*.rpm*
}
