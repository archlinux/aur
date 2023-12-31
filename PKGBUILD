# Maintainer: acxz <akashpatel2008 at yahoo dot com>
# Contributor: Ashley Whetter <(firstname) @ awhetter.co.uk>
# Contributor: Deon Spengler <deon at spengler dot co dot za>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Hans Janssen <hans@janserv.xs4all.nl>

pkgname='flightgear'
pkgver=2020.3.19
_pkgver=${pkgver%.*}
pkgrel=2
pkgdesc="An open-source, multi-platform flight simulator"
arch=('x86_64')
depends=('libxmu' 'libxi' 'zlib' 'openscenegraph' 'libxrandr' 'glu' 'openal')
makedepends=('boost' 'cmake' 'mesa' 'sharutils' "simgear>=${pkgver}" 'qt5-base' 'qt5-declarative' 'qt5-svg')
optdepends=('qt5-base: fgfs --launcher'
            'qt5-declarative: fgfs --launcher'
            'flightgear-data')
license=("GPL")
url="http://www.flightgear.org/"
source=("http://downloads.sourceforge.net/project/flightgear/release-${_pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('167d08de9cc0f72218b379b23cd7e56c7f6ee18d7d559512da51a3bd67f38e6e')

prepare() {
  cd "$srcdir"/flightgear-$pkgver
  sed -i 's|Exec=.*|Exec=fgfs --fg-root=/usr/share/flightgear/data|' package/org.flightgear.FlightGear.desktop
}

build() {
  mkdir -p "$srcdir"/fgbuild
  cd "$srcdir"/fgbuild
  cmake \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DFG_DATA_DIR:STRING="/usr/share/flightgear/data" \
    ../flightgear-$pkgver
  make
}

package() {
  cd "$srcdir"/fgbuild
  make DESTDIR=${pkgdir} install

  cd "$srcdir"/flightgear-$pkgver
  install -Dm0644 package/flightgear.ico "$pkgdir"/usr/share/icons/flightgear.ico
  install -Dm0644 scripts/completion/fg-completion.bash "$pkgdir"/usr/share/bash-completion/completions/fgfs
  install -Dm0644 scripts/completion/fg-completion.zsh "$pkgdir"/usr/share/zsh/site-functions/_fgfs
  ln -sf flightgear "$pkgdir"/usr/share/FlightGear
}
