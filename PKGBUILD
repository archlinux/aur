# Maintainer: Roman Sommer <roman.sommer@fau.de>
pkgname=veroroute
_pkgvermajor=1
_pkgverminor=53
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
		"veroroute-clib.scm"
		"0001-resolve-system-wide-Tutorials-path.patch")
sha256sums=('7eaf54f4f54aadc4f1357106c1da6ac5867454e6b7c4f1425ad03f183217605f'
            'bbf5a01f8f05909f52cee36ac0184c039aca313d078bcced47dcdcfcaa26bba9'
            'a722805c46998bff7709357babc2e609fbc4b0021b33c59aefa4f7fa0567aeeb'
            '04ac245c78425c08966558456630215d29db5b5e83a172f5a2e6c5a31dd4a9a1')

noextract=()

prepare() {
  echo "$srcdir"
  cd "$srcdir/VeroRoute"

  patch -p1 -i "../0001-resolve-system-wide-Tutorials-path.patch"
  sed -e "s|__VERSION__|${pkgver}|g" -e "s|__COMMENT__|${pkgdesc}|g" $srcdir/veroroute.desktop.in > $srcdir/veroroute.desktop
}

build() {
  cd "$srcdir/VeroRoute"
  mkdir -p build
  cd build
  qmake ../Src
  make
}

check() {
  cd "$srcdir/VeroRoute/build"
  make -k check
}

package() {
  cd "$srcdir/VeroRoute"
  install -Dm755 VeroRoute "$pkgdir/usr/bin/veroroute"
  mkdir -p "$pkgdir/usr/share/pixmaps/"
  install -Dm644 VeroRoute.png "$pkgdir/usr/share/pixmaps/"
  mkdir -p "$pkgdir/usr/share/applications/"
  install -Dm644 "$srcdir/veroroute.desktop" "$pkgdir/usr/share/applications/"
  mkdir -p "$pkgdir/usr/share/veroroute/Tutorials"
  install -Dm644 VeroRoute.png "$pkgdir/usr/share/veroroute/"  # install veroroute.png twice
  find Tutorials -maxdepth 1 -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/veroroute/Tutorials" \;
  mkdir -p "$pkgdir/usr/share/veroroute/Templates"
  if [ -d Templates ] ; then
	find Templates -maxdepth 1 -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/veroroute/Templates" \;
  fi
  mkdir -p "$pkgdir/usr/share/gEDA/sym"
  (cd Libraries/gEDA; find . -mindepth 2 -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/gEDA/sym/{}" \;)
  mkdir -p "$pkgdir/usr/share/gEDA/gafrc.d/"
  install -Dm644 "$srcdir/veroroute-clib.scm" "$pkgdir/usr/share/gEDA/gafrc.d/"
}

# vim:set ts=2 sw=2 et:
