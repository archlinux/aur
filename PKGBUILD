# Maintainer: alzpmq <kodatemitsuru@outlook.com>
# Contributor: Reese Wang <thuwrx10 at gmail dot com>

pkgname='hikvision-mvs'
pkgver=5.0.1
_pkgdate=260512
pkgrel=1
pkgdesc="Machine Vision Software by Hikvision, for their industrial cameras."
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://www.hikrobotics.com/"
license=('LGPL2.1' 'LGPL3' 'custom')
source=("https://www.hikrobotics.com/cn2/source/support/software/MVS_Linux_STD_V${pkgver}_${_pkgdate}.zip")
noextract=("${source[0]##*/}")
sha256sums=('cd6c4e3352afb1f6395b9be8a692b4fa8a911ae7eea7ff1f9181970f221bf264')

DLAGENTS=('https::/usr/bin/curl -qgb "" -fLC - --retry 3 --retry-delay 3 -e https://www.hikrobotics.com/cn/machinevision/service/download/?module=0 -A "Mozilla" -o %o %u'
          "${DLAGENTS[@]}")
makedepends=(curl
			 unzip
			 tar)

prepare() {
	declare -A arch_in_filename=(
		['x86_64']='x86_64'
		['i686']='i386'
		['armv7h']='arm-none'
		['aarch64']='aarch64'
	)
	export FILENAME=MVS-${pkgver}_${arch_in_filename[$CARCH]}_20${_pkgdate}.tar.gz
	unzip -o ${noextract[0]} $FILENAME
	tar xf $FILENAME
}

package() {
	declare -A arch_in_filename=(
		['x86_64']='x86_64'
		['i686']='i386'
		['armv7h']='arm-none'
		['aarch64']='aarch64'
	)
	export FILENAME=MVS-${pkgver}_${arch_in_filename[$CARCH]}_20${_pkgdate}.tar.gz #why paru cant do this?
	OPT=${pkgdir}/opt/MVS
	echo "Install MVS,Please wait..."
	mkdir -p ${OPT}
	tar -C ${OPT} -xzf "$srcdir/${FILENAME%%.tar.gz}/MVS.tar.gz"
	install -Dm644 "$pkgdir/opt/MVS/bin/MVS.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
	install -d "$pkgdir/usr/share/fonts/$pkgname"
    cp -r "$pkgdir/opt/MVS/bin/Fonts/"* "$pkgdir/usr/share/fonts/$pkgname/"

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
