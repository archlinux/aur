# Contributor: Marti Raudsepp <marti@juffo.org>
# Contributor: skydrome <skydrome@i2pmail.org>
# Maintainer: mutantmonkey <aur@mutantmonkey.in>

pkgname=tcpcrypt-git
pkgver=346.ec01927
pkgrel=1
pkgdesc="Transparent user space implementation for the tcpcrypt TCP extensions"
arch=('i686' 'x86_64')
url="http://tcpcrypt.org"
license=('BSD')
depends=('libnetfilter_queue' 'libnetfilter_conntrack' 'libnfnetlink'
         'libcap' 'openssl' 'iptables')
makedepends=('git')
provides=('tcpcrypt')
conflicts=('tcpcrypt')
install='tcpcrypt.install'
backup=('etc/conf.d/tcpcryptd.conf')
source=("git+https://github.com/scslab/tcpcrypt.git"
        'tcpcryptd.conf' 'tcpcryptd.service'
        'tcpcryptd.tmpfiles' 'tcpcryptd.sysusers')
sha256sums=('SKIP'
            'a41bfa7b0c8f527f96c993f68e0a02265ad672fe6c2e10f41bc00b8b1f819305'
            '68a3227f971dce0056bbe8768b570fade4ee8b17aca2e354c35352f2bf0a7028'
            '95393df0fca7e228e36b9594e29a3f32514c8f7229b329e0b9a37dab4985b28f'
            'e9c73c4eeff3f14f0fedd14a529f8c81f591ada543b91e82252e5b2b8f11d916')

pkgver() {
  cd tcpcrypt
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd tcpcrypt

  mkdir -p m4
  ./bootstrap.sh
}

build() {
  cd tcpcrypt

  export JAIL_DIR=/run/tcpcryptd
  export JAIL_USER=tcpcryptd
  export DIVERT_PORT=1666
  export CONTROL_SOCKET=\"/run/tcpcryptd.control\"

  ./configure --prefix=/usr
  make
}

package() {
  cd tcpcrypt
  make DESTDIR="$pkgdir" install

  install -dm755 "$pkgdir/usr/lib/tmpfiles.d"
  echo 'd /run/tcpcryptd 0700 tcpcryptd tcpcryptd' >"$pkgdir/usr/lib/tmpfiles.d/tcpcryptd.conf"

  install -Dm644 "$srcdir"/tcpcrypt/LICENSE   "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
  install -Dm644 "$srcdir"/tcpcryptd.conf     "$pkgdir"/etc/conf.d/tcpcryptd.conf
  install -Dm644 "$srcdir"/tcpcryptd.service  "$pkgdir"/usr/lib/systemd/system/tcpcryptd.service
  install -Dm644 "$srcdir"/tcpcryptd.tmpfiles "$pkgdir"/usr/lib/tmpfiles.d/tcpcryptd.conf
  install -Dm644 "$srcdir"/tcpcryptd.sysusers "$pkgdir"/usr/lib/sysusers.d/tcpcryptd.conf
}

# vim:set ts=2 sw=2 et:
