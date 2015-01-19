# Maintainer: mutantmonkey <aur@mutantmonkey.in>
# Contributor: skydrome <skydrome@tormail.org>
pkgname=tlsdate-git
pkgver=704.fd04f48
pkgrel=1
pkgdesc="A secure rdate replacement to update local time over HTTPS, git version"
arch=('i686' 'x86_64' 'armv6l' 'armv6h' 'arm7l' 'arm7h')
url="https://github.com/ioerror/tlsdate"
license=('BSD')
depends=('openssl' 'ca-certificates' 'dbus' 'zlib' 'libevent' 'libseccomp')
conflicts=('tlsdate')
provides=('tlsdate')
options=(emptydirs)
install=tlsdate.install
backup=('etc/conf.d/tlsdate'
        'etc/tlsdate/tlsdated.conf')
source=('git+https://github.com/ioerror/tlsdate.git'
        'tlsdate.conf.d'
        'tlsdate.service')
sha256sums=('SKIP'
            '1498a74913feb66c6e2e7d982f43b07fc48881947543969668a75ef4323503aa'
            'fe3fb8181be0a9214f351c64461680f603ea27b7b7c566c9eec189084783aa92')

pkgver() {
  cd "$srcdir/tlsdate"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd "$srcdir/tlsdate"
  ./autogen.sh
}

build() {
  cd "$srcdir/tlsdate"

  ./configure \
      --prefix=/usr \
      --sbindir=/usr/bin \
      --sysconfdir=/etc \
      --with-dbus-client-group=tlsdate \
      --with-unpriv-group=tlsdate \
      --with-unpriv-user=tlsdate \
      --without-polarssl
  make
}

package() {
  cd "$srcdir/tlsdate"

  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/tlsdate/LICENSE"
  install -Dm644 "$srcdir/tlsdate.conf.d"  "$pkgdir/etc/conf.d/tlsdate"
  install -Dm644 "$srcdir/tlsdate.service" "$pkgdir/usr/lib/systemd/system/tlsdate.service"
}

# vim:set ts=2 sw=2 et:
