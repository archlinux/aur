# Maintainer: grufo <madmurphy333 AT gmail DOT com>

pkgname='hp-mfp-10x-17x'
pkgver='1.00.39.12_00.15'
pkgrel=2
pkgdesc='Multi-function peripherals (MFPs) drivers for Hewlett-Packard Laser 10x Series, Laser MFP 13x Series, Color Laser 15x Series, Color Laser MFP 17x Series'
arch=('i686' 'x86_64')
url='https://support.hp.com/'
license=('custom')
depends=('sane')
optdepends=('hal: hardware abstraction layer')
source=("https://ftp.hp.com/pub/softlib/software13/printers/MFP170/uld-hp_V${pkgver}.tar.gz"
       'fulfill_template.sh')
install="${pkgname}.install"
md5sums=('b20c5f5273f8d18077fe553919c7e3e9'
         'b84b3eb12e61cfc874be619babf6eb11')
sha1sums=('51ed2e1265659cedf47fa5e7b9f8693a3d8cabaa'
          '8dc4e15836ee71c2b67e3ca54929b0380af6ae46')

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


package() {

	cd "${srcdir}"

	# Taken from uld/noarch/package_utils -> specify_vendor()
	local _vendor_lc="$(grep '^VENDOR=' "${srcdir}/${_pkgcodename}/noarch/oem.conf" 2>/dev/null | \
		sed 's/VENDOR=\(.*\)/\1/' | tr A-Z a-z)"


	# Follow the original /opt/hp/printer/.files ...

	install -dm755 "${pkgdir}/opt"
	install -dm755 "${pkgdir}/opt/hp/printer/share/ppd/cms"
	install -dm755 "${pkgdir}/usr/share/cups/model"
	install -dm755 "${pkgdir}/usr/share/ppd"

	install -Dm755 "${srcdir}/${_pkgcodename}/noarch/share/ppd/"*.ppd \
		"${pkgdir}/opt/hp/printer/share/ppd/"

	install -Dm755 "${srcdir}/${_pkgcodename}/noarch/share/ppd/cms/"*.cts \
		"${pkgdir}/opt/hp/printer/share/ppd/cms/"

	install -Dm755 "${srcdir}/${_pkgcodename}/noarch/.version-printer-script" \
		"${pkgdir}/opt/hp/printer/.version"

	ln -s '/opt/hp/printer/share/ppd' "${pkgdir}/usr/share/cups/model/uld-hp"
	ln -s '/opt/hp/printer/share/ppd' "${pkgdir}/usr/share/ppd/uld-hp"


	# Follow the original /opt/hp/scanner/.files ...

	install -dm755 "${pkgdir}/etc/sane.d"
	install -dm755 "${pkgdir}/etc/udev/rules.d"
	install -dm755 "${pkgdir}/usr/share/hal/fdi/policy/10osvendor"

	install -Dm755 "${srcdir}/${_pkgcodename}/noarch/oem.conf" \
		"${pkgdir}/opt/hp/scanner/share/oem.conf"

	install -Dm755 "${srcdir}/${_pkgcodename}/noarch/.version-scanner-script" \
		"${pkgdir}/opt/hp/scanner/.version"

	install -Dm755 "${srcdir}/${_pkgcodename}/noarch/etc/smfp.conf" \
		"${pkgdir}/etc/sane.d/smfp-hp.conf"

	./fulfill_template.sh "${srcdir}/${_pkgcodename}/noarch/etc/smfp.rules.in" \
		"${pkgdir}/etc/udev/rules.d/${_udev_rule_number}-smfp_${_vendor_lc}.rules" \
		"${srcdir}/${_pkgcodename}/noarch/oem.conf"

	./fulfill_template.sh "${srcdir}/${_pkgcodename}/noarch/etc/smfp.fdi.in" \
		"${pkgdir}/usr/share/hal/fdi/policy/10osvendor/01_smfp_${_vendor_lc}.fdi" \
		"${srcdir}/${_pkgcodename}/noarch/oem.conf"


	# Follow the original /opt/smfp-common/legacy_compat/.files ...

	install -dm755 "${pkgdir}/opt/smfp-common/legacy_compat/.usedby"
	echo '0.1' > "${pkgdir}/opt/smfp-common/legacy_compat/.version"


	# Follow the original /opt/smfp-common/security/.files ...

	install -dm755 "${pkgdir}/opt/smfp-common/security/.usedby"

	touch "${pkgdir}/opt/smfp-common/security/.firewall"
	echo '0.1' > "${pkgdir}/opt/smfp-common/security/.version"
	ln -s '/opt/smfp-common/security' "${pkgdir}/opt/smfp-common/legacy_compat/.usedby/security"


	# Follow the original /opt/smfp-common/printer/.files ...

	install -dm755 "${pkgdir}/opt/smfp-common/printer/bin"
	install -dm755 "${pkgdir}/opt/smfp-common/printer/lib"
	install -dm755 "${pkgdir}/opt/smfp-common/printer/.usedby"
	install -dm755 "${pkgdir}/usr/lib/cups/backend"
	install -dm755 "${pkgdir}/usr/lib/cups/filter"

	install -Dm755 "${srcdir}/${_pkgcodename}/${_platform}/libscmssc.so" \
		"${pkgdir}/opt/smfp-common/printer/lib/libscmssc.so"

	install -Dm755 "${srcdir}/${_pkgcodename}/${_platform}/smfpnetdiscovery" \
		"${pkgdir}/opt/smfp-common/printer/bin/smfpnetdiscovery"

	#install -Dm755 "${srcdir}/${_pkgcodename}/${_platform}/pstospl" \
		#"${pkgdir}/opt/smfp-common/printer/bin/pstospl"

	#install -Dm755 "${srcdir}/${_pkgcodename}/${_platform}/pstosplc" \
		#"${pkgdir}/opt/smfp-common/printer/bin/pstosplc"

	install -Dm755 "${srcdir}/${_pkgcodename}/${_platform}/rastertospl" \
		"${pkgdir}/opt/smfp-common/printer/bin/rastertospl"

	install -Dm755 "${srcdir}/${_pkgcodename}/${_platform}/pstosecps" \
		"${pkgdir}/opt/smfp-common/printer/bin/pstosecps"

	#install -Dm755 "${srcdir}/${_pkgcodename}/${_platform}/rastertosplc" \
		#"${pkgdir}/opt/smfp-common/printer/bin/rastertosplc"

	install -Dm755 "${srcdir}/${_pkgcodename}/noarch/.version-printer" \
		"${pkgdir}/opt/smfp-common/printer/.version"

	ln -s '/opt/smfp-common/printer/bin/smfpnetdiscovery' "${pkgdir}/usr/lib/cups/backend/smfpnetdiscovery"
	#ln -s '/opt/smfp-common/printer/bin/pstospl' "${pkgdir}/usr/lib/cups/filter/pstospl"
	#ln -s '/opt/smfp-common/printer/bin/pstosplc' "${pkgdir}/usr/lib/cups/filter/pstosplc"
	ln -s '/opt/smfp-common/printer/bin/rastertospl' "${pkgdir}/usr/lib/cups/filter/rastertospl"
	ln -s '/opt/smfp-common/printer/bin/pstosecps' "${pkgdir}/usr/lib/cups/filter/pstosecps"
	#ln -s '/opt/smfp-common/printer/bin/rastertosplc' "${pkgdir}/usr/lib/cups/filter/rastertosplc"
	ln -s '/opt/hp/printer' "${pkgdir}/opt/smfp-common/printer/.usedby/hp"
	ln -s '/opt/smfp-common/printer' "${pkgdir}/opt/smfp-common/legacy_compat/.usedby/printer"
	ln -s '/opt/smfp-common/printer' "${pkgdir}/opt/smfp-common/security/.usedby/printer"


	# Follow the original /opt/smfp-common/scanner/.files ...

	install -dm755 "${pkgdir}/opt/smfp-common/scanner/lib"
	install -dm755 "${pkgdir}/opt/smfp-common/scanner/.usedby"
	install -dm755 "${pkgdir}/opt/smfp-common/scanner/share/locale/zh_CN"
	install -dm755 "${pkgdir}/usr/share/locale/zh_CN/LC_MESSAGES"
	install -dm755 "${pkgdir}/usr/lib/sane"

	install -Dm755 "${srcdir}/${_pkgcodename}/${_platform}/libsane-smfp.so.1.0.1" \
		"${pkgdir}/opt/smfp-common/scanner/lib/libsane-smfp.so.1.0.1"

	install -Dm755 "${srcdir}/${_pkgcodename}/noarch/share/locale/zh_CN/LC_MESSAGES/sane-smfp.mo" \
		"${pkgdir}/opt/smfp-common/scanner/share/locale/zh_CN/sane-smfp.mo"

	install -Dm755 "${srcdir}/${_pkgcodename}/noarch/share/locale/zh_CN/LC_MESSAGES/sane-smfp.mo" \
		"${pkgdir}/usr/share/locale/zh_CN/LC_MESSAGES/sane-smfp.mo"

	install -Dm755 "${srcdir}/${_pkgcodename}/noarch/pagesize.xml" \
		"${pkgdir}/opt/smfp-common/scanner/share/pagesize.xml"

	install -Dm755 "${srcdir}/${_pkgcodename}/noarch/libsane-smfp.cfg" \
		"${pkgdir}/opt/smfp-common/scanner/share/libsane-smfp.cfg"

	install -Dm755 "${srcdir}/${_pkgcodename}/noarch/.version-scanner" \
		"${pkgdir}/opt/smfp-common/scanner/.version"

	ln -s '/opt/smfp-common/scanner/lib/libsane-smfp.so.1.0.1' "${pkgdir}/usr/lib/sane/libsane-smfp.so.1.0.1"
	ln -s '/opt/smfp-common/scanner/lib/libsane-smfp.so.1.0.1' "${pkgdir}/usr/lib/sane/libsane-smfp.so.1"
	ln -s '/opt/smfp-common/scanner/lib/libsane-smfp.so.1.0.1' "${pkgdir}/usr/lib/sane/libsane-smfp.so"
	ln -s '/opt/hp/scanner' "${pkgdir}/opt/smfp-common/scanner/.usedby/hp"
	ln -s '/opt/smfp-common/scanner' "${pkgdir}/opt/smfp-common/legacy_compat/.usedby/scanner"
	ln -s '/opt/smfp-common/scanner' "${pkgdir}/opt/smfp-common/security/.usedby/scanner"


	# license

	install -D -dm644 "${pkgdir}/usr/share/licenses/${pkgname}"
	install -Dm755 "${srcdir}/${_pkgcodename}/noarch/license/"* "${pkgdir}/usr/share/licenses/${pkgname}/"


	# other files

	install -dm755 "${pkgdir}/opt/smfp-common/mfp/uninstall"
	touch "${pkgdir}/opt/smfp-common/mfp/uninstall/guiuninstall"

}

