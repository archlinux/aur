# Maintainer: Jefferson Gonzalez <jgmdev@gmail.com>
# Contributor: Phillip Smith <fukawi2@NO-SPAM.gmail.com>
# Contributor: Christoph Zeiler <rabyte*gmail>

pkgname=firetable
pkgver=5.8
pkgrel=1
pkgdesc="Tool written in PHP to maintain IPtables firewalls under Linux"
arch=('any')
url="https://gitlab.com/hsleisink/firetable"
license=('GPL')
depends=('iptables' 'php')
makedepends=('patch')
backup=(
  'etc/firetable/firetable.conf'
  'etc/firetable/ipv6_eth0'
  'etc/firetable/ipv4_eth0'
)
install="${pkgname}.install"
source=(
  "https://gitlab.com/hsleisink/$pkgname/-/archive/v$pkgver/$pkgname-v$pkgver.tar.gz"
  "${pkgname}.service"
)
md5sums=(
  '2932343d9935737fb9f488c6ecc042bd'
  '64a49e485f646c75abe53d29736674e6'
)

prepare() {
  cd "$srcdir"/$pkgname-v$pkgver

  sed -i "s|/sbin/iptables|/bin/iptables|g" src/firetable
  sed -i "s|/sbin/ip6tables|/bin/ip6tables|g" src/firetable
}

package() {
  cd "$srcdir"/$pkgname-v$pkgver

  make DESTDIR="$pkgdir" install

  # install systemd service unit
  install -Dm644 "$srcdir"/${pkgname}.service "$pkgdir"/etc/systemd/system/${pkgname}.service

  mkdir "$pkgdir"/usr/bin/

  mv "$pkgdir"/usr/sbin/* "$pkgdir"/usr/bin/
  rm -rf "$pkgdir"/usr/sbin/
}
