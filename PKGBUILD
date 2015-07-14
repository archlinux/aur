# $Id: PKGBUILD 194226 2013-09-11 02:06:50Z eric $
# Maintainer: Timothy Redaelli <timothy.redaelli@gmail.com>
# Contributor: Guillaume ALAUX <guillaume@archlinux.org>
# Contributor: Florian Pritz <bluewind at jabber dot ccc dot de>
pkgname=wireshark-dev
: && pkgname=('wireshark-dev-cli' 'wireshark-dev-gtk' 'wireshark-dev-qt')
pkgbase=wireshark-dev
pkgver=1.11.3
pkgrel=1
pkgdesc='a free network protocol analyzer for Unix/Linux and Windows'
arch=('i686' 'x86_64')
license=('GPL2')
makedepends=('qt4' 'gtk2' 'krb5' 'libpcap' 'bash' 'gnutls'
             'lua' 'python' 'desktop-file-utils' 'hicolor-icon-theme')
url='http://www.wireshark.org/'
options=(!libtool)
source=(http://www.wireshark.org/download/src/wireshark-${pkgver}.tar.bz2)
sha256sums=('dfe8aa60581c9f7642503215a2dc1fe506a92aab20abcdf8520b9f8e12a83664')

prepare() {
  cd ${pkgbase%-dev}-${pkgver}
  sed -i 's/$(AM_V_RCC)rcc/&-qt4/p' ui/qt/Makefile.am
}

build() {
  cd ${pkgbase%-dev}-${pkgver}

  ./autogen.sh
  ./configure \
      --prefix=/usr \
      --with-ssl \
      --with-zlib=yes \
      --with-lua \
      --with-qt \
      --with-gtk2 \
      --disable-warnings-as-errors
  make all
}

package_wireshark-dev-cli() {
  : && pkgdesc='a free network protocol analyzer for Unix/Linux and Windows - CLI version'
  depends=('krb5' 'libpcap' 'bash' 'gnutls'  'glib2' 'lua')
  install=wireshark.install
  replaces=(wireshark-cli)
  conflicts=(wireshark wireshark-cli)

  cd ${pkgbase%-dev}-${pkgver}

  make DESTDIR="${pkgdir}" install

  #wireshark uid group is 150
  chgrp 150 "${pkgdir}/usr/bin/dumpcap"
  chmod 754 "${pkgdir}/usr/bin/dumpcap"
  rm "${pkgdir}/usr/bin/wireshark" "${pkgdir}/usr/bin/wireshark-qt"

  # Headers
  install -dm755 "${pkgdir}"/usr/include/${pkgbase%-dev}/{epan/{crypt,dfilter,dissectors,ftypes},wiretap,wsutil}

  install -m644 color.h config.h register.h ws_symbol_export.h "${pkgdir}/usr/include/${pkgbase%-dev}"
  for d in epan epan/crypt epan/dfilter epan/dissectors epan/ftypes wiretap wsutil; do
    install -m644 ${d}/*.h "${pkgdir}"/usr/include/${pkgbase%-dev}/${d}
  done
}

package_wireshark-dev-gtk() {
  : && pkgdesc='a free network protocol analyzer for Unix/Linux and Windows - GTK frontend'
  depends=('gtk2' 'wireshark-dev-cli' 'desktop-file-utils' 'hicolor-icon-theme')
  install=wireshark-gtk.install
  replaces=(wireshark wireshark-gtk)
  conflicts=(wireshark wireshark-gtk)

  cd ${pkgbase%-dev}-${pkgver}

  install -Dm755 .libs/wireshark "${pkgdir}/usr/bin/wireshark"
  for d in 16 32 48; do
    install -Dm644 image/hi${d}-app-wireshark.png  \
                   "${pkgdir}/usr/share/icons/hicolor/${d}x${d}/apps/wireshark.png"
  done

  for d in 16 24 32 48 64 128 256 ; do
    install -Dm644 image/WiresharkDoc-${d}.png \
                   "${pkgdir}/usr/share/icons/hicolor/${d}x${d}/mimetypes/application-vnd.tcpdump.pcap.png"
  done
  install -Dm644 wireshark.desktop "${pkgdir}/usr/share/applications/wireshark.desktop"
}

package_wireshark-dev-qt() {
  : && pkgdesc='a free network protocol analyzer for Unix/Linux and Windows - Qt frontend'
  depends=('qt4' 'wireshark-dev-cli')

  cd ${pkgbase%-dev}-${pkgver}
  install -Dm755 .libs/wireshark-qt "${pkgdir}/usr/bin/wireshark-qt"
}
