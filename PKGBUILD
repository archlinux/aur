# Maintainer: Vinay Shastry <vinayshastry at gmail dot com>
# Contributor: William J. Bowman <aur@williamjbowman.com>
# Contributor: Gaetan Bisson <bisson@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=unison-git
pkgver=2.51.4.r62.ga39c572
pkgrel=1
pkgdesc='File-synchronization tool'
url='http://www.cis.upenn.edu/~bcpierce/unison/'
arch=('i686' 'x86_64')
license=('GPL2')
optdepends=('gtk2: for gtk2 support')
makedepends=('ocaml' 'lablgtk2' 'emacs' 'git')
source=("unison-git::git+https://github.com/bcpierce00/unison"
        'desktop')
sha256sums=('SKIP'
            'b497b1c23cceb8967e9c3f9a39720e3029d370304ae410795121224f96c234a3')
conflicts=('unison')
provides=('unison')

options=('!makeflags')

pkgver() {
  cd "${srcdir}/${pkgname}"
  #printf "r%s.%s" "$(grep '^VERSION=' src/Makefile.ProjectInfo | cut -d = -f 2)" "$(git rev-parse --short HEAD)"
  printf "%s.%s" "$(grep '^VERSION=' src/Makefile.ProjectInfo | cut -d = -f 2)" "$(git describe --long --tags | sed 's/^v[^-]*-//;s/\([^-]*-g\)/r\1/;s/-/./g')"
}

build() {
  cd "${srcdir}/${pkgname}"
  CFLAGS=""

  make -C src UISTYLE=text THREADS=true
  for ui in text gtk2; do
    cp -a . build || true
    pushd build
    export CFLAGS=
    make all UISTYLE=$ui DEBUGGING=false THREADS=true
    mv src/unison src/unison-$ui
    mv src/unison-* ..
    popd
    rm -fr build
  done
}

package() {
  cd "${srcdir}/${pkgname}"

  install -d "${pkgdir}"/usr/bin
  install -m755 unison-* "${pkgdir}"/usr/bin
  ln -s unison-text "${pkgdir}"/usr/bin/unison

  install -d "${pkgdir}"/usr/share/{pixmaps,applications}
  install -m644 icons/U.32x32x16m.png "${pkgdir}/usr/share/pixmaps/${pkgname/-git}.png"
  install -m644 ../desktop "${pkgdir}/usr/share/applications/${pkgname/-git}.desktop"
}
