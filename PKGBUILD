# Maintainer: Hy Goldsher <hyness-at-hyness-dot-com>
# Contributor: Hy Goldsher <hyness-at-hyness-dot-com>

pkgname=openjo-git
pkgver=3305.233a5a9
pkgrel=1
pkgdesc="Open Source Jedi Knight II - Jedi Outcast Engine"
arch=('i686' 'x86_64')
url=https://github.com/JACoders/OpenJK
license=('GPL')
depends=('libgl' 'openal' 'zlib' 'sdl2' 'libjpeg' 'glu')
optdepends=('libpng')
makedepends=('git' 'cmake' 'yasm')
source=("openjo::git://github.com/JACoders/OpenJK.git"
        'openjo.install'
        'openjosp.desktop'
        'openjosp.png'
        'openjosp.sh')
install=openjo.install
sha256sums=('SKIP'
            '8873237a7c6f12a0347b3e44cb237110ba526603e2b64aa4914bf4845be477c2'
            '9dfa0309a27707c8cf3d4888c8eb917a3d111ae2efa394a6afd9af4cb95278ce'
            'afb2c1a757720c70798e7f7218f823297a43bc61e0cb192e9443df67c2963903'
            '385fb7543625fd651f2bc1e7ede77625969f83da10b7d031c0f461d0e4a19096')
_joarch=i386
[ "$CARCH" == "x86_64" ] && {
  _joarch=x86_64
}

pkgver() {
  cd openjo
  echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

build() {
  cd "${srcdir}/openjo"

  mkdir -p build
  cd build
  cmake ../ \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/opt/${pkgname} \
    -DCMAKE_SIZEOF_VOID_P=4 \
    -DBuildSPGame=OFF \
    -DBuildSPEngine=OFF \
    -DBuildSPRdVanilla=OFF \
    -DBuildMPGame=OFF \
    -DBuildMPCGame=OFF \
    -DBuildMPEngine=OFF \
    -DBuildMPDed=OFF \
    -DBuildMPUI=OFF \
    -DBuildMPRdVanilla=OFF \
    -DBuildJK2SPEngine=ON \
    -DBuildJK2SPGame=ON \
    -DBuildJK2SPRdVanilla=ON
  make
}

package() {
  cd "${srcdir}/openjo/build"
  make DESTDIR="${pkgdir}" install

  mkdir -p "${pkgdir}/usr/bin"
  install -Dm755 "${srcdir}/openjosp.sh"  "${pkgdir}/usr/bin/openjo_sp"
  sed -i "s/ARCH/${_joarch}/g" "${pkgdir}/usr/bin/openjo_sp"
  install -Dm755 "${srcdir}/openjosp.png" "${pkgdir}/usr/share/pixmaps/openjosp.png"
  install -Dm755 "${srcdir}/openjosp.desktop" "${pkgdir}/usr/share/applications/openjosp.desktop"
}

# vim: set ts=2 sw=2 ft=sh noet:
		
