# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='hpuld'
pkgver='1.00.39.12_00.15'
pkgrel=3
pkgdesc='HP Unified Linux Driver'
arch=('i686' 'x86_64')
url='https://support.hp.com/'
license=('custom')
depends=('libcups' 'sane')
optdepends=('hal: hardware abstraction layer')
source=("https://ftp.hp.com/pub/softlib/software13/printers/MFP170/uld-hp_V${pkgver}.tar.gz"
	"https://ftp.hp.com/pub/softlib/software13/printers/IPG/M433/uld-hp.tar.gz"
       'fulfill_template.sh')
install="${pkgname}.install"
md5sums=('b20c5f5273f8d18077fe553919c7e3e9'
         '5355df6678e547b4de1d9f7a4b660f10'
         '056fbbf22b4e3b11c49fd33f88827304')
sha1sums=('51ed2e1265659cedf47fa5e7b9f8693a3d8cabaa'
          '030fe724635ad9d32cc5bc787b78f3a201707d26'
          '7c43df7f4a024a8aab3a47d5620b41c252f6cbde')

# Extract only the most recent version of the `uld` package...
noextract=("uld-hp.tar.gz")

_pkgcodename='uld'
_udev_rule_number=48

case "${CARCH}" in
	'x86_64')
		_platform='x86_64'
		;;
	*)
		_platform='i386'
		;;
esac


prepare() {

	[ -d "${srcdir}/uld-alt" ] && rm -rf "${srcdir}/uld-alt"
	mkdir "${srcdir}/uld-alt"
	tar -xzf "${srcdir}/uld-hp.tar.gz" -C "${srcdir}/uld-alt"

}


package() {

	cd "${srcdir}"

	chmod +x "${srcdir}/fulfill_template.sh"

	# Taken from uld/noarch/package_utils -> specify_vendor()
	local _vendor_lc="$(grep '^VENDOR=' "${srcdir}/${_pkgcodename}/noarch/oem.conf" 2>/dev/null | \
		sed 's/VENDOR=\(.*\)/\1/' | tr A-Z a-z)"


	# Follow the original `/opt/hp/printer/.files`...

	install -dm755 "${pkgdir}/opt"
	install -dm755 "${pkgdir}/opt/hp/printer/share/ppd/cms"
	install -dm755 "${pkgdir}/usr/share/cups/model"
	install -dm755 "${pkgdir}/usr/share/ppd"

	install -Dm644 "${srcdir}/${_pkgcodename}/noarch/share/ppd/"*.ppd \
		"${pkgdir}/opt/hp/printer/share/ppd/"

	# Integrate the .ppd files with the alternative `uld` package
	install -Dm644 "${srcdir}/uld-alt/${_pkgcodename}/noarch/share/ppd/"*.ppd \
		"${pkgdir}/opt/hp/printer/share/ppd/"

	install -Dm644 "${srcdir}/${_pkgcodename}/noarch/share/ppd/cms/"*.cts \
		"${pkgdir}/opt/hp/printer/share/ppd/cms/"

	# Integrate the .cts files with the alternative `uld` package
	install -Dm644 "${srcdir}/uld-alt/${_pkgcodename}/noarch/share/ppd/cms/"*.cts \
		"${pkgdir}/opt/hp/printer/share/ppd/cms/"

	install -Dm644 "${srcdir}/${_pkgcodename}/noarch/.version-printer-script" \
		"${pkgdir}/opt/hp/printer/.version"

	ln -s '/opt/hp/printer/share/ppd' \
		"${pkgdir}/usr/share/cups/model/uld-hp"

	ln -s '/opt/hp/printer/share/ppd' \
		"${pkgdir}/usr/share/ppd/uld-hp"


	# Follow the original `/opt/hp/scanner/.files`...

	install -dm755 "${pkgdir}/etc/sane.d"
	install -dm755 "${pkgdir}/etc/udev/rules.d"
	install -dm755 "${pkgdir}/usr/share/hal/fdi/policy/10osvendor"

	install -Dm644 "${srcdir}/${_pkgcodename}/noarch/oem.conf" \
		"${pkgdir}/opt/hp/scanner/share/oem.conf"

	install -Dm644 "${srcdir}/${_pkgcodename}/noarch/.version-scanner-script" \
		"${pkgdir}/opt/hp/scanner/.version"

	install -Dm644 "${srcdir}/${_pkgcodename}/noarch/etc/smfp.conf" \
		"${pkgdir}/etc/sane.d/smfp-hp.conf"

	"${srcdir}/fulfill_template.sh" "${srcdir}/${_pkgcodename}/noarch/oem.conf" \
		"${srcdir}/${_pkgcodename}/noarch/etc/smfp.rules.in" \
		"${pkgdir}/etc/udev/rules.d/${_udev_rule_number}-smfp_${_vendor_lc}.rules"

	chmod 644 "${pkgdir}/etc/udev/rules.d/${_udev_rule_number}-smfp_${_vendor_lc}.rules"

	"${srcdir}/fulfill_template.sh" "${srcdir}/${_pkgcodename}/noarch/oem.conf" \
		"${srcdir}/${_pkgcodename}/noarch/etc/smfp.fdi.in" \
		"${pkgdir}/usr/share/hal/fdi/policy/10osvendor/01_smfp_${_vendor_lc}.fdi"


	# Follow the original `/opt/smfp-common/legacy_compat/.files`...

	install -dm755 "${pkgdir}/opt/smfp-common/legacy_compat/.usedby"
	echo '0.1' > "${pkgdir}/opt/smfp-common/legacy_compat/.version"


	# Follow the original `/opt/smfp-common/security/.files`...

	install -dm755 "${pkgdir}/opt/smfp-common/security/.usedby"

	touch "${pkgdir}/opt/smfp-common/security/.firewall"
	echo '0.1' > "${pkgdir}/opt/smfp-common/security/.version"

	ln -s '/opt/smfp-common/security' \
		"${pkgdir}/opt/smfp-common/legacy_compat/.usedby/security"


	# Follow the original `/opt/smfp-common/printer/.files`...

	install -dm755 "${pkgdir}/opt/smfp-common/printer/bin"
	install -dm755 "${pkgdir}/opt/smfp-common/printer/lib"
	install -dm755 "${pkgdir}/opt/smfp-common/printer/.usedby"
	install -dm755 "${pkgdir}/usr/lib/cups/backend"
	install -dm755 "${pkgdir}/usr/lib/cups/filter"

	install -Dm644 "${srcdir}/${_pkgcodename}/${_platform}/libscmssc.so" \
		"${pkgdir}/opt/smfp-common/printer/lib/libscmssc.so"

	install -Dm755 "${srcdir}/${_pkgcodename}/${_platform}/smfpnetdiscovery" \
		"${pkgdir}/opt/smfp-common/printer/bin/smfpnetdiscovery"

	install -Dm755 "${srcdir}/${_pkgcodename}/${_platform}/rastertospl" \
		"${pkgdir}/opt/smfp-common/printer/bin/rastertospl"

	install -Dm755 "${srcdir}/${_pkgcodename}/${_platform}/pstosecps" \
		"${pkgdir}/opt/smfp-common/printer/bin/pstosecps"

	#install -Dm755 "${srcdir}/${_pkgcodename}/${_platform}/pstospl" \
		#"${pkgdir}/opt/smfp-common/printer/bin/pstospl"

	#install -Dm755 "${srcdir}/${_pkgcodename}/${_platform}/pstosplc" \
		#"${pkgdir}/opt/smfp-common/printer/bin/pstosplc"

	#install -Dm755 "${srcdir}/${_pkgcodename}/${_platform}/rastertosplc" \
		#"${pkgdir}/opt/smfp-common/printer/bin/rastertosplc"

	install -Dm644 "${srcdir}/${_pkgcodename}/noarch/.version-printer" \
		"${pkgdir}/opt/smfp-common/printer/.version"

	ln -s '/opt/smfp-common/printer/bin/smfpnetdiscovery' \
		"${pkgdir}/usr/lib/cups/backend/smfpnetdiscovery"

	ln -s '/opt/smfp-common/printer/bin/rastertospl' \
		"${pkgdir}/usr/lib/cups/filter/rastertospl"

	ln -s '/opt/smfp-common/printer/bin/pstosecps' \
		"${pkgdir}/usr/lib/cups/filter/pstosecps"

	#ln -s '/opt/smfp-common/printer/bin/pstospl' \
		#"${pkgdir}/usr/lib/cups/filter/pstospl"

	#ln -s '/opt/smfp-common/printer/bin/pstosplc' \
		#"${pkgdir}/usr/lib/cups/filter/pstosplc"

	#ln -s '/opt/smfp-common/printer/bin/rastertosplc' \
		#"${pkgdir}/usr/lib/cups/filter/rastertosplc"

	ln -s '/opt/hp/printer' \
		"${pkgdir}/opt/smfp-common/printer/.usedby/hp"

	ln -s '/opt/smfp-common/printer' \
		"${pkgdir}/opt/smfp-common/legacy_compat/.usedby/printer"

	ln -s '/opt/smfp-common/printer' \
		"${pkgdir}/opt/smfp-common/security/.usedby/printer"


	# Follow the original `/opt/smfp-common/scanner/.files`...

	install -dm755 "${pkgdir}/opt/smfp-common/scanner/lib"
	install -dm755 "${pkgdir}/opt/smfp-common/scanner/.usedby"
	install -dm755 "${pkgdir}/usr/lib/sane"

	install -Dm644 "${srcdir}/${_pkgcodename}/${_platform}/libsane-smfp.so.1.0.1" \
		"${pkgdir}/opt/smfp-common/scanner/lib/libsane-smfp.so.1.0.1"

	# Use the alternative `uld` package for the locale files...
	local _i18ndir="${srcdir}/uld-alt/${_pkgcodename}/noarch/share/locale"

	# Install all the languages present in `${_i18ndir}`
	(cd "${_i18ndir}" && find * -maxdepth 0 -type d \
		-exec install -dm755 "${pkgdir}/opt/smfp-common/scanner/share/locale/{}" \; \
		-exec install -Dm644 "${_i18ndir}/{}/LC_MESSAGES/sane-smfp.mo" \
			"${pkgdir}/opt/smfp-common/scanner/share/locale/{}/sane-smfp.mo" \; \
		-exec install -dm755 "${pkgdir}/usr/share/locale/{}/LC_MESSAGES" \; \
		-exec ln -s '/opt/smfp-common/scanner/share/locale/{}/sane-smfp.mo' \
			"${pkgdir}/usr/share/locale/{}/LC_MESSAGES/sane-smfp.mo" \;)

	install -Dm644 "${srcdir}/${_pkgcodename}/noarch/pagesize.xml" \
		"${pkgdir}/opt/smfp-common/scanner/share/pagesize.xml"

	install -Dm644 "${srcdir}/${_pkgcodename}/noarch/libsane-smfp.cfg" \
		"${pkgdir}/opt/smfp-common/scanner/share/libsane-smfp.cfg"

	install -Dm644 "${srcdir}/${_pkgcodename}/noarch/.version-scanner" \
		"${pkgdir}/opt/smfp-common/scanner/.version"

	ln -s '/opt/smfp-common/scanner/lib/libsane-smfp.so.1.0.1' \
		"${pkgdir}/usr/lib/sane/libsane-smfp.so.1.0.1"

	ln -s '/opt/smfp-common/scanner/lib/libsane-smfp.so.1.0.1' \
		"${pkgdir}/usr/lib/sane/libsane-smfp.so.1"

	ln -s '/opt/smfp-common/scanner/lib/libsane-smfp.so.1.0.1' \
		"${pkgdir}/usr/lib/sane/libsane-smfp.so"

	ln -s '/opt/hp/scanner' \
		"${pkgdir}/opt/smfp-common/scanner/.usedby/hp"

	ln -s '/opt/smfp-common/scanner' \
		"${pkgdir}/opt/smfp-common/legacy_compat/.usedby/scanner"

	ln -s '/opt/smfp-common/scanner' \
		"${pkgdir}/opt/smfp-common/security/.usedby/scanner"


	# license

	install -D -dm755 "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm644 "${srcdir}/${_pkgcodename}/noarch/license/"* "${pkgdir}/usr/share/licenses/${pkgname}/"


	# other files

	install -dm755 "${pkgdir}/opt/smfp-common/mfp/uninstall"
	touch "${pkgdir}/opt/smfp-common/mfp/uninstall/guiuninstall"

}

