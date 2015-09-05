# Maintainer: Cedric MATHIEU <me.xenom @ gmail.com>
# Contributor : Det <nimetonmaili @ gmail.com>
# Contributor: coderoar <coderoar @ gmail.com>
# Contributor: kang <kang @ mozilla.com>
# Contributor: Ivan Petruk <localizator@ukr.net>

pkgname=firefox-nightly-uk
pkgdesc='Web browser from mozilla.org, nightly build, Ukrainian l10n'
url='http://nightly.mozilla.org/'
pkgver=43.0a1
pkgrel=1
arch=('i686' 'x86_64')
license=('MPL' 'GPL' 'LGPL')
source=('firefox-nightly.desktop' 'firefox-nightly-safe.desktop' 'vendor.js')
depends=('alsa-lib' 'dbus-glib' 'gtk2' 'libnotify' 'libxt' 'mime-types' 'nss' 'sqlite')
makedepends=('curl')
conflicts=('firefox-nightly' 'firefox-nightly-ru')
install=${pkgname}.install

package() {
  FX_BASE_SRC="firefox-${pkgver}.uk.linux-${CARCH}"
  FX_TARBALL="${FX_BASE_SRC}.tar.bz2"
  FX_CHKSUM="${FX_BASE_SRC}.checksums"
  FX_GPG="${FX_BASE_SRC}.checksums.asc"
  FX_BASE_URI="http://ftp.mozilla.org/pub/mozilla.org/firefox/nightly/latest-mozilla-central-l10n"
  FX_SRC_URI="${FX_BASE_URI}/${FX_TARBALL}"
  FX_CHKSUM_URI="${FX_BASE_URI}/${FX_CHKSUM}"
  FX_GPG_URI="${FX_BASE_URI}/${FX_GPG}"

  msg "Завантаження..."
  curl -OR ${FX_SRC_URI}
  curl -OR ${FX_CHKSUM_URI}
  curl -OR ${FX_GPG_URI}
  
  msg "Перевірка SHA512 сум..."
  grep ${FX_TARBALL} ${FX_CHKSUM}|grep sha512 |sed 's/sha512\ [0-9]*\ //' > sha512
  sha512sum -c sha512
  
  # uncomment this line to enable GnuPG signature verification. You'll need Firefox's GnuPG release key.
  # Their current fingerprint is 9D03 193D 6BDC 541B D796  C4E4 7F4D 6645 1EBC AB3A shortid 0x1EBCAB3A
  #  msg "Verifying GnuPG signature..."
  #  gpg --verify ${FX_GPG}

  msg "Видобування..."
  bsdtar -x -f ${FX_TARBALL}
  
  msg "Створення пакунка..."
  #  uncomment this line to remove these
  #  rm -rf firefox/{extensions,plugins,searchplugins}
  mkdir -p "${pkgdir}"/{usr/{bin,share/{applications,pixmaps}},opt}
  cp -r firefox "${pkgdir}/opt/firefox-${pkgver}"

  ln -s /opt/firefox-${pkgver}/firefox "${pkgdir}/usr/bin/firefox-nightly"
  install -m644 "${srcdir}"/{firefox-nightly.desktop,firefox-nightly-safe.desktop} "${pkgdir}/usr/share/applications/"
  install -m644 "${srcdir}/firefox/browser/icons/mozicon128.png" "${pkgdir}/usr/share/pixmaps/${pkgname}-icon.png"
  install -Dm644 "${srcdir}/vendor.js" "${pkgdir}/opt/firefox-${pkgver}/browser/defaults/preferences/vendor.js"

}

md5sums=('54739f07b7f9879cd8e92f9da344e84c'
         '6c626bc78e03c795c5892e5c61011054'
         '32618013911bf84445afce815e3875b1')
