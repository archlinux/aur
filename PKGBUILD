# Maintainer: Sébastien Luttringer
# Contributor: Daniel Micay <danielmicay@gmail.com>
# Contributor: Michal Soltys <soltys@ziu.info>

pkgname=arptables
pkgver=0.0.4
pkgrel=6
pkgdesc='ARP filtering utility'
arch=('x86_64')
url='https://ebtables.netfilter.org/'
depends=('glibc' 'perl' 'bash')
license=('GPL')
backup=("etc/$pkgname.conf")
source=("ftp://ftp.netfilter.org/pub/arptables/arptables-v$pkgver.tar.gz"
        "$pkgname.systemd"
        "$pkgname.service")
md5sums=('c2e99c3aa9d78c9dfa30710ca3168182'
         'e54342a833c52b2bc67e7985e8f8fdfd'
         '7e908fd77ef05bc7a9a05b6e877cd2bf')

build() {
  cd $pkgname-v${pkgver//_/-}
  make
}

package() {
  pushd $pkgname-v${pkgver//_/-}
  make install \
    DESTDIR="$pkgdir" \
    PREFIX=/usr \
    LIBDIR=/usr/lib/arptables \
    BINDIR=/usr/bin \
    MANDIR=/usr/share/man \
    INITDIR=/etc/rc.d \
    SYSCONFIGDIR=/etc
  popd
  # systemd
  install -Dm 755 $pkgname.systemd \
    "$pkgdir/usr/lib/systemd/scripts/$pkgname"
  install -Dm 644 $pkgname.service \
    "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  # default config file
  install -Dm 644 /dev/null "$pkgdir/etc/$pkgname.conf"
  # remove upstream rc
  rm -rf "$pkgdir/etc/rc.d"
}

# vim:set ts=2 sw=2 et:
