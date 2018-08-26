# Maintainer: Fedor Piecka <teplavoda at gmail dot com>

pkgname=eidklient
pkgver=2.0.2
pkgrel=1
pkgdesc="Slovak eID Client"
arch=('i686' 'x86_64')
url="https://www.slovensko.sk/"
license=('custom')
depends=("glibc" "qt4" "pcsclite" "qt5-imageformats" "ccid" "openssl" "chrpath" )
source_i686=('https://eidas.minv.sk/TCTokenService/download/linux/debian/Aplikacia_pre_eID_i386_debian.tar.gz')
source_x86_64=('https://eidas.minv.sk/TCTokenService/download/linux/debian/Aplikacia_pre_eID_amd64_debian.tar.gz')
md5sums_i686=('SKIP')
md5sums_x86_64=('SKIP')
options=("!strip")

# Upstream uses Debian architecture naming convention. Let's prepare a variable for that.
upstream_arch=
[[ "$CARCH" == "x86_64" ]] && upstream_arch="amd64"
[[ "$CARCH" == "i686" ]] && upstream_arch="i386"


pkgver() {
	# Match Debian package version
	ar p ${srcdir}/Aplikacia_pre_eID_${upstream_arch}_debian.deb control.tar.gz | tar -Oxz ./control | grep ^Version: | cut -f2 -d" " | tr -d '[:space:]'
}

package() {
	ar p ${srcdir}/Aplikacia_pre_eID_${upstream_arch}_debian.deb data.tar.gz | tar -xz -C "${pkgdir}"
	
	# Upstream update script is for Debian. Use AUR for updates in Arch.
	rm ${pkgdir}/usr/bin/eac_mw_klient-update

	# I don't think the 2 files directly / are required
	rm ${pkgdir}/{Aplikacia_pre_eID_amd64_debian.deb,eClientAppIntegrityGen}

	# Move desktop file to the system-wide XDG Data directory
	mkdir -p ${pkgdir}/usr/share/applications
	mv ${pkgdir}/usr/lib/eac_mw_klient/EAC_MW_klient_launcher.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop

	# The application requires the libraries in a specific location
	ln -sf /usr/lib/qt/plugins/imageformats/libqtga.so ${pkgdir}/usr/lib/eac_mw_klient/
	ln -sf /usr/lib/qt4/plugins/imageformats/libqgif.so ${pkgdir}/usr/lib/eac_mw_klient/
	ln -sf /usr/lib/qt4/plugins/imageformats/libqico.so ${pkgdir}/usr/lib/eac_mw_klient/
	ln -sf /usr/lib/qt4/plugins/imageformats/libqjpeg.so ${pkgdir}/usr/lib/eac_mw_klient/
	ln -sf /usr/lib/qt4/plugins/imageformats/libqmng.so ${pkgdir}/usr/lib/eac_mw_klient/
	ln -sf /usr/lib/qt4/plugins/imageformats/libqsvg.so ${pkgdir}/usr/lib/eac_mw_klient/
	ln -sf /usr/lib/qt4/plugins/imageformats/libqtiff.so ${pkgdir}/usr/lib/eac_mw_klient/
}
