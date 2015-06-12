# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Max Roder <maxroder@web.de>
# Contributor: Lex Rivera <x-demon@x-demon.org>

pkgname=airoscript-ng
pkgver=1.2rc3
_pkgver=1.2
_pkgverrc=3
pkgrel=7
pkgdesc='A gui mainly for aircrack-ng. Automates cracking of WEP and WPA'
url='https://code.google.com/p/airoscript/'
arch=('any')
license=('GPL2')
depends=('aircrack-ng' 'macchanger')
optdepends=(
  'mdk3: bruteforce and deauth support'
  'sslstrip: HTTPS MITM plugin support'
  'dsniff: sniffing and spoofing support'
  'zenity: additional graphical dialog support'
  'john: fast password cracking support'
)
backup=(
  'etc/airoscript-ng/airoscript-ng.conf'
  'etc/airoscript-ng/airoscript-ng_advanced.conf'
  'etc/airoscript-ng/screenrc.airoscript'
)
options=('!makeflags' '!emptydirs')
source=(https://airoscript.googlecode.com/files/${pkgname}-${_pkgver}-${_pkgverrc}.tar.gz)
sha512sums=('77056023e1671ae8ad719495cfef7189882e0ee3ed5db965e4798e13b75835afe700828be99efb8d3c6b95e11658aad768df0c7357f5e43f12ac13918ef49fd1')

prepare() {
  cd ${pkgname}-${_pkgver}

  # remove unwanted install parts
  sed -i '/install-locale \\/ d' Makefile-Linux
  sed -i '/install-desktop \\/ d' Makefile-Linux
  sed -i '/for i in doc/ d' Makefile-Linux

  # install binary to bin instead of sbin
  sed -i 's|/sbin/|/bin/|g' Makefile-Linux
  sed -i 's|/sbin/|/bin/|g' src/airoscript-ng_advanced.conf

  # replace usr/local by usr
  sed -i 's|usr/local|usr|g' src/airoscript-ng_advanced.conf

  # replace config file location
  sed -i 's|etc/|etc/airoscript-ng/|g' src/${pkgname}

  # remove .swp file from src dir
  rm src/functions/attacks/.wpa.swp
}

package() {
  cd ${pkgname}-${_pkgver}

  make DESTDIR="${pkgdir}" \
    prefix=usr \
    picdir="${pkgdir}/usr/share/pixmaps/" \
    appdir="${pkgdir}/usr/share/applications/" \
    etcdir="${pkgdir}/etc/${pkgname}"

  # only distribute the .rst doc files rather then html
  rm -rf "${pkgdir}"/usr/share/doc/airoscript-ng/*
  cp doc/html/*.rst "${pkgdir}/usr/share/doc/airoscript-ng/"
}

# vim: ts=2 sw=2 et:
