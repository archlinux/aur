# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=msmtp-ntlm
_pkgname=msmtp
pkgver=1.6.3
pkgrel=1
pkgdesc="A mini smtp client - NTLM support"
arch=('i686' 'x86_64')
url="http://msmtp.sourceforge.net"
license=('GPL3')
makedepends=('texlive-plainextra' 'gsasl-ntlm' 'libsecret')
provides=('msmtp')
conflicts=('msmtp')
source=(http://download.sourceforge.net/sourceforge/msmtp/${_pkgname}-${pkgver}.tar.xz)
install=msmtp.install
sha256sums=('f982be069c0772c3ee83925f552f5dac5fb307d2d1c68202f9926bb13b757355')

build() {
  cd ${_pkgname}-${pkgver}
  ./configure --prefix=/usr --sysconfdir=/etc --with-ssl=gnutls --with-libgsasl
  make
  make -C doc html pdf
}

package() {
  cd ${_pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install 
  make DESTDIR="${pkgdir}" -C doc install-html install-pdf

# Installing example configs and scripts to /usr/share/doc/msmtp
# as they are not installed by default (Debian and Gentoo do it this way)
  install -d "${pkgdir}/usr/share/doc/msmtp"
  cp -r scripts/{find_alias,msmtpqueue,msmtpq,set_sendmail} "${pkgdir}/usr/share/doc/msmtp/"
  install -D -m644 doc/*.example "${pkgdir}/usr/share/doc/msmtp/"

  install -D -m644 scripts/vim/msmtp.vim "${pkgdir}/usr/share/vim/vimfiles/syntax/msmtp.vim"
}
