# Maintainer: Zhuoyun Wei <wzyboy@wzyboy.org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: T.J. Townsend <blakkheim@archlinux.org
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=msmtp-ntlm
_pkgname=msmtp
pkgver=1.8.25
pkgrel=1
pkgdesc="A mini smtp client - NTLM support"
arch=('x86_64')
url="https://marlam.de/msmtp/"
license=('GPL3')
makedepends=('libsecret' 'gsasl-ntlm' 'texlive-plaingeneric')
optdepends=('netcat: for included msmtpq script')
provides=('msmtp')
conflicts=('msmtp')
source=("https://marlam.de/msmtp/releases/msmtp-$pkgver.tar.xz")
install=msmtp.install
sha256sums=('2dfe1dbbb397d26fe0b0b6b2e9cd2efdf9d72dd42d18e70d7f363ada2652d738')

build() {
  cd $_pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --with-libgsasl
  make
  make -C doc html pdf
}

package() {
  cd $_pkgname-$pkgver
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
