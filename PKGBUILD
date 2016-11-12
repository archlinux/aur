# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: JokerBoy <jokerboy at punctweb dot ro>

pkgname=ls++-git
pkgver=0.348.75.47c63f3
pkgrel=1
epoch=1
pkgdesc='Colorized LS on steroids'
url='https://github.com/trapd00r/ls--/'
arch=('any')
license=('GPL2')
depends=('perl-term-extendedcolor')
makedepends=('git')
backup=('etc/ls++.conf')
options=('!emptydirs')
source=(${pkgname}::git+https://github.com/trapd00r/ls--.git
        fix-user-group-align.patch
        make-destdir.patch)
sha512sums=('SKIP'
            '80123d9e11e55643c96ac5e2866cca75ae4197023a16719671d55251ed74cca95f4970c0b07ca0f049edbd96aec6c1c8a6bdbff4b44b4697ee8afb79d8777e28'
            'b4fff9fff1233130dca795ec9a0d7abf1bddb8cc94b2e5ed2b6784e6379ae15d12094a9cfe2b21e8d98f68278903f7726f98d0b3d9861c9e75224de631ea049f')

pkgver() {
  cd ${pkgname}
  _lsver=$(grep 'VERSION =' ls++|sed -r 's/\$VERSION = (.+);/\1/'|cut -d\' -f2)
  echo "${_lsver}.$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgname}
  patch -p1 < "${srcdir}/fix-user-group-align.patch"
  patch -p1 < "${srcdir}/make-destdir.patch"
}

build() {
  cd ${pkgname}
  PERL_MM_USE_DEFAULT=1 \
    PERL_AUTOINSTALL=--skipdeps \
    PERL_MM_OPT="INSTALLDIRS=vendor DESTDIR='${pkgdir}'" \
    PERL_MB_OPT="--installdirs vendor --destdir '${pkgdir}'" \
    MODULEBUILDRC=/dev/null \
    perl Makefile.PL
  make
}

package() {
  cd ${pkgname}
  make PREFIX=/ DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
