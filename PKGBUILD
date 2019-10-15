# Maintainer: Deon Spengler <deon at spengler dot co dot za>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: William Rea <sillywilly@gmail.com>
# Contributor: Hans Janssen <hans@janserv.xs4all.nl>

pkgname=flightgear
pkgver=2019.1.1
_pkgver=${pkgver%.*}
pkgrel=1
pkgdesc="An open-source, multi-platform flight simulator"
arch=(x86_64)
depends=('libxmu' 'libxi' 'zlib' 'openscenegraph34' 'libxrandr' 'glu' 'openal')
makedepends=('boost' 'cmake' 'mesa' 'sharutils' 'simgear' 'qt5-base' 'qt5-declarative' 'qt5-svg')
optdepends=('qt5-base: fgfs --launcher'
	        'qt5-declarative: fgfs --launcher'
            'flightgear-data')
license=("GPL")
url="http://www.flightgear.org/"
options=('makeflags')
source=("http://downloads.sourceforge.net/project/flightgear/release-${_pkgver}/${pkgname}-${pkgver}.tar.bz2")
sha256sums=('d1dff396b9ee96d454dbce8e9ab1aedee9829ced5fd57bcaf999a68b00553ca1')

build() {
  cd "$srcdir"/flightgear-$pkgver
  cmake \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DCMAKE_INSTALL_LIBDIR=lib \
	-DFG_DATA_DIR:STRING="/usr/share/flightgear/data" \
	-DCMAKE_BUILD_TYPE=Release \
	-DFG_BUILD_TYPE=Release .
  make
  sed -i 's|Exec=.*|Exec=fgfs --fg-root=/usr/share/flightgear/data|' package/org.flightgear.FlightGear.desktop
}

package() {
  cd "$srcdir"/flightgear-$pkgver
  make DESTDIR="$pkgdir" install

  install -Dm0644 package/flightgear.ico "$pkgdir"/usr/share/icons/flightgear.ico
  install -Dm0644 scripts/completion/fg-completion.bash "$pkgdir"/usr/share/bash-completion/completions/fgfs
  install -Dm0644 scripts/completion/fg-completion.zsh "$pkgdir"/usr/share/zsh/site-functions/_fgfs
  ln -sf flightgear "$pkgdir"/usr/share/FlightGear
}
