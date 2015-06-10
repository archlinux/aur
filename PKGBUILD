# Maintainer: Duck Hunt <vaporeon@tfwno.gf>

pkgname=bsnes-plus-git
pkgver=0.73r127.a3d2120
pkgrel=1
pkgdesc='debug-oriented fork of bsnes v073'
arch=('i686' 'x86_64')
url='https://github.com/devinacker/bsnes-plus'
license=('GPL3')
depends=('libao' 'libpulse' 'openal' 'qt4' 'sdl' 'xdialog')
makedepends=('mesa' 'git')
source=("git+${url}.git"
        'bsnes')
sha1sums=('SKIP'
          '8ee7fedf0a2aa081f57044eeaf52ba53806f7af6')
conflicts=('bsnes-plus' 'bsnes-classic')
provides=('bsnes-plus')

pkgver() {
  cd bsnes-plus
  printf "0.73r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  export QT_SELECT=4

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