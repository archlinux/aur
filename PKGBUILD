# Maintainer: Stefan Husmann <stefan-husmann@t-online.de>
pkgname=amaya-git
pkgver=53.707efb5
pkgrel=3
pkgdesc="W3C's WYSIWYG HTML Editor"
arch=('i686' 'x86_64')
url="http://www.w3.org/Amaya/"
license=('W3C')
depends=('gtk2' 'libsm' 'raptor1' 'glu' 'libxxf86vm')
makedepends=('git' 'perl' 'mesa' 'clang')
provides=('amaya')
conflicts=('amaya')
source=("git+https://github.com/stefanhusmann/Amaya.git" \
  'http://www.w3.org/Amaya/Distribution/Dutch.tgz' \
  'http://www.w3.org/Amaya/Distribution/German.tgz' \
  'http://www.w3.org/Amaya/Distribution/Italian.tgz'  \
  'http://www.w3.org/Amaya/Distribution/Spanish.tgz' \
  'http://www.w3.org/Amaya/Distribution/Swedish.tgz')
md5sums=('SKIP'
         '3edb9cce5ce160d7270b23808c1d5981'
         '400eeeae974a64d23de4fcdd609c30bc'
         '05e2d25ee8af11faaaa25a33da89d504'
         'b504a75cd0f789a3046bf2041067b18b'
         '6536ab2e31e3f58618ba79d9fddc7f76')

_gitname="Amaya"
_gui=WX
options=('!makeflags')

pkgver() {
  cd "$srcdir"/$_gitname
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "$srcdir"/$_gitname/
  bsdtar xf Library/amaya-lib-src.tar
  cd "$srcdir/$_gitname"/Mesa/configs
  rm current
  [[ $CARCH == x86_64 ]] && ln -s linux-x86-64 current
  [[ $CARCH == i686 ]] && ln -s linux-x86 current
  cd "$srcdir"/$_gitname/$_gitname
  if [ -d ./${_gui} ]; then
    rm -rf ${_gui}
  fi
  mkdir ${_gui}; cd ${_gui}

  #  CC=gcc-4.7 CXX=g++-4.7 LD=g++-4.7 \
  CC=clang CXX=clang++ \
    ../configure --prefix=/usr/share --exec=/usr/share --datadir=/usr/share \
    --enable-system-raptor --with-gl --enable-static
  make 
}

package() {
  cd "$srcdir/$_gitname/$_gitname/$_gui"
  install -d "$pkgdir"/usr/share/Amaya/resources/{svg,icons}
  make prefix="$pkgdir"/usr/bin install

  install -Dm755 "$pkgdir"/usr/bin/Amaya/wx/bin/amaya "$pkgdir"/usr/bin/amaya
  rm "$pkgdir"/usr/bin/Amaya/wx/bin/amaya
  sed -i s+share+bin+ "$pkgdir"/usr/bin/amaya

  cd "$srcdir"
  for _i in Dutch German Italian Spanish Swedish
  do
    bsdtar xf "$srcdir"/${_i}.tgz
  done
  for _i in Gprinc.dic Iprinc.dic Nprinc.dic Sprinc.dic	Wprinc.dic
  do
    install -Dm644 ${_i} "$pkgdir"/usr/share/Amaya/dicopar/${_i}
  done
  install -d "$pkgdir"/usr/share/doc/amaya
  cp -a "$srcdir/$_gitname/$_gitname"/doc/* "$pkgdir"/usr/share/doc/amaya
  cp -a "$srcdir/$_gitname/$_gitname"/resources/icons \
     "$pkgdir"/usr/share/Amaya/resources
  cp -a "$srcdir/$_gitname/$_gitname"/resources/svg \
     "$pkgdir"/usr/share/Amaya/resources
  rmdir "$pkgdir"/usr/bin/Amaya/davlib
}
