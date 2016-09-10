# Maintainer: Carsten Feuls <archlinux@carstenfeuls.de>
# Contributor:   AXVill
# Contributor:  dacoit <dacoit at tuta.io>
# Contributor:  xjpvictor Huang <ke [AT] xjpvictor [DOT] info>
# Contributor:  uuwe
pkgname=openswan
pkgver=2.6.49
pkgrel=1
pkgdesc='Open Source implementation of IPsec for the Linux operating system'
url='https://www.openswan.org'
arch=('i686' 'x86_64')
license=('GPL' 'custom')
depends=('gmp' 'perl' 'iproute2')
makedepends=('flex' 'bison')
optdepends=('python2')
conflicts=('ipsec-tools')
options=('!makeflags')
backup=('etc/ipsec.conf'
        'etc/ipsec.d/policies/'{block,clear,clear-or-private,private,private-or-clear})
source=("http://download.openswan.org/openswan/openswan-${pkgver}.tar.gz"
        'openswan.service')

prepare() {
  cd "$pkgname-$pkgver"

  # Change install paths to Arch defaults
  sed -i 's|/usr/local|/usr|;s|libexec/ipsec|lib/openswan|;s|)/sbin|)/bin|' Makefile.inc

  # Replace invalid init script paths with systemd script path
  sed -i 's/^INC_RCDIRS.*/INC_RCDIRS\?\=\/usr\/lib\/systemd\/scripts/' Makefile.inc
}

build() {
  cd "$pkgname-$pkgver"
  make USE_XAUTH=true USE_OBJDIR=true programs
}

package() {
  cd "$pkgname-$pkgver"

  # Pre-create init script directory
  mkdir -p "$pkgdir/usr/lib/systemd/scripts"

  make DESTDIR="$pkgdir" install

  # Change permissions in /var
  mv "$pkgdir/var/run" "$pkgdir/"
  rm -r "$pkgdir/var"
  chmod 700 "$pkgdir/run/pluto"

  # Copy License
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/openswan/LICENSE"

  # Install service unit
  install -Dm644 "$srcdir/openswan.service" "$pkgdir/usr/lib/systemd/system/openswan.service"

  # fix manpages
  mv "$pkgdir/usr/man" "$pkgdir/usr/share/"

  # fix python2
  sed -i '1s|python|python2|' "$pkgdir/usr/lib/openswan/verify"
}

sha512sums=('2c8847b6594a88afc260c27374f5ba9202dc8fb20e5c2b00319f5c3491d783ccbc0066515224640ad41cd54e8c2383a70a5712e98decb556b1685253202d3295'
            'a234e97a4fe10fb85a8a1b69d0b55b7c7a4a9ef44c199f876f64bb7290e9f161b20e4c721112e26c6a5636a898a27a36b525aae0944cf6217ff81c36389d5803')
