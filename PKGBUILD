# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# Contributor: spider-mario <spidermario@free.fr>
# JVM build disabled 2015-12-27 (Missing serialize function for REPR ContextRef)

pkgname=rakudo-git
pkgver=20160130
pkgrel=1
pkgdesc="Perl 6 on MoarVM"
arch=('i686' 'x86_64')
depends=('moarvm' 'nqp')
makedepends=('git' 'make' 'perl')
optdepends=('gdb: GDB runner'
            'valgrind: Valgrind runner')
groups=('perl6')
url="https://github.com/rakudo/rakudo"
license=('PerlArtistic')
source=(git+https://github.com/atweiden/rakudo#branch=tools-parse-revision)
sha256sums=('SKIP')
provides=('perl6' 'rakudo')
conflicts=('perl6' 'rakudo')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
}

prepare() {
  cd ${pkgname%-git}

  msg2 'Fixing pre-release version...'
  echo 2016.01-RC1 > tools/build/NQP_REVISION
  echo 2016.01-RC1 > VERSION
  sed -i '/config<version>/s@$version@2016.01-RC1@' tools/build/gen-version.pl
}

build() {
  cd ${pkgname%-git}

  msg2 'Building...'
  perl Configure.pl --prefix=/usr --backends=moar
  make
}

package() {
  cd ${pkgname%-git}

  msg2 'Installing...'
  RAKUDO_LOG_PRECOMP=1 make DESTDIR="$pkgdir" install

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type f -name "*.lock" -exec rm '{}' \;
  find "$pkgdir" -type f -print0 | xargs -0 sed -i "s,$pkgdir,,g"
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
