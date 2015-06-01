# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: skydrome <skydrome@i2pmail.org>
# Maintainer: mutantmonkey <aur@mutantmonkey.in>

pkgname=tcpcrypt-git
pkgver=308.bb990b1
pkgrel=1
pkgdesc="Transparent user space implementation for the tcpcrypt TCP extensions"
arch=('i686' 'x86_64')
url="http://tcpcrypt.org"
license=('BSD')
depends=('libnetfilter_queue' 'libnfnetlink' 'libcap' 'openssl' 'iptables')
makedepends=('git')
provides=('tcpcrypt')
conflicts=('tcpcrypt')
install='tcpcrypt.install'
backup=('etc/conf.d/tcpcryptd.conf')
source=("git+https://github.com/scslab/tcpcrypt.git"
        'tcpcryptd.conf'
        'tcpcryptd.service')
sha256sums=('SKIP'
            'a41bfa7b0c8f527f96c993f68e0a02265ad672fe6c2e10f41bc00b8b1f819305'
            '68a3227f971dce0056bbe8768b570fade4ee8b17aca2e354c35352f2bf0a7028')

pkgver() {
  cd tcpcrypt
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd tcpcrypt
  mkdir -p m4

  sed -i 's:AC_PROG_LIBTOOL:LT_INIT:' configure.ac
  ./bootstrap.sh
}

build() {
  cd tcpcrypt

  export JAIL_DIR='/run/tcpcryptd'
  export JAIL_USER='tcpcryptd'
  export DIVERT_PORT='1666'
  export CONTROL_SOCKET='/run/tcpcryptd.control'

  ./configure --prefix=/usr
  make
}

package() {
  cd tcpcrypt
  make DESTDIR="$pkgdir" install

  install -dm755 "$pkgdir/usr/lib/tmpfiles.d"
  echo 'd /run/tcpcryptd 0700 tcpcryptd tcpcryptd' >"$pkgdir/usr/lib/tmpfiles.d/tcpcryptd.conf"

  install -Dm644 "$srcdir"/tcpcrypt/LICENSE  "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
  install -Dm644 "$srcdir"/tcpcryptd.conf    "$pkgdir"/etc/conf.d/tcpcryptd.conf
  install -Dm644 "$srcdir"/tcpcryptd.service "$pkgdir"/usr/lib/systemd/system/tcpcryptd.service
}

# vim:set ts=2 sw=2 et:
