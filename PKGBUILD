# Maintainer: Roman Sommer <roman.sommer@fau.de>
pkgname=veroroute
_pkgvermajor=1
_pkgverminor=86
pkgver=$_pkgvermajor.$_pkgverminor
pkgrel=1
epoch=
pkgdesc="Qt based Veroboard/Perfboard/PCB layout and routing application"
arch=('i686' 'x86_64')
url="https://sourceforge.net/projects/veroroute"
license=('GPLv3+')
groups=()
depends=(qt5-base geda-gaf)
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
_sourcearchive="VeroRoute_V${_pkgvermajor}${_pkgverminor}_Src.zip"
source=("https://downloads.sourceforge.net/project/$pkgname/$_sourcearchive"
		"veroroute.desktop.in"
		"veroroute-clib.scm")
sha256sums=('be95e383b04a8d7de8fb11852ef1feac29c152c94214e06a503b2f92e26a8f41'
            'b3dd5944f8330be2a4898d32e2ac3cbf97ea39e3a118b460a4dc313155a34f93'
            'a722805c46998bff7709357babc2e609fbc4b0021b33c59aefa4f7fa0567aeeb')

noextract=()

prepare() {
  echo "$srcdir"
  cd "$srcdir/VeroRoute"

  sed -e "s|__VERSION__|${pkgver}|g" -e "s|__COMMENT__|${pkgdesc}|g" $srcdir/veroroute.desktop.in > $srcdir/veroroute.desktop
}

build() {
  cd "$srcdir/VeroRoute"
  mkdir -p build
  cd build
  qmake ../Src/veroroute.pro
  make
}

check() {
  cd "$srcdir/VeroRoute/build"
  make -k check
}

package() {
  cd "$srcdir/VeroRoute"
  install -Dm755 veroroute "$pkgdir/usr/bin/veroroute"
  mkdir -p "$pkgdir/usr/share/man/man1"
  install -Dm644 "veroroute.1" "$pkgdir/usr/share/man/man1/"
  mkdir -p "$pkgdir/usr/share/pixmaps/"
  install -Dm644 veroroute.png "$pkgdir/usr/share/pixmaps/"
  mkdir -p "$pkgdir/usr/share/applications/"
  install -Dm644 "$srcdir/veroroute.desktop" "$pkgdir/usr/share/applications/"
  mkdir -p "$pkgdir/usr/share/veroroute/tutorials"
  install -Dm644 veroroute.png "$pkgdir/usr/share/veroroute/"  # install veroroute.png twice
  find tutorials -maxdepth 1 -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/veroroute/tutorials" \;
  # mkdir -p "$pkgdir/usr/share/veroroute/templates"
  # if [ -d templates ] ; then
  # 	find templates -maxdepth 1 -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/veroroute/templates" \;
  # fi
  mkdir -p "$pkgdir/usr/share/gEDA/sym"
  (cd libraries/gEDA; find . -mindepth 2 -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/gEDA/sym/{}" \;)
  mkdir -p "$pkgdir/usr/share/gEDA/gafrc.d/"
  install -Dm644 "$srcdir/veroroute-clib.scm" "$pkgdir/usr/share/gEDA/gafrc.d/"
}

# vim:set ts=2 sw=2 et:
