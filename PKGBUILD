# $Id: PKGBUILD 266875 2017-11-15 14:29:11Z foutrelis $
# Maintainer: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Maintainer: William Rea <sillywilly@gmail.com>
# Contributor: Hans Janssen <hans@janserv.xs4all.nl>

pkgname=flightgear
pkgver=2017.3.1
_pkgver=${pkgver%.*}
pkgrel=1
pkgdesc="An open-source, multi-platform flight simulator"
arch=(x86_64)
depends=('libxmu' 'libxi' 'zlib' 'openscenegraph' 'subversion' 'libxrandr' 'glu' 'openal')
makedepends=('boost' 'cmake' 'mesa' 'sharutils' 'simgear' 'qt5-base' 'qt5-declarative')
optdepends=('qt5-base: fgfs --launcher'
	    'qt5-declarative: fgfs --launcher')
license=("GPL")
url="http://www.flightgear.org/"
options=('!makeflags')
source=("http://downloads.sourceforge.net/project/flightgear/release-${_pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('6f2e1d992e2f202b8f9c918c9fb19124ef06824ea0e767e2f4dff6ba43728ccd')

build() {
  cd "$srcdir"/flightgear-$pkgver
  cmake \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_INSTALL_LIBDIR=lib \
	-DFG_DATA_DIR:STRING="/usr/share/flightgear/data" .
#  uudecode -o package/flightgear.png package/flightgear.png.uue
  make
  sed -i 's|Exec=.*|Exec=fgfs --fg-root=/usr/share/flightgear/data|' package/org.flightgear.FlightGear.desktop
}

package() {
  depends=(${depends[@]} 'flightgear-data')

  cd "$srcdir"/flightgear-$pkgver
  make DESTDIR="$pkgdir" install

  install -Dm0644 package/org.flightgear.FlightGear.desktop "$pkgdir"/usr/share/applications/flightgear.desktop
  install -Dm0644 package/flightgear.ico "$pkgdir"/usr/share/icons/flightgear.ico
#  install -Dm0644 package/flightgear.png "$pkgdir"/usr/share/icons/flightgear.png
  install -Dm0644 scripts/completion/fg-completion.bash "$pkgdir"/usr/share/bash-completion/completions/fgfs
  install -Dm0644 scripts/completion/fg-completion.zsh "$pkgdir"/usr/share/zsh/site-functions/_fgfs
  ln -sf flightgear "$pkgdir"/usr/share/FlightGear
}
