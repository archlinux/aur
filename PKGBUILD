# Maintainer: Henri Chain <henri at henricha.in>

pkgname=apaxy-git
pkgver=r78.af176b3
pkgrel=1
pkgdesc="A simple, customisable theme for your Apache directory listing."
arch=('any')
url="http://adamwhitcroft.com/apaxy/"
depends=('apache')
provides=('apaxy')
license=('public domain')
source=('apaxy::git+https://github.com/AdamWhitcroft/apaxy.git'
        'alias.patch')
md5sums=('SKIP'
         '803f84bf166110fd0d4869a681411200')
install='.install'

pkgver() {
  cd "$srcdir/apaxy"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/apaxy"
  sed -i 's:theme/:/apaxy/:g' ./apaxy/htaccess.txt
  patch -p1 -i "$srcdir/alias.patch"
}

package() {
  cd "$srcdir/apaxy"
  install -D -m644 './apaxy/htaccess.txt' "${pkgdir}/etc/httpd/conf/extra/httpd-autoindex-apaxy.conf"
  install -D -m644 -t "${pkgdir}/usr/share/httpd/apaxy" ./apaxy/theme/{footer.html,header.html,style.css}
  install -D -m644 -t "${pkgdir}/usr/share/httpd/apaxy/icons/" ./apaxy/theme/icons/*
}
