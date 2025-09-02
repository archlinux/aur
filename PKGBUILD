# Maintainer: alzpmq <kodatemitsuru@outlook.com>
# Contributor: Reese Wang <thuwrx10 at gmail dot com>

pkgname='hikvision-mvs'
pkgver=4.6.0
_pkgdate=250808
pkgrel=1
pkgdesc="Machine Vision Software by Hikvision, for their industrial cameras."
arch=('x86_64' 'i686')
url="https://www.hikrobotics.com/"
license=('LGPL2.1' 'LGPL3' 'custom')
source=("https://www.hikrobotics.com/cn2/source/support/software/MVS_Linux_STD_V${pkgver}_${_pkgdate}.zip"
	'logo.svg'
	'hikvision-mvs.desktop')
noextract=("${source[0]##*/}")
sha256sums=('250436fbd192074eeea0a77affb34e1fc47b0c85cba5b433cc9309937f9348c6'
            '6be7b478c87b26e562ee385c91039b8b5d4927eb3d34a27089201edb2b2182fb'
            '8e71020b983d2b49f012af025dce81d83301f280acf73f8062adf6dbe2b71a2c')

DLAGENTS=('https::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 -e https://www.hikrobotics.com/cn/machinevision/service/download/?module=0 -A "Mozilla" -o %o %u'
          "${DLAGENTS[@]}")
makedepends=(curl
			 unzip
			 tar)

prepare() {
	declare -A arch_in_filename=(
		['x86_64']='x86_64'
		['i686']='i386'
	)
	export FILENAME=MVS-${pkgver}_${arch_in_filename[$CARCH]}_20${_pkgdate}.tar.gz
	unzip -o ${noextract[0]} $FILENAME
	tar xf $FILENAME
}

package() {
	declare -A arch_in_filename=(
		['x86_64']='x86_64'
		['i686']='i386'
	)
	export FILENAME=MVS-${pkgver}_${arch_in_filename[$CARCH]}_20${_pkgdate}.tar.gz #why paru cant do this?
	OPT=${pkgdir}/opt/MVS
	install -Dm644 logo.svg "$pkgdir/usr/share/pixmaps/$pkgname.svg"
	install -Dm644 hikvision-mvs.desktop "$pkgdir/usr/share/applications/$pkgname.desktop"
	echo "Install MVS,Please wait..."
	mkdir -p ${OPT}
	tar -C ${OPT} -xzf "$srcdir/${FILENAME%%.tar.gz}/MVS.tar.gz"
	#mkdir -p ${pkgdir}/usr/local/Qt-5.6.3/lib/fonts
	install -Dm644 -t ${pkgdir}/usr/local/Qt-5.6.3/lib/fonts ${pkgdir}/opt/MVS/bin/Fonts/* 

	echo "Set up the SDK environment..."
	mkdir -p ${pkgdir}/etc/udev/rules.d
	cat > ${pkgdir}/etc/udev/rules.d/70-drivers-SDK-2bdf.rules <<__END__
SUBSYSTEM=="usb", ENV{DEVTYPE}=="usb_device", ATTRS{idVendor}=="2bdf", MODE="0660", TAG+="uaccess"
__END__

	echo "Create ld.so.conf"
	mkdir -p ${pkgdir}/etc/ld.so.conf.d
	> ${pkgdir}/etc/ld.so.conf.d/hikvision-mvs.conf
	for d in 64 32 armhf aarch64 arm-none; do
		fd=${OPT}/MVS/lib/${d}
		if [ -d $fd ]; then
			echo /MVS/lib/${d} >> ${pkgdir}/etc/ld.so.conf.d/hikvision-mvs.conf
		fi
	done

	mkdir -p ${pkgdir}/usr/share/doc
	mv ${pkgdir}/opt/MVS/doc ${pkgdir}/usr/share/doc/${pkgname}
	mv ${pkgdir}/opt/MVS/bin/*.pdf ${pkgdir}/usr/share/doc/${pkgname}/
	mkdir -p ${pkgdir}/usr/share/licenses
	mv ${pkgdir}/opt/MVS/license ${pkgdir}/usr/share/licenses/${pkgname}
}
