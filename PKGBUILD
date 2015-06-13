# Maintainer: Bernd Amend <berndamend gmail com>

pkgname=samsung-unified-driver
pkgver=1.00.21
pkgrel=3

pkgdesc="Unified Linux Driver for Samsung printers and scanners."
arch=(i686 x86_64 armel)
url="http://www.samsung.com"
license=('custom:samsung')
depends=('libxml2' 'libusb-compat' 'cups' 'ghostscript' 'sane' 'avahi' 'openssl')
provides=('samsung-unified-driver')

options=(!strip)

source=("http://www.bchemnet.com/suldr/driver/UnifiedLinuxDriver-${pkgver}.tar.gz")

sha512sums=('087dde382015f85e4b7f485b382089441b2fa7258d396a86cdb68b280f7675b7e120cf4c513a61c516910e32cd7deefef306528ba167e706c3aea98643065e80')

if [ "$CARCH" = "i686" ]; then
	CARCHCUSTOM="i386"
elif [ "$CARCH" = "armel" ]; then
	CARCHCUSTOM="arm"
else
	CARCHCUSTOM="$CARCH"
fi

# TODO: install the license file

package_general() {
	DIST_DIR="${noarchsrcdir}/../"
	SCRIPT_DIR="${noarchsrcdir}"

	OEM_FILE="${noarchsrcdir}/oem.conf"
	INSTALL_LOG_FILE="${srcdir}/install.log"
	. "${noarchsrcdir}/scripting_utils"
	. "${noarchsrcdir}/package_utils"
	. "${noarchsrcdir}/scanner-script.pkg"

	install -d "${pkgdir}/etc/udev/rules.d"
	fill_full_template "${noarchsrcdir}/etc/smfp.rules.in" "${pkgdir}/etc/udev/rules.d/60_smfp_samsung.rules"
}

package_cups() {
# noarch
	# ppd
	install -d "${pkgdir}/usr/share/cups/model/suld"
	install -m 644 -t "${pkgdir}/usr/share/cups/model/suld/" ${noarchsrcdir}/share/ppd/*.ppd
	find "${pkgdir}/usr/share/cups/model/suld/" -name "*.ppd" | xargs gzip -9

	# cms
	install -d "${pkgdir}/usr/share/cups/model/suld/cms"
	install -m 444 -t "${pkgdir}/usr/share/cups/model/suld/cms/" ${noarchsrcdir}/share/ppd/cms/*

# binaries
	cupsdir="${pkgdir}/usr/lib/cups"

	# backend
	cupsbackenddir="${cupsdir}/backend"
	install -d "${cupsbackenddir}"
	install -m 755 "${archsrcdir}/smfpnetdiscovery" "${cupsbackenddir}"

	# filter
	cupsfilterdir="${cupsdir}/filter"
	install -d "${cupsfilterdir}"
	install -m 755 "${archsrcdir}/pstosecps" "${archsrcdir}/rastertospl" "${cupsfilterdir}"

	cd "${cupsfilterdir}"
	ln -s rastertospl rastertosplc
	cd -

	# libscmssc.so
	install -d "${pkgdir}/usr/lib"
	install -m 755 "${archsrcdir}/libscmssc.so" "${pkgdir}/usr/lib/"
}

package_sane() {
# noarch
	install -d "${pkgdir}/etc/sane.d/"
	install -m 644 "${noarchsrcdir}/etc/smfp.conf" "${pkgdir}/etc/sane.d/"

	install -d "${pkgdir}/etc/sane.d/dll.d"
	echo "smfp" > "${pkgdir}/etc/sane.d/dll.d/smfp"
	chmod 644 "${pkgdir}/etc/sane.d/dll.d/smfp"

# binaries
	install -d "${pkgdir}/usr/lib/sane"
	install -m 755 "${archsrcdir}/libsane-smfp.so.1.0.1" "${pkgdir}/usr/lib/sane/"

	# TODO: how can we automatically create them?
	#create symbolic links
	cd "${pkgdir}/usr/lib/sane"
	ln -s libsane-smfp.so.1.0.1 libsane-smfp.so.1
	ln -s libsane-smfp.so.1 libsane-smfp.so
	cd -

# The following is copied from the bchemnet.com debian packages
# It is required to scan using sane
	echo "xerox_mfp-smfp" > "${pkgdir}/etc/sane.d/dll.d/smfp-scanner-fix"
	chmod 644 "${pkgdir}/etc/sane.d/dll.d/smfp-scanner-fix"

	# TODO: Can we extract the following information from the samsung package e.g. oem.conf?
	# The following information is taken from the old driver package
	echo -e "#xerox_mfp-smfp.conf\n\n# Samsung CLX-2160\nusb 0x04e8 0x3425\n\n# Samsung CLX-3170FN & CLX-3175FW\nusb 0x04e8 0x342a\n\n# Samsung CLX-3185\nusb 0x04e8 0x343d\n\n# Samsung CLX-3300\nusb 0x04e8 0x3456\n\n# Samsung SCX-3200 & SCX-3205W\nusb 0x04e8 0x3441\n\n# Samsung SCX-3405W\nusb 0x04e8 0x344f\n\n# Samsung SCX-4100\nusb 0x04e8 0x3413\n\n# Samsung SCX-4200\nusb 0x04e8 0x341b\n\n# Samsung SCX-4216F\nusb 0x04e8 0x3409\n\n# Samsung SCX-4300\nusb 0x04e8 0x342e\n\n# Samsung SCX-4500\nusb 0x04e8 0x3426\n\n# Samsung SCX-4500W\nusb 0x04e8 0x342b\n\n# Samsung SCX-4521F\nusb 0x04e8 0x3419\n\n# Samsung SCX-4600\nusb 0x04e8 0x3433\n\n# Samsung SCX-4623\nusb 0x04e8 0x3434\n\n# Samsung SCX-4623FW\nusb 0x04e8 0x3440\n\n# Samsung SCX-4725FN\nusb 0x04e8 0x341f\n\n# Samsung SCX-4824\nusb 0x04e8 0x342c\n\n# Samsung SCX-4825FN\nusb 0x04e8 0x343c\n\n# Samsung SCX-4828FN (4x28 Series)\nusb 0x04e8 0x342d\n\n# Samsung SCX-4833FD\nusb 0x04e8 0x344b" > "${pkgdir}/etc/sane.d/xerox_mfp-smfp"

	chmod 644 "${pkgdir}/etc/sane.d/xerox_mfp-smfp"
}

package() {
	noarchsrcdir="${srcdir}/uld/noarch"
	archsrcdir="${srcdir}/uld/${CARCHCUSTOM}"

	package_general
	package_cups
	package_sane
}
