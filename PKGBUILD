# Maintainer: Alex Brinister <IrVQ55Gw9TZ7BW8e at tuta dot io>
# Contributor: Kingan <kingan201 at gmail dot com> 
# Contributor: Frederic Bezies <fredbezies at gmail dot com> 
# Contributor: Valsu [arch(at)hylia.de]

pkgname=prboom-plus
pkgver=2.6.66
pkgrel=3
pkgdesc='An advanced, Vanilla-compatible Doom engine based on PrBoom'
url='https://github.com/coelckers/prboom-plus'
arch=('x86_64')
license=('GPL-2.0-only')
depends=('sdl2')
optdepends=('dumb' 
            'fluidsynth' 
            'glu' 
            'libmad' 
            'libvorbis' 
            'pcre' 
            'portmidi'
            'sdl2_image'
            'sdl2_mixer'
            'sdl2_net') 
makedepends=('cmake')
conflicts=('prboom-plus-svn' 'prboom-plus-um')
source=("https://github.com/coelckers/prboom-plus/archive/refs/tags/v$pkgver.tar.gz")
sha1sums=('22ba321a39becd7f3d3c654f26f1c1e0a00ba182')

_rootdir="prboom-plus-${pkgver}/prboom2"
_builddir="${_rootdir}/cbuild"

prepare() {
  cd "${srcdir}"  
  sed -i -E 's/mktemp/mkstemp/g' $(find "${_rootdir}" -type f -name r_demo.c)
}

build() {
  cd "${srcdir}"

  mkdir -p "${_builddir}"
  cd "${_builddir}"

  cmake \
    -Wno-dev \
    -DCMAKE_POLICY_VERSION_MINIMUM=3.10 \
    -DCMAKE_C_STANDARD=17 \
    -DCMAKE_C_FLAGS="-Wno-error=incompatible-pointer-types" \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release ../
  make
}

package() {
  cd "${srcdir}/${_builddir}"

  make DESTDIR="${pkgdir}" gamesdir=/usr/bin install
}
