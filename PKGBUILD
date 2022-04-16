# Maintainer: 
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG

pkgname=freeablo
pkgver=0.4+191+g921ac20b
pkgrel=1
pkgdesc="Modern, FLOSS reimplementation of the Diablo 1 game engine"
arch=(x86_64)
url="https://freeablo.org/"
license=(GPL3)
depends=(sdl2_image sdl2_mixer zlib enet bzip2 libgl qt5-base)
makedepends=(cmake git)
install=freeablo.install
source=("git+https://github.com/wheybags/freeablo.git#commit=921ac20be95828460ccc184a9de11eca5c7c0519"
        "https://github.com/wheybags/freeablo/pull/500/commits/1ec095873d725b44f4e0f5616625722de1f85dce.patch"
        "https://github.com/wheybags/freeablo/pull/504/commits/ae952ca143aa0313b2f9018dc33f7f07047fad0a.patch")
sha256sums=('SKIP'
            '31d0455fb4b3ef37b6f9569990d344fa9501ca37d86ba41be1f44fbd028c576a'
            'a8b6601d684a0ed6697a3eedb50889645c5557911b7a137767eef830944cb469')

pkgver() {
  cd "${srcdir}/${pkgname}"
  git describe --long --tags | sed 's/-/+/g;s/^v//'
}

prepare() {
  cd "${srcdir}/${pkgname}"
  mkdir -p build
  patch -Np1 -i ../1ec095873d725b44f4e0f5616625722de1f85dce.patch
  patch -Np1 -i ../ae952ca143aa0313b2f9018dc33f7f07047fad0a.patch
}

build() {
  cd "${srcdir}/${pkgname}/build"
  cmake .. -Wno-dev \
    -DVIDEO_OPENGLES:BOOL=OFF \
    -DVIDEO_RPI:BOOL=OFF \
    -DVIDEO_VIVANTE:BOOL=OFF \
    -DVIDEO_WAYLAND:BOOL=OFF \
    -DVIDEO_WAYLAND_QT_TOUCH:BOOL=OFF \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package() {
  cd "${srcdir}/${pkgname}/build"
  make DESTDIR=${pkgdir} install
  install -Dm644 ../readme.md "${pkgdir}/usr/share/doc/freeablo/readme.md"

  install -D "${srcdir}/freeablo/resources/launcher/play.png" "${pkgdir}/usr/share/pixmaps/freeablo.png"
}
