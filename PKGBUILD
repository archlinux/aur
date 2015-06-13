pkgname=samsung-unified-driver
pkgver=4.00.39
pkgrel=5

pkgdesc="Unified Linux Driver for Samsung printers and scanners."
arch=(i686 x86_64)
url="http://www.samsung.com"
license=('custom:samsung')
depends=('libstdc++5' 'libjpeg6' 'cups' 'ghostscript' 'sane')
conflicts=('samsungmfp-configurator-qt4')

options=(!strip)

source=("http://www.bchemnet.com/suldr/driver/UnifiedLinuxDriver-${pkgver}.tar.gz"
	'99_smfpautoconf.rules' 'samsungUDC.desktop')

sha1sums=(
			'a222506f2c8a6cc3cbf81ec781506c1d7aabb43e'
			'29ee51d7bcb2541967f34c36c72ac62ecc621a1e'
			'e2e337d2e22cab41071e5af585f04dcf9e779c7b')

if [ "$CARCH" = "x86_64" ]; then
	CARCHCUSTOM="$CARCH"
	LIBDIRCUSTOM="lib64"
else
	CARCHCUSTOM="i386"
	LIBDIRCUSTOM="lib"
fi

package() {
# mpf
	install -d "${pkgdir}/usr/lib"
	install -d "${pkgdir}/usr/bin"
	install -d "${pkgdir}/etc/udev/rules.d/"

	install -m 755 "${srcdir}/cdroot/Linux/${CARCHCUSTOM}/at_root/usr/${LIBDIRCUSTOM}/libmfp.so.1.0.1" \
	"${pkgdir}/usr/lib/libmfp.so.1.0.1"
	install -m 755 "${srcdir}/cdroot/Linux/${CARCHCUSTOM}/at_root/opt/smfp-common/lib/libnetsnmp.so.10.0.2" \
	"${pkgdir}/usr/lib/libnetsnmp.so.10.0.2"

	install -m 644 "${srcdir}/99_smfpautoconf.rules" "${pkgdir}/etc/udev/rules.d/99_smfpautoconf.rules"

# cups
	install -d "${pkgdir}/usr/lib/cups/filter"
	install -d "${pkgdir}/usr/lib/cups/backend/"
	install -d "${pkgdir}/etc/cups/"
	install -d "${pkgdir}/usr/share/cups/model/samsung/cms"

	install -m 444 -t "${pkgdir}/usr/share/cups/model/samsung/cms/" ${srcdir}/cdroot/Linux/noarch/at_opt/share/ppd/cms/*

	install -m 644 -t "${pkgdir}/usr/share/cups/model/" ${srcdir}/cdroot/Linux/noarch/at_opt/share/ppd/*.ppd
	find "${pkgdir}/usr/share/cups/model/" -name "*.ppd" | xargs gzip -9
	

	install -m 755 "${srcdir}/cdroot/Linux/${CARCHCUSTOM}/at_root/usr/${LIBDIRCUSTOM}/cups/backend/mfp" \
	"${pkgdir}/usr/lib/cups/backend/mfp"
	install -m 755 -t "${pkgdir}/usr/lib/cups/filter/" ${srcdir}/cdroot/Linux/${CARCHCUSTOM}/at_root/usr/${LIBDIRCUSTOM}/cups/filter/*

	install -m 755 "${srcdir}/cdroot/Linux/${CARCHCUSTOM}/at_root/usr/${LIBDIRCUSTOM}/cups/filter/smfpautoconf" \
	"${pkgdir}/usr/lib/cups/filter/smfpautoconf"


	install -m 644 -t "${pkgdir}/etc/cups/" ${srcdir}/cdroot/Linux/noarch/at_root/etc/cups/*

	install -d "${pkgdir}/usr/lib/sane/"
	install -d "${pkgdir}/etc/sane.d/dll.d"

	install -m 644 "${srcdir}/cdroot/Linux/noarch/at_root/etc/sane.d/smfp.conf" "${pkgdir}/etc/sane.d/smfp.conf"

	install -m 755 "${srcdir}/cdroot/Linux/${CARCHCUSTOM}/at_root/usr/${LIBDIRCUSTOM}/sane/libsane-smfp.so.1.0.1" \
	"${pkgdir}/usr/lib/sane/libsane-smfp.so.1.0.1"

	install -d "${pkgdir}/opt/Samsung/mfp/bin/"
	install -m 755 "${srcdir}/cdroot/Linux/${CARCHCUSTOM}/at_opt/bin/netdiscovery" "${pkgdir}/opt/Samsung/mfp/bin/netdiscovery"

	install -d "${pkgdir}/usr/bin/"
	install -m 755 "${srcdir}/cdroot/Linux/${CARCHCUSTOM}/at_root/usr/sbin/smfpd" "${pkgdir}/usr/bin/smfpd"

	install -d "${pkgdir}/opt/Samsung/mfp/share/"
	install -m 644 "${srcdir}/cdroot/Linux/OEM.ini" "${pkgdir}/opt/Samsung/mfp/share/OEM.ini"

#create symbolic links
# mpf
	cd "${pkgdir}/usr/lib"
	ln -s ./libmfp.so.1.0.1 ./libmfp.so.1
	ln -s ./libmfp.so.1.0.1 ./libmfp.so

# 
	cd "${pkgdir}/usr/lib/sane"
	ln -s libsane-smfp.so.1.0.1 libsane-smfp.so.1
	ln -s libsane-smfp.so.1 libsane-smfp.so

	echo "smfp" >> "${pkgdir}/etc/sane.d/dll.d/smfp"
	chmod 644 "${pkgdir}/etc/sane.d/dll.d/smfp"
	
# samsungmfp-configurator-qt4
	install -d "${pkgdir}/opt/Samsung/mfp/bin/"
	install -d "${pkgdir}/opt/Samsung/mfp/lib/"
	install -d "${pkgdir}/opt/Samsung/mfp/share/"
	install -d "${pkgdir}/opt/Samsung/mfp/share/help/"
	install -d "${pkgdir}/opt/Samsung/mfp/share/images/"
	install -d "${pkgdir}/opt/Samsung/mfp/share/tr/"
	install -d "${pkgdir}/opt/Samsung/mfp/share/ui/"
	install -d "${pkgdir}/opt/Samsung/mfp/share/utils/"
	install -d "${pkgdir}/usr/share/applications/"

	install -m 755 -t "${pkgdir}/opt/Samsung/mfp/bin/" ${srcdir}/cdroot/Linux/${CARCHCUSTOM}/qt4/at_opt/bin/*
	install -m 644 -t "${pkgdir}/opt/Samsung/mfp/lib/" ${srcdir}/cdroot/Linux/${CARCHCUSTOM}/qt4/at_opt/lib/*
	install -m 644 -t "${pkgdir}/opt/Samsung/mfp/share/" ${srcdir}/cdroot/Linux/noarch/at_opt/share/eula.htm
	install -m 644 -t "${pkgdir}/opt/Samsung/mfp/share/" ${srcdir}/cdroot/Linux/noarch/at_opt/share/VERSION-Common_LINUX
	install -m 644 -t "${pkgdir}/opt/Samsung/mfp/share/" ${srcdir}/cdroot/Linux/noarch/at_opt/share/VERSION-Common_LINUX_Script
	install -m 644 -t "${pkgdir}/opt/Samsung/mfp/share/" ${srcdir}/cdroot/Linux/noarch/at_opt/share/VERSION-Printer_LINUX
	install -m 644 -t "${pkgdir}/opt/Samsung/mfp/share/" ${srcdir}/cdroot/Linux/noarch/at_opt/share/VERSION-Printer_LINUX-Script
	install -m 644 -t "${pkgdir}/opt/Samsung/mfp/share/" ${srcdir}/cdroot/Linux/noarch/at_opt/share/VERSION-Scanner_LINUX
	install -m 644 -t "${pkgdir}/opt/Samsung/mfp/share/" ${srcdir}/cdroot/Linux/noarch/at_opt/share/VERSION-Scanner_LINUX-Script
	install -m 644 -t "${pkgdir}/opt/Samsung/mfp/share/help/" ${srcdir}/cdroot/Linux/noarch/at_opt/share/help/*
	install -m 644 -t "${pkgdir}/opt/Samsung/mfp/share/images/" ${srcdir}/cdroot/Linux/noarch/at_opt/share/images/*
	install -m 644 -t "${pkgdir}/opt/Samsung/mfp/share/utils/" ${srcdir}/cdroot/Linux/noarch/at_opt/share/utils/*
	install -m 644 -t "${pkgdir}/opt/Samsung/mfp/share/tr/" ${srcdir}/cdroot/Linux/noarch/qt4/at_opt/share/tr/*
	install -m 644 -t "${pkgdir}/opt/Samsung/mfp/share/ui/" ${srcdir}/cdroot/Linux/noarch/qt4/at_opt/share/ui/*
	
	install -m 644 "${startdir}/samsungUDC.desktop" "${pkgdir}/usr/share/applications/samsungUDC.desktop"

	install -m 644 -t "${pkgdir}/opt/Samsung/mfp/lib/" ${srcdir}/cdroot/Linux/${CARCHCUSTOM}/qt4/at_root/opt/smfp-common/lib/*
	
	echo "LD_LIBRARY_PATH=/opt/Samsung/mfp/lib/:\$LD_LIBRARY_PATH /opt/Samsung/mfp/bin/Configurator" >> "${pkgdir}/usr/bin/SamsungConfigurator"
	chmod 555 "${pkgdir}/usr/bin/SamsungConfigurator"
	
	echo "LD_LIBRARY_PATH=/opt/Samsung/mfp/lib/:\$LD_LIBRARY_PATH /opt/Samsung/mfp/bin/ImageManager" >> "${pkgdir}/usr/bin/SamsungImageManager"
	chmod 555 "${pkgdir}/usr/bin/SamsungImageManager"
	
	echo "LD_LIBRARY_PATH=/opt/Samsung/mfp/lib/:\$LD_LIBRARY_PATH /opt/Samsung/mfp/bin/smfpscan" >> "${pkgdir}/usr/bin/smfpscan"
	chmod 555 "${pkgdir}/usr/bin/smfpscan"
	
	mkdir -p "${srcdir}/libtiff/"
	tar xzf "${srcdir}/cdroot/Linux/noarch/libtiff-3-${CARCHCUSTOM}.tar.gz" -C "${srcdir}/libtiff"
	install -m 644 -t "${pkgdir}/opt/Samsung/mfp/lib/" ${srcdir}/libtiff/usr/${LIBDIRCUSTOM}/*
}

