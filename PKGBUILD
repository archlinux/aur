# Maintainer: Josef Miegl <josef@miegl.cz>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Sarah Hay <sarahhay@mb.sympatico.ca>
# Contributor: Simo L. <neotuli@yahoo.com>
# Contributor: eric <eric@archlinux.org>

pkgname=sane-git
_pkgname=sane
provides=("${_pkgname}")
conflicts=("${_pkgname}")
pkgver=20181220.2d14283d
pkgrel=1
pkgdesc="Scanner Access Now Easy"
url="http://www.sane-project.org/"
arch=('i686' 'x86_64' 'armv7h')
license=('GPL')
depends=('libtiff>=4.0.0' 'libgphoto2' 'libjpeg>=8' 'libusbx' 'libcups' 'libieee1284' 'v4l-utils' 'avahi' 'bash' 'net-snmp')
makedepends=('texlive-latexextra')
backup=(etc/sane.d/{abaton.conf,agfafocus.conf,apple.conf,artec.conf,artec_eplus48u.conf,avision.conf,bh.conf,canon.conf,canon630u.conf,canon_dr.conf,canon_pp.conf,cardscan.conf,coolscan2.conf,coolscan3.conf,coolscan.conf,dc25.conf,dc210.conf,dc240.conf,dell1600n_net.conf,dll.conf,dmc.conf,epjitsu.conf,epson.conf,epson2.conf,epsonds.conf,fujitsu.conf,genesys.conf,gphoto2.conf,gt68xx.conf,hp.conf,hp3900.conf,hp4200.conf,hp5400.conf,hpsj5s.conf,hs2p.conf,ibm.conf,kodak.conf,kodakaio.conf,leo.conf,lexmark.conf,ma1509.conf,magicolor.conf,matsushita.conf,microtek.conf,microtek2.conf,mustek.conf,mustek_pp.conf,mustek_usb.conf,nec.conf,net.conf,p5.conf,pie.conf,pieusb.conf,pixma.conf,plustek.conf,plustek_pp.conf,qcam.conf,ricoh.conf,rts8891.conf,s9036.conf,saned.conf,sceptre.conf,sharp.conf,sm3840.conf,snapscan.conf,sp15c.conf,st400.conf,stv680.conf,tamarack.conf,teco1.conf,teco2.conf,teco3.conf,test.conf,u12.conf,umax.conf,umax1220u.conf,umax_pp.conf,xerox_mfp.conf,v4l.conf} etc/xinetd.d/sane)
source=(git+http://gitlab.com/sane-project/backends.git
        'sane.xinetd'
        'saned.socket'
        'saned.service'
        'network.patch')

sha256sums=('SKIP'
            '9d288d4fef0833da31ca1f1e9b4e567f81a4c03219af3b496d3fc3b6aac394eb'
            'c06fdd54128b06efbf8fbcb40b145512fa8e8a1c470c5cb60abc839a6002fdf1'
            '9e5274b0184249aaf1066e64c08fed2d65445e4ca95717497b30fc9d30a55ae3'
            '23785948c7d9dc071fcc066754001dc2c1bd17a904051ed3ae6ec7f4e3b8e66b')

pkgver() {
	cd "${srcdir}/backends"
	git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
	cd "${srcdir}/backends"
	# fix http://vasks.debian.org/tracker/?func=detail&atid=410366&aid=313760&group_id=30186
	patch -Np1 -i ${srcdir}/network.patch
}

build() {
	cd "${srcdir}/backends"

	./configure --prefix=/usr --sbindir=/usr/bin \
	 --sysconfdir=/etc \
	 --localstatedir=/var \
	 --with-docdir=/usr/share/doc/sane \
	 --enable-avahi \
	 --enable-pthread \
	 --disable-rpath \
	 --enable-libusb_1_0 \
	 --disable-locking
	make
}

package () {
	cd "${srcdir}/backends"
	make DESTDIR="${pkgdir}" install

	# fix hp officejets
	echo "#hpaio" >> "${pkgdir}/etc/sane.d/dll.conf"

	# install udev files
	install -D -m0644 tools/udev/libsane.rules "${pkgdir}/usr/lib/udev/rules.d/49-sane.rules"

	# fix udev rules
	sed -i 's|NAME="%k", ||g' "${pkgdir}/usr/lib/udev/rules.d/49-sane.rules"
  
	# install xinetd file
	install -D -m644 "${srcdir}/sane.xinetd" "${pkgdir}/etc/xinetd.d/sane"
  
	# Install the pkg-config file
	install -D -m644 tools/sane-backends.pc "${pkgdir}/usr/lib/pkgconfig/sane-backends.pc"

	# install systemd files
	install -D -m644 ${srcdir}/saned.socket "${pkgdir}/usr/lib/systemd/system/saned.socket"
	install -D -m644 ${srcdir}/saned.service "${pkgdir}/usr/lib/systemd/system/saned@.service"
}
