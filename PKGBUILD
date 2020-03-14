# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=wireshark-gtk2
_pkgbase=wireshark
pkgver=2.6.15
pkgrel=1
pkgdesc='a free network protocol analyzer for Unix/Linux and Windows - GTK2 frontend'
arch=('i686' 'x86_64')
url='http://www.wireshark.org/'
license=('GPL2')

depends=('c-ares' 'libmaxminddb' 'krb5' 'libgcrypt' 'libcap' 'libpcap' 'bash' 'gnutls' 'glib2' 'lua52' 'portaudio' 'gtk2' 'libssh' 'libxml2' 'libnghttp2')
makedepends=('python')

provides=('wireshark-cli' 'wireshark-gtk')
conflicts=('wireshark-cli' 'wireshark-common' 'wireshark-qt')
install=wireshark-gtk2.install
source=(https://www.wireshark.org/download/src/${_pkgbase}-${pkgver}.tar.xz
        wireshark.sysusers
        do_not_use_svn_version.patch)
sha512sums=('b9a0c7e69d3a36e7685cae10466b4bef1005becd567b955a2f6353ebc5456a56eda577866d9c7ee52e35612f6834ecd4f231ec5ee9475b698f57b6bbaf7eeca4'
            '3956c1226e64f0ce4df463f80b55b15eed06ecd9b8703b3e8309d4236a6e1ca84e43007336f3987bc862d8a5e7cfcaaf6653125d2a34999a0f1357c52e7c4990'
            '847eac73c789b02f57f0ec378d086aea5a103cf0c6525c227d168ad67db08703686d4df37ed2ac95f47125cfcd5cafd472e2988f7f743428b291dc2aebe0f435')

prepare() {
  cd ${_pkgbase}-${pkgver}
  # Avoid ugly "svn rev unknown from unknown" version string
  patch -p1 < "${srcdir}/do_not_use_svn_version.patch"
}

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
      --with-maxmind
  make all
}

package() {
  cd ${_pkgbase}-${pkgver}

  make DESTDIR="${pkgdir}" install

  # wireshark uid group is 150
  install -Dm644 "${srcdir}/wireshark.sysusers" "${pkgdir}/usr/lib/sysusers.d/wireshark.conf"
  chgrp 150 "${pkgdir}/usr/bin/dumpcap"
  chmod 754 "${pkgdir}/usr/bin/dumpcap"

  # headers
  install -dm755 "${pkgdir}"/usr/include/${_pkgbase}/{epan/{crypt,dfilter,dissectors,ftypes,wmem},wiretap,wsutil}

  install -m644 config.h ws_diag_control.h ws_symbol_export.h "${pkgdir}/usr/include/${_pkgbase}"
  for d in epan epan/crypt epan/dfilter epan/dissectors epan/ftypes epan/wmem wiretap wsutil; do
    install -m644 ${d}/*.h "${pkgdir}"/usr/include/${_pkgbase}/${d}
  done

  # Icons
  for d in 16 32 48; do
    install -Dm644 image/wsicon${d}.png \
      "${pkgdir}/usr/share/icons/hicolor/${d}x${d}/apps/wireshark.png"
  done

  for d in 16 24 32 48 64 128 256 ; do
    install -Dm644 image/WiresharkDoc-${d}.png \
      "${pkgdir}/usr/share/icons/hicolor/${d}x${d}/mimetypes/application-vnd.tcpdump.pcap.png"
  done

  install -Dm644 wireshark.desktop "${pkgdir}/usr/share/applications/wireshark.desktop"
}
