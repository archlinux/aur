_pkgbasever=2.3.3
pkgname=libxft-bgra
pkgver=2.3.3.r7.7808631e
pkgrel=1
pkgdesc="libXft with BGRA glyph (color emoji) rendering & scaling patches by Maxime Coste"
arch=('x86_64')
license=('custom')
groups=('modified')
provides=('libxft')
conflicts=('libxft')
url="https://xorg.freedesktop.org/"
depends=('fontconfig' 'libxrender')
makedepends=('git' 'pkgconfig')
source=(${url}/releases/individual/lib/libXft-${_pkgbasever}.tar.bz2{,.sig})
sha512sums=('28fdaf3baa3b156a4a7fdd6e39c4d8026d7d21eaa9be27c9797c8d329dab691a1bc82ea6042f9d4729a9343d93787536fb7e4b606f722f33cbe608b2e79910e8'
            'SKIP')
validpgpkeys=('4A193C06D35E7C670FA4EF0BA2FB9E081F2D130E') # "Alan Coopersmith <alan.coopersmith@oracle.com>"

LIBXFT_UPSTREAM_URL="https://gitlab.freedesktop.org/xorg/lib/libxft.git"
GITLAB_REVISION=7
COMMIT_ID=7808631e7a9a605d5fe7a1077129c658d9ec47fc

pkgver() {
  echo "${_pkgbasever}.r${GITLAB_REVISION}.`echo $COMMIT_ID | cut -c1-8`"
}

prepare() {
  set -eo pipefail

  pushd libXft-${_pkgbasever}
  curl -S https://gitlab.freedesktop.org/xorg/lib/libxft/-/commit/${COMMIT_ID}.patch | patch -p1
  popd

  set +eo pipefail
}

build() {
  cd libXft-${_pkgbasever}
  ./configure --prefix=/usr --sysconfdir=/etc --disable-static
  make
}

package() {
  cd libXft-${_pkgbasever}
  make DESTDIR="${pkgdir}" install
  install -d -m755 "${pkgdir}/usr/share/licenses/${pkgname}"
  install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"

}
