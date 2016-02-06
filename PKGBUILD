# Maintainer: PhiBo <phibo at dinotools dot org>

pkgname=dionaea-git
pkgver=r1056.cca9471
pkgrel=1
pkgdesc="Dionaea honeypot"
backup=('etc/dionaea/dionaea.conf')
install="${pkgname}.install"
url="https://github.com/DinoTools/dionaea"
license=(GPLv2)
arch=('i686' 'x86_64')
depends=(curl glibc libemu-git liblcfg-git libnl libev libpcap openssl python udns)
makedepends=(git cython)
source=("$pkgname"::'git+https://github.com/DinoTools/dionaea.git'
        'dionaea.service'
)
md5sums=('SKIP'
         '43956c6159b8230efdebfd0f06e64de9'
)


pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  cd "$srcdir/$pkgname"

  sed -i s/AM_CONFIG_HEADER/AC_CONFIG_HEADERS/g ./configure.ac 
  autoreconf -vi
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var/lib/dionaea --with-python=/usr/bin/python3 --disable-werror || return 1
  make || return 1
}

package() {
  cd "$srcdir/$pkgname"
  make DESTDIR=$pkgdir install
  install -D -m644 "${startdir}/dionaea.service" "${pkgdir}/usr/lib/systemd/system/dionaea.service"
  sed -i 's:"var/dionaea/:"dionaea/:g' "${pkgdir}/etc/dionaea/dionaea.conf"
}
 
