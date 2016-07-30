# Maintainer:  Andrzej Giniewicz <gginiu@gmail.com>

pkgname=domjudge
pkgver=5.1.2
pkgrel=1
pkgdesc="programming contest jury system"
arch=('i686' 'x86_64')
url="http://domjudge.sourceforge.net/"
license=('GPL')
depends=('php-apache' 'mysql' 'texlive-core' 'libcgroup' 'curl' 'jsoncpp')
makedepends=('boost')
optdepends=('phpmyadmin: to access database in an emergency'
            'ntp: to keep judgehosts clocks in sync'
            'beep: for notification of errors')
install='domjudge.install'

source=(http://www.domjudge.org/releases/domjudge-$pkgver.tar.gz
        domjudge-judgehostd.service jsoncpp.patch)
md5sums=('a200a53f86596a8e89c76bbc014c1e66'
         '93cd5b10fc2636b664f2c17b4f34436f'
         '69e8aef0a5f9394fd0a4f42785d0732e')

build() {
  cd "$srcdir"/domjudge-$pkgver
  patch -p0 < ../jsoncpp.patch
  ./configure --enable-fhs --enable-cgroups --prefix=/usr \
    --sysconfdir=/etc --localstatedir=/var \
    --enable-submitclient=http,dolstra \
    --with-domjudge-user=root --with-webserver-group=http
  make all
}

package() {
  cd "$srcdir"/domjudge-$pkgver
  make install-{domserver,judgehost,docs} DESTDIR="$pkgdir"/
  rm -rf "$pkgdir"/tmp
  install -D -m 440 "$pkgdir"/etc/domjudge/sudoers-domjudge "$pkgdir"/etc/sudoers.d/domjudge
  sed -s "s/^root/domjudge/g" -i "$pkgdir"/etc/sudoers.d/domjudge
  rm "$pkgdir"/etc/domjudge/{restapi.secret,sudoers-domjudge,dbpasswords.secret}
  install -D "$srcdir"/domjudge-judgehostd.service "$pkgdir"/etc/systemd/system/domjudge-judgehostd.service
}

