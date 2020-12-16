# Maintainer: Mantas Mikulėnas <grawity@gmail.com>
pkgname=remctl
pkgver=3.17
pkgrel=1
pkgdesc="Tool for running commands on remote hosts using Kerberos authentication"
arch=(i686 x86_64)
url="https://www.eyrie.org/~eagle/software/remctl/"
license=(custom)
depends=("krb5")
makedepends=(
  "perl"
  "perl-module-build"
  "php"
  "python"
  "python-setuptools"
  "ruby"
)
provides=(
  "perl-net-remctl=$pkgver"
  "php-remctl=$pkgver"
  "python-remctl=$pkgver"
  "ruby-net-remctl=$pkgver"
)
backup=("etc/remctl/remctl.conf")
source=("https://archives.eyrie.org/software/kerberos/$pkgname-$pkgver.tar.gz"
        "https://archives.eyrie.org/software/kerberos/$pkgname-$pkgver.tar.gz.asc")
sha256sums=('bace4c7617fb567924a15191edb53ccbe22ca06b5578ca9f979993a694d229d6'
            'SKIP')
validpgpkeys=('E784364E8DDE7BB370FBD9EAD15D313882004173')
install="install.sh"

build() {
  cd "$srcdir/$pkgname-$pkgver"
  export REMCTL_PERL_FLAGS="--installdirs=vendor"
  ./configure \
    --prefix=/usr             \
    --sbindir=/usr/bin        \
    --sysconfdir=/etc/remctl  \
    --enable-perl             \
    --enable-php              \
    --enable-python           \
    --enable-ruby             \
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

  # Compatibility symlinks
  ln -s remctld.service "$pkgdir/usr/lib/systemd/system/remctl.service"
}

# vim: ts=2:sw=2:et:ft=sh
