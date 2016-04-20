# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: spider-mario <spidermario@free.fr>

pkgname=rakudo-git
pkgver=20160420
pkgrel=1
pkgdesc="Perl6 on MoarVM and the JVM"
arch=('i686' 'x86_64')
depends=('java-runtime' 'moarvm' 'nqp')
makedepends=('git' 'make' 'perl')
optdepends=('gdb: GDB runner'
            'valgrind: Valgrind runner')
groups=('perl6')
url="https://github.com/rakudo/rakudo"
license=('PerlArtistic')
source=(git+https://github.com/rakudo/rakudo)
sha256sums=('SKIP')
provides=('perl6' 'rakudo')
conflicts=('perl6' 'rakudo')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

build() {
  cd ${pkgname%-git}

  msg2 'Building...'
  perl Configure.pl --prefix=/usr --backends=moar,jvm
  make
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing...'
  RAKUDO_LOG_PRECOMP=1 make DESTDIR="$pkgdir" install

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type f -name "*.lock" -exec rm '{}' \;
  find "$pkgdir/usr/share/perl6/precomp" -type f -name "*.deps" -exec \
    sed -i "s,$pkgdir,,g" '{}' +
}
