# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=remctl
pkgver=3.13
pkgrel=2
pkgdesc="Tool for running commands on remote hosts using Kerberos authentication"
arch=(i686 x86_64)
url="http://www.eyrie.org/~eagle/software/remctl/"
license=(custom)
depends=("krb5")
makedepends=(
  #"perl" Okay, it's part of base-devel now
  "php"
  "python2"
  #"ruby" Build broken, I'm not using the ruby bindings, too lazy to fix.
)
backup=("etc/remctl/remctl.conf")
source=("http://archives.eyrie.org/software/kerberos/$pkgname-$pkgver.tar.gz"
        "http://archives.eyrie.org/software/kerberos/$pkgname-$pkgver.tar.gz.asc"
        "remctl.service"
        "remctl@.service"
        "remctl.socket")
sha256sums=('1dedb0943584f9f1ef3964ff658cd62f08d2ed16cece2a124b378ee56f75a37c'
            'SKIP'
            '9801df9c99570fe92c0e215add2e05882a679127914e593055020cc7bee0d1e7'
            '7c04784c70919439025cfda57d7af8f264184c0d6078b42ee7440154392c1082'
            '4da925bc78c22dcb93c2332f3a6182a02e028e372effb63e0cc0eaebb86c935a')
validpgpkeys=('E784364E8DDE7BB370FBD9EAD15D313882004173')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export REMCTL_PERL_FLAGS="--installdirs=vendor"
  export REMCTL_PYTHON_VERSIONS="python2"
  ./configure \
    --prefix=/usr             \
    --sbindir=/usr/bin        \
    --sysconfdir=/etc/remctl  \
    --enable-perl             \
    --enable-php              \
    --enable-python           \
    --disable-ruby            \
    ;
  # parallel builds sometimes fail with missing -lremctl
  make -j1
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm0644 LICENSE              "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm0644 examples/remctl.conf "$pkgdir/etc/remctl/remctl.conf"
  mkdir -p "$pkgdir/etc/remctl/conf.d"
  mkdir -p "$pkgdir/etc/php/conf.d"
  echo 'extension=remctl.so' > "$pkgdir/etc/php/conf.d/remctl.ini"

  cd "$srcdir"
  install -Dm0644 remctl.service  "$pkgdir/usr/lib/systemd/system/remctl.service"
  install -Dm0644 remctl@.service "$pkgdir/usr/lib/systemd/system/remctl@.service"
  install -Dm0644 remctl.socket   "$pkgdir/usr/lib/systemd/system/remctl.socket"
}

# vim: ts=2:sw=2:et:ft=sh
