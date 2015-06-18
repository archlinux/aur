# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
 
pkgname=hydra-git
pkgver=8.2.130.392251f
pkgrel=1
pkgdesc='A very fast network logon cracker which support many different services'
url='http://www.thc.org/thc-hydra/'
arch=('i686' 'x86_64')
license=('GPL3')
depends=('postgresql-libs' 'subversion' 'libssh' 'libmariadbclient' 'libidn' 'libfbclient' 'afpfs-ng')
optdepends=(
  'gtk2: graphical front-end (xhydra)'
)
makedepends=('git' 'gtk2')
provides=('hydra')
conflicts=('hydra')
source=(${pkgname}::git+https://github.com/vanhauser-thc/thc-hydra
        fix-locations.patch)
sha512sums=('SKIP'
            '229fdaff59c6970a030ec81a78a2d34861a6caa947e7c2f6f9186cfd3bc0bf35ec96deadaae58ff1eaa45574f268fa5d9b9688df8c033fcee35ddeb302fb2069')

pkgver() {
  cd ${pkgname}
  printf "%s.%s.%s" "$(grep Release CHANGES|head -n1|cut -d\  -f2|cut -d- -f1)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}


prepare() {
  cd ${pkgname}
  patch -p1 < ../fix-locations.patch
}

build() {
  cd ${pkgname}
  ./configure --prefix=/usr
  make
}
 
package() {
  cd ${pkgname}
  make DESTDIR="${pkgdir}" MANDIR="/share/man/man1" DATADIR="/share/${pkgname}" install
  install -Dm 644 README "${pkgdir}/usr/share/doc/${pkgname}/README"
}

# vim:set ts=2 sw=2 et:
