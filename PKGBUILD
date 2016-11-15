# Maintainer: Vaporeon <vaporeon@tfwno.gf>

pkgname=bsnes-plus-git
pkgver=0.73r252.701e7fd
pkgrel=2
pkgdesc='debug-oriented fork of bsnes v073'
arch=('i686' 'x86_64')
url='https://github.com/devinacker/bsnes-plus'
license=('GPL3')
depends=('libao' 'libpulse' 'openal' 'qt4' 'sdl' 'zenity')
makedepends=('mesa' 'git')
source=("git+${url}.git"
        'bsnes')
sha1sums=('SKIP'
          '102a1295bfa6389a989f65d3037537f7d537e68b')
conflicts=('bsnes-plus' 'bsnes-classic')
provides=('bsnes-plus')

pkgver() {
  cd bsnes-plus
  printf "0.73r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  export qtpath=/usr/lib/qt4

  cd "${srcdir}"/bsnes-plus/bsnes

  for p in {accuracy,compatibility}; do
    make profile="$p"
    mv out/bsnes{,-$p}
    make clean
  done

  for l in {snesfilter,snesreader,supergameboy}; do
    cd "${srcdir}"/bsnes-plus/"$l"
    make
  done
}

package() {
  cd "${srcdir}"/bsnes-plus/
  install -dm 755 "${pkgdir}"/usr/{bin,lib,share/{applications,pixmaps}}
  install -m 755 ../bsnes "${pkgdir}"/usr/bin/
  install -m 644 bsnes/data/bsnes.desktop "${pkgdir}"/usr/share/applications/
  install -m 644 bsnes/data/bsnes.png "${pkgdir}"/usr/share/pixmaps/
  install -m 644 snesfilter/libsnesfilter.so "${pkgdir}"/usr/lib/
  install -m 644 snesreader/libsnesreader.so "${pkgdir}"/usr/lib/
  install -m 644 supergameboy/libsupergameboy.so "${pkgdir}"/usr/lib/

  for p in {accuracy,compatibility}; do
    install -m 755 bsnes/out/bsnes-$p "${pkgdir}"/usr/bin/
  done
}
