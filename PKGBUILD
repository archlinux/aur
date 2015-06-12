# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=simpmd-git
pkgdesc="Full emulator of PMD85 (git)"
pkgver=r1.4472469
pkgrel=1
arch=('i686' 'x86_64')
url="http://dsrg.mff.cuni.cz/~ceres/prj/SimPMD/"
license=('apache')
depends=('sdl' 'python' 'popt' 'doxygen')
replaces=('simpmd-svn')
source=("${pkgname}"::'git+https://github.com/jose1711/simpmd.git' 'simpmd.desktop')
md5sums=('SKIP'
         '8fba184b70c9eea6cbe63a9b567fd8b7')


build() {
  cd ${srcdir}/${pkgname}
  make PMD_BUILD=RELEASE PMD_SHARE=/usr/share/simpmd/
  chmod 755 data/monitors/M{1,2,2-Patched-Tape}
}

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${srcdir}/${pkgname}
  mkdir -p $pkgdir/usr/share/{doc/simpmd-${pkgver},simpmd}
  install -D -m755 bin/simpmd $pkgdir/usr/bin/simpmd
  install -D -m755 bin/ptp2raw $pkgdir/usr/bin/ptp2raw
  rm Makefile
  install -D -m644 * $pkgdir/usr/share/doc/simpmd-${pkgver} || true
  cd ${srcdir}/${pkgname}/data
  cp -r . ${pkgdir}/usr/share/simpmd
}
