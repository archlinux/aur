# Maintainer:  None. Based on msmtp PKGBUILD by
#    Eric Bélanger <eric@archlinux.org>

pkgbase=msmtp-oauth2
_pkgbase=msmtp
pkgname=('msmtp-oauth2')
conflicts=('msmtp')
pkgver=1.8.3
pkgrel=1
pkgdesc="A mini smtp client, with oauth2 hack"
arch=('x86_64')
url="https://marlam.de/msmtp/"
license=('GPL3')
makedepends=('texlive-plainextra' 'libsecret' 'gsasl')
source=("https://marlam.de/msmtp/releases/msmtp-$pkgver.tar.xz"
  get-gmail-token)
sha256sums=('3cb2eefd33d048f0f82de100ef39a494e44fd1485e376ead31f733d2f36b92b4'
SKIP)

build() {
  cd $_pkgbase-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --with-libgsasl
  make
  make -C doc html pdf
}

package_msmtp-oauth2() {
  pkgdesc="A mini smtp client, with oauth2 hack"
  depends=('libsecret' 'gsasl' 'getmail')

  cd $_pkgbase-$pkgver/src
  sed -i '/"AUTH PLAIN %s", outbuf/{
    s/PLAIN/XOAUTH2/
    s/outbuf/password/
    }' smtp.c

  cd ..

  make DESTDIR="$pkgdir" install
  make DESTDIR="$pkgdir" -C doc install-html install-pdf

# Installing example configs and scripts to /usr/share/doc/msmtp
# as they are not installed by default (Debian and Gentoo do it this way)
  install -d "$pkgdir"/usr/share/doc/msmtp
  cp -r scripts/{find_alias,msmtpqueue,msmtpq,set_sendmail} "$pkgdir"/usr/share/doc/msmtp/
  install -D -m644 doc/*.example "$pkgdir"/usr/share/doc/msmtp/

  install -D -m644 scripts/vim/msmtp.vim "$pkgdir"/usr/share/vim/vimfiles/syntax/msmtp.vim

  chmod 755 "$pkgdir"/usr/share/doc/msmtp/{find_alias,msmtpqueue,set_sendmail}/*.sh
  chmod 755 "$pkgdir"/usr/share/doc/msmtp/msmtpq/msmtp*
}
