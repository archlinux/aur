# Maintainer: Andy Weidenbaum <archbaum@gmail.com>
# JVM build disabled 2016-01-04 'gen/jvm/stage1/NQPHLL.jar' failed

pkgname=nqp-git
pkgver=20160104
pkgrel=2
pkgdesc="Lightweight Perl 6-like environment for virtual machines, with MoarVM support"
arch=('i686' 'x86_64')
depends=('moarvm')
makedepends=('git' 'make')
groups=('perl6')
url="https://github.com/perl6/nqp"
license=('PerlArtistic')
source=(git+https://github.com/perl6/nqp)
sha256sums=('SKIP')
provides=('nqp')
conflicts=('nqp')

pkgver() {
  cd ${pkgname%-git}
  git log -1 --format="%cd" --date=short | sed "s|-||g"
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
  make DESTDIR="$pkgdir" install

  msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
