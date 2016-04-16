# Maintainer: Glen Dsouza <glen@teameos.org>
# Contributor: jmf <jmf at mesecons dot net>
# Contributor: Pascal Groschwitz <p.groschwitz@googlemail.com>
pkgname=flightgear-git
pkgver=20160416
pkgrel=1
_gitname=flightgear
pkgdesc="An open-source, multi-platform flight simulator"
arch=('i686' 'x86_64')
url="http://flightgear.org/"
license=('GPL')
depends=('libxmu' 'libxi' 'zlib' 'libxrandr' 'glu' 'openal' 'qt5-base' 'fgdata-git' 'openscenegraph-git')
optdepends=()
makedepends=('boost' 'cmake' 'mesa' 'sharutils' 'simgear-git')
provides=('flightgear-git')
conflicts=('flightgear')
source=(git://git.code.sf.net/p/flightgear/flightgear
        'explicitely-link-with-libX11.patch')
md5sums=('SKIP'
         'f1d10be82891991513aee4c5505ac577')

pkgver() {
  echo "$(date +"%Y%m%d")"
}

build() {
  cd ${srcdir}/${_gitname}
  git checkout next
  patch -p1 -i ../explicitely-link-with-libX11.patch
  cmake \
  -DCMAKE_INSTALL_PREFIX=/usr \
  -DENABLE_QT=1 \
  -DFG_DATA_DIR:STRING="/usr/share/flightgear" \
  -DCMAKE_INSTALL_LIBDIR=/usr/lib \
  -DCMAKE_BUILD_TYPE=Debug .
  uudecode -o package/flightgear.png package/flightgear.png.uue
  make || return 1
  sed -i 's|Exec=.*|Exec=fgfs --fg-root=/usr/share/flightgear --launcher|' package/flightgear.desktop
}

package(){
  cd "$srcdir/${_gitname}"
  make DESTDIR="${pkgdir}/" install

  install -Dm0644 package/flightgear.desktop $pkgdir/usr/share/applications/flightgear.desktop
  install -Dm0644 package/flightgear.ico $pkgdir/usr/share/icons/flightgear.ico
  install -Dm0644 package/flightgear.png $pkgdir/usr/share/icons/flightgear.png
  install -Dm0644 scripts/completion/fg-completion.bash $pkgdir/usr/share/bash-completion/completions/fgfs
}

