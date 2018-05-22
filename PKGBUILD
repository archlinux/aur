# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=strip-nondeterminism-git
pkgver=0.041
pkgrel=1
pkgdesc='Tool for stripping bits of non-deterministic information from files'
url='https://salsa.debian.org/reproducible-builds/strip-nondeterminism.git'
arch=('any')
license=('GPL3')
depends=("perl" 'perl-archive-zip' 'perl-archive-cpio')
makedepends=('git')
options=('!emptydirs')
provides=('strip-nondeterminism')
conflicts=('strip-nondeterminism')
source=(${pkgname}::"git+https://salsa.debian.org/reproducible-builds/strip-nondeterminism.git#branch=master")
sha512sums=('SKIP')

pkgver() {
  cd ${pkgname}
  git describe --tags|sed 's|-|+|g'
}

prepare() {
  cd ${pkgname}
  sed -r 's|bin/dh_strip_nondeterminism ||g' -i Makefile.PL
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
  install -Dm 644 README -t "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
