# Maintainer: Mitch Bigelow <ipha00@gmail.com>

pkgname=wireshark-gtk2
_pkgbase=wireshark
pkgver=1.12.8
pkgrel=1
pkgdesc='a free network protocol analyzer for Unix/Linux and Windows - GTK2 frontend'
arch=('i686' 'x86_64')
url='http://www.wireshark.org/'
license=('GPL2')

depends=('krb5' 'libgcrypt' 'libcap' 'libpcap' 'bash' 'gnutls' 'glib2' 'lua52' 'portaudio' 'gtk2' 'desktop-file-utils' 'hicolor-icon-theme')
makedepends=('python')

provides=('wireshark-cli' 'wireshark-gtk')
conflicts=('wireshark-cli' 'wireshark-gtk')
install=wireshark-gtk2.install
source=(http://www.wireshark.org/download/src/all-versions/${_pkgbase}-${pkgver}.tar.bz2
		optional_sbc_2021845.patch)
sha1sums=('d8c23120525a2f3505e822b7684e7367bcd0ba70'
		  '6f4fe6ca4b21f32aa7678e0f2837c22bc0b2ee65')

prepare() {
	cd ${_pkgbase}-${pkgver}

	# Make sbc optional
	# https://code.wireshark.org/review/#/c/6399/
	patch -p1 < ../optional_sbc_2021845.patch
}


build() {
	cd ${_pkgbase}-${pkgver}

	[ -f /usr/bin/lua ] && error "compile will fail if lua 5.3 is installed. Temporarily remove it to build." && exit

	./autogen.sh
	./configure \
		--prefix=/usr \
		--with-qt=no \
		--with-gtk2=yes \
		--with-gtk3=no \
		--with-pcap \
		--with-zlib \
		--with-lua \
		--with-portaudio \
		--with-ssl \
		--with-krb5 \
		--without-c-ares \
		--without-adns \
		--without-libsmi \
		--without-geoip \
		--without-sbc
	make all
}

package() {
	cd ${_pkgbase}-${pkgver}

	make DESTDIR="${pkgdir}" install

	#wireshark uid group is 150
	chgrp 150 "${pkgdir}/usr/bin/dumpcap"
	chmod 754 "${pkgdir}/usr/bin/dumpcap"

	# Headers
	install -dm755 "${pkgdir}"/usr/include/${_pkgbase}/{epan/{crypt,dfilter,dissectors,ftypes,wmem},wiretap,wsutil}

	install -m644 color.h config.h register.h ws_symbol_export.h "${pkgdir}/usr/include/${_pkgbase}"
	for d in epan epan/crypt epan/dfilter epan/dissectors epan/ftypes epan/wmem wiretap wsutil; do
		install -m644 ${d}/*.h "${pkgdir}"/usr/include/${_pkgbase}/${d}
	done

	# Icons
	for d in 16 32 48; do
		install -Dm644 image/hi${d}-app-wireshark.png \
			"${pkgdir}/usr/share/icons/hicolor/${d}x${d}/apps/wireshark.png"
	done

	for d in 16 24 32 48 64 128 256 ; do
		install -Dm644 image/WiresharkDoc-${d}.png \
			"${pkgdir}/usr/share/icons/hicolor/${d}x${d}/mimetypes/application-vnd.tcpdump.pcap.png"
	done

	install -Dm644 wireshark.desktop "${pkgdir}/usr/share/applications/wireshark.desktop"
}
