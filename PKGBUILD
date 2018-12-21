# Maintainer: Austin Haedicke <austin.haedicke@gmail.com>
#             GitHub:  https://github.com/savagezen/pkgbuild
#             Telegram:  https://t.me/savagezen_aur
# Contributor: spider-mario <spidermario@free.fr>

pkgname=rakudo-git
pkgver=20181221
pkgrel=1
pkgdesc="Perl6 on MoarVM"
arch=('i686' 'x86_64')
depends=('moarvm' 'nqp')
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
  git log -1 --format="%cd" --date=short --no-show-signature | sed "s|-||g"
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
  export RAKUDO_LOG_PRECOMP=1
  export RAKUDO_RERESOLVE_DEPENDENCIES=0
  make DESTDIR="$pkgdir" install
  install -Dm 755 tools/install-dist.p6 "$pkgdir/usr/bin/perl6-install-dist"
}
