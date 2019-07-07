# Maintainer: Simon Perry <aur [at] sanxion [dot] net>
# Contributor: Pavle <xpio at tut.by>

pkgname=klystrack
pkgver=1.7.6
pkgrel=3
pkgdesc="Tracker for making chiptune-like music on a modern computer"
arch=('i686' 'x86_64')
url="http://kometbomb.github.io/klystrack/"
license=('MIT')
groups=()
depends=('sdl2_image' 'sdl2_mixer')
makedepends=()
provides=('klystrack')
conflicts=('klystrack-git')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/kometbomb/klystrack/archive/${pkgver}-make-fix.tar.gz"
        "klystron-for-klystrack-exec.tar.gz::https://github.com/kometbomb/klystron/archive/for-klystrack-exec.tar.gz")

sha256sums=('b6e24a233ef1bf8989a2ad5caa4d743a9adc178a346bc3080367b7553c7f4595'
            '982f0c8eda20499bf2052c57094738af44339e91348aed55c316c7115834075c')

prepare() {
  if [ -d "${srcdir}/${pkgname}-${pkgver}" ]
  then
    rm -fr "${srcdir}/${pkgname}-${pkgver}"
  fi

  mv "${srcdir}/${pkgname}-${pkgver}-make-fix" "${srcdir}/${pkgname}-${pkgver}"
  rm -fr "${srcdir}/${pkgname}-${pkgver}/klystron"
  mv "${srcdir}/klystron-for-klystrack-exec" "${srcdir}/${pkgname}-${pkgver}/klystron"
  cd "${srcdir}/${pkgname}-${pkgver}"

  # Fix from Pavle's klystrack-git PKGBUILD
  sed -i 's/Default.kt/\/usr\/share\/klystrack\/Default\.kt/' "${srcdir}/${pkgname}-${pkgver}/src/main.c"

  sed -i 's/^CFG = debug/CFG = release/' "${srcdir}/${pkgname}-${pkgver}/klystron/Makefile"
  sed -i 's/^CFG := debug/CFG = release/' "${srcdir}/${pkgname}-${pkgver}/Makefile"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make
}

package() {
  mkdir "${pkgdir}/usr"
  cd "${pkgdir}/usr"
  mkdir -p bin share/klystrack share/applications share/pixmaps share/licenses/klystrack lib/klystrack share/man/man1

  cd "${srcdir}/${pkgname}-${pkgver}"
  install bin.release/klystrack "${pkgdir}/usr/bin/"

  cp -r res/ key/ "${pkgdir}/usr/lib/klystrack/"
  cp -r examples/ "${pkgdir}/usr/share/klystrack/"

  gzip -ck doc/klystrack.1 > "${pkgdir}/usr/share/man/man1/klystrack.1.gz"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/klystrack/"
  install -Dm644 doc/Default.kt "${pkgdir}/usr/share/klystrack/"
  install -Dm644 "linux/klystrack.desktop" "${pkgdir}/usr/share/applications/klystrack.desktop"
  install -Dm644 "icon/256x256.png" "${pkgdir}/usr/share/pixmaps/klystrack.png"
}

# vim:set ts=2 sw=2 et:
