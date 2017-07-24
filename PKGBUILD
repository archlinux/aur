# Maintainer: Mitch Bigelow <ipha00@gmail.com>

pkgname=wireshark-gtk2
_pkgbase=wireshark
pkgver=2.2.8
pkgrel=1
pkgdesc='a free network protocol analyzer for Unix/Linux and Windows - GTK2 frontend'
arch=('i686' 'x86_64')
url='http://www.wireshark.org/'
license=('GPL2')

depends=('c-ares' 'geoip' 'krb5' 'libgcrypt' 'libcap' 'libpcap' 'bash' 'gnutls' 'glib2' 'lua52' 'portaudio' 'gtk2' 'libssh')
makedepends=('python')

provides=('wireshark-cli' 'wireshark-gtk')
conflicts=('wireshark-cli' 'wireshark-common' 'wireshark-qt')
install=wireshark-gtk2.install
source=(http://www.wireshark.org/download/src/all-versions/${_pkgbase}-${pkgver}.tar.bz2)
sha256sums=('ecf02c148c9ab6e809026ad5743fe9be1739a9840ef6fece6837a7ddfbdf7edc')

build() {
	cd ${_pkgbase}-${pkgver}

	./autogen.sh
	./configure \
		--prefix=/usr \
		--with-qt=no \
		--with-gtk=2 \
		--with-pcap \
		--with-zlib \
		--with-lua \
		--with-portaudio \
		--with-ssl \
		--with-krb5 \
		--with-c-ares \
		--with-geoip \
		--with-libsmi=no \
		--with-sbc=no
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

	install -m644 config.h register.h ws_diag_control.h ws_symbol_export.h "${pkgdir}/usr/include/${_pkgbase}"
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
