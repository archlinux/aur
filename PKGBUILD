# Maintainer: Vaporeon <vaporeon@vaporeon.io>

pkgname=bsnes-classic-git
pkgver=0.73r83.038e2e0
pkgrel=1
pkgdesc='SNES emulator with Qt GUI and debugger'
arch=('i686' 'x86_64')
url='https://github.com/awjackson/bsnes-classic'
license=('GPL3')
depends=('libao' 'libpulse' 'openal' 'qt4' 'sdl' 'zenity')
makedepends=('mesa' 'git')
source=("git+${url}.git"
        'bsnes')
sha256sums=('SKIP'
            'a51e0c313e1f809aaa2f5cc8c63bd050618053db83a23e76c1a0c5e3d213c2b7')
conflicts=('bsnes-classic' 'bsnes-plus')
provides=('bsnes-classic')

pkgver() {
  cd bsnes-classic
  printf "0.73r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  export qtpath=/usr/lib/qt4/

  cd "${srcdir}"/bsnes-classic/bsnes

  for p in {accuracy,compatibility,performance}; do
    make profile="$p"
    mv out/bsnes{,-$p}
    make clean
  done

  for l in {snesfilter,snesreader,supergameboy}; do
    cd "${srcdir}"/bsnes-classic/"$l"
    make
  done
}

package() {
  cd "${srcdir}"/bsnes-classic/
  install -dm 755 "${pkgdir}"/usr/{bin,lib,share/{applications,pixmaps}}
  install -m 755 ../bsnes "${pkgdir}"/usr/bin/
  install -m 644 bsnes/data/bsnes.desktop "${pkgdir}"/usr/share/applications/
  install -m 644 bsnes/data/bsnes.png "${pkgdir}"/usr/share/pixmaps/
  install -m 644 snesfilter/libsnesfilter.so "${pkgdir}"/usr/lib/
  install -m 644 snesreader/libsnesreader.so "${pkgdir}"/usr/lib/
  install -m 644 supergameboy/libsupergameboy.so "${pkgdir}"/usr/lib/

  for p in {accuracy,compatibility,performance}; do
    install -m 755 bsnes/out/bsnes-$p "${pkgdir}"/usr/bin/
  done
}
