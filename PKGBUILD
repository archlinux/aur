# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>

pkgname=strip-nondeterminism-git
pkgver=0.014.80.9c2df33
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
  printf "%s.%s.%s" "$(git describe --tags --abbrev=0|sed -r 's|(.+/)?(.+)|\2|')" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
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

package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" install
  install -Dm 644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim: ts=2 sw=2 et:
