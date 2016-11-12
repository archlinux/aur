# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=strip-nondeterminism-git
pkgver=0.028+4+gd1126e4
pkgrel=1
pkgdesc='Tool for stripping bits of non-deterministic information from files'
url='https://anonscm.debian.org/git/reproducible/strip-nondeterminism.git'
arch=('any')
license=('GPL3')
depends=("perl" 'perl-archive-zip')
makedepends=('git')
options=('!emptydirs')
provides=('strip-nondeterminism')
conflicts=('strip-nondeterminism')
source=(${pkgname}::git+https://anonscm.debian.org/git/reproducible/strip-nondeterminism.git)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --tags|sed 's|-|+|g'
}

prepare() {
  cd ${pkgname}
  sed -r 's|bin/dh_strip_nondeterminism ||g' -i Makefile.PL
  sed -r '/dh_strip_nondeterminism/d' -i t/binaries.t
}

build() {
  cd ${pkgname}
  PERL_MM_USE_DEFAULT=1 perl Makefile.PL INSTALLDIRS=vendor
  make
}

check() {
  cd ${pkgname}
  PERLLIB=./lib make test
}

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim: ts=2 sw=2 et:
