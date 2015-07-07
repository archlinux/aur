# Maintainer:  Andrzej Giniewicz <gginiu@gmail.com>

pkgname=domjudge
pkgver=3.4.2
pkgrel=1
pkgdesc="programming contest jury system"
arch=('i686' 'x86_64')
url="http://domjudge.sourceforge.net/"
license=('GPL' 'LGPL' 'MIT' 'BSD')
depends=('sudo' 'apache' 'php' 'php-apache' 'mysql' 'curl' 'libxslt')
makedepends=('boost' 'sharutils')
install='domjudge.install'

source=(http://www.domjudge.org/releases/domjudge-$pkgver.tar.gz
        domjudge-submitd.service domjudge-judgehostd.service genpass.patch)
md5sums=('0685323b0067280d9ad6b51396a7d7ec'
         '669e8f1b19875fae04cb0d6077d4fba2'
         '93cd5b10fc2636b664f2c17b4f34436f'
         'b5367f9669746ec3804aa4da9ae988ba')

build() {
  cd "$srcdir"/domjudge-$pkgver
  patch -p0 < ../genpass.patch
  ./configure --enable-fhs --prefix=/usr \
    --sysconfdir=/etc --localstatedir=/var \
    --enable-submitclient=http,dolstra \
    --with-domjudge-user=root --with-webserver-group=http
  make domserver judgehost
}

package() {
  cd "$srcdir"/domjudge-$pkgver
  make install-domserver install-judgehost DESTDIR="$pkgdir"/
  rm -rf "$pkgdir"/tmp
  install -D -m 750 "$pkgdir"/etc/domjudge/sudoers-domjudge "$pkgdir"/etc/sudoers.d/domjudge
  sed -s "s/^root/domjudge/g" -i "$pkgdir"/etc/sudoers.d/domjudge
  rm "$pkgdir"/etc/domjudge/{htpasswd-jury,sudoers-domjudge,dbpasswords.secret}
  install -D "$srcdir"/domjudge-submitd.service "$pkgdir"/etc/systemd/system/domjudge-submitd.service
  install -D "$srcdir"/domjudge-judgehostd.service "$pkgdir"/etc/systemd/system/domjudge-judgehostd.service
}

