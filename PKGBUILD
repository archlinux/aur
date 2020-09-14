# Maintainer: Pest <pest@devault.cc>
_pkgname=devault
pkgname="${_pkgname}core-git"
pkgver=r17054.5756dc49e
pkgrel=1
pkgdesc="QT Desktop wallet for the dvt blockchain"
arch=('x86_64')
license=('MIT')
url="https://github.com/devaultcrypto/"
conflicts=("${_pkgname}" "${_pkgname}core")
source=("git+https://github.com/devaultcrypto/${_pkgname}.git")
depends=('boost-libs' 'qt5-base' 'qrencode' 'zeromq' 'miniupnpc'\
         'hicolor-icon-theme' 'libevent')
makedepends=('python' 'boost' 'qt5-tools' 'cmake')
md5sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake \
	-B build -S "${_pkgname}" \
        -DCMAKE_BUILD_TYPE='None' \
	-DBUILD_CTESTS=0 \
        -Wno-dev
    make -C build
}

package(){
  mkdir -p "$pkgdir/usr/bin"
  cd "$srcdir/build/"
  install -D -m755 ./devault* "$pkgdir/usr/bin/"
  cd "$srcdir/${_pkgname}"
  install -D -m644 \
   contrib/debian/devault-qt.desktop \
   "${pkgdir}/usr/share/applications/DeVault-Core.desktop"
  install -D -m644 \
   share/pixmaps/devault-128.png \
   "${pkgdir}/usr/share/icons/hicolor/128x128/apps/devault-128.png"
  install -D -m644 COPYING  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
