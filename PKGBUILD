# Maintainer: Bill Durr <billyburly@gmail.com>

_pkgname=libilbc
pkgname=libilbc-git
pkgver=0.0.1.18.829b08c
pkgrel=1
arch=(i686 x86_64)
pkgdesc="Freeswitch fork of iLBC codec"
url="http://www.ilbcfreeware.org/"
license=('custom')
depends=('glibc')
makedepends=('awk' 'audiofile' 'git')
options=(strip)
provides=('ilbc')
conflicts=('ilbc')

source=('git+https://freeswitch.org/stash/scm/sd/libilbc.git')
md5sums=('SKIP')

pkgver() {
  cd ${srcdir}/${_pkgname}
  # git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
  printf "%s.%s.%s" "$(cat README | head -n 1 | cut -d ' ' -f2)" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/${_pkgname}
  ./bootstrap.sh
  ./configure --prefix=/usr --disable-doc --disable-static --disable-rpath
  make
}

package() {
  cd ${srcdir}/${_pkgname}
  make DESTDIR=${pkgdir} install
  install -d ${pkgdir}/usr/share/licenses/ilbc
  install -D ${srcdir}/${_pkgname}/gips_iLBClicense.pdf ${pkgdir}/usr/share/licenses/ilbc
}
