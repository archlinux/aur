# Maintainer: Jozef Riha <jose1711 at gmail dot com>

pkgname=simpmd-git
pkgdesc="Full emulator of PMD85 (git)"
pkgver=r55.f6c7da3
pkgrel=1
arch=('i686' 'x86_64')
url="http://dsrg.mff.cuni.cz/~ceres/prj/SimPMD/"
license=('apache')
depends=('sdl' 'python' 'popt' 'doxygen')
replaces=('simpmd-svn')
source=("${pkgname}"::'git+https://github.com/jose1711/simpmd.git' 'simpmd.desktop')
md5sums=('SKIP'
         '547f49d0df09285a3881491e8c3469a2')


build() {
  cd ${srcdir}/${pkgname}
  make PMD_BUILD=RELEASE PMD_SHARE=/usr/share/simpmd/
  chmod 755 data/monitors/M{1,2,2-Patched-Tape}
  sed -i '1s/$/2/' bin/ptp2raw bin/mem2raw bin/rawinfo
}

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd ${srcdir}/${pkgname}
  mkdir -p $pkgdir/usr/share/{doc/simpmd-${pkgver},simpmd}
  install -Dm755 bin/simpmd $pkgdir/usr/bin/simpmd
  install -Dm755 bin/ptp2raw $pkgdir/usr/bin/ptp2raw
  install -Dm755 bin/mem2raw $pkgdir/usr/bin/mem2raw
  install -Dm755 bin/rawinfo $pkgdir/usr/bin/rawinfo
  rm Makefile
  install -Dm644 * $pkgdir/usr/share/doc/simpmd-${pkgver} || true
  cd ${srcdir}/${pkgname}/data
  mv monitors/* .
  rmdir monitors
  cp -r . ${pkgdir}/usr/share/simpmd
  install -Dm644 $srcdir/simpmd.desktop ${pkgdir}/usr/share/applications/simpmd.desktop
}
