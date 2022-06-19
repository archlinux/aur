# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=lprint-git
pkgver=253_1.1.0_r13_ged195b5
pkgrel=1
pkgdesc="A Label Printer Application"
arch=('i686' 'x86_64')
url="https://github.com/michaelrsweet/lprint"
license=('apache')
depends=('avahi' 'libcups' 'libpng' 'libusb' 'pappl')
provides=('lprint')
conflicts=('lprint')
makedepends=('git')
source=(git+"${url}.git")
md5sums=('SKIP')

pkgver() {
  cd ${pkgname%-git}
  _totalcommits="$(git rev-list --count HEAD)"
  _curtag="$(git rev-list --tags --max-count=1)"
  _tagver="$(git describe --tags ${_curtag} | sed 's:^v::')"
  _commits="$(git log v${_tagver}..HEAD --oneline | wc -l)"
  _sha="$(git rev-parse --short HEAD)"
  printf "%s_%s_r%s_g%s" ${_totalcommits} ${_tagver} ${_commits} ${_sha} | sed 's:-:_:g'
}

build() {
  cd ${pkgname%-git}

  ./configure --prefix=/usr CPPFLAGS="${CPPFLAGS} -D_FILE_OFFSET_BITS=64"
  make
}

package() {
  cd ${pkgname%-git}

  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
