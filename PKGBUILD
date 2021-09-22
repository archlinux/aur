# Maintainer: Alex Brinister <IrVQ55Gw9TZ7BW8e at tuta dot io>
# Contributor: Kingan <kingan201 at gmail dot com> 
# Contributor: Frederic Bezies <fredbezies at gmail dot com> 
# Contributor: Valsu [arch(at)hylia.de]

pkgname=prboom-plus
pkgver=2.6.1um
pkgrel=1
pkgdesc='An advanced, Vanilla-compatible Doom engine based on PrBoom'
url='https://github.com/coelckers/prboom-plus'
arch=('x86_64')
license=('GPL2')
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
source=("https://github.com/coelckers/prboom-plus/archive/refs/tags/v$pkgver.tar.gz"
        "afece38_guard_opengl_call_in_d_display_with_gl_doom.patch")
sha1sums=('440a5dd10077ea7f8fe0b3cd3384bc757dc92c62'
          'e9dad1f15a87be17909d6381b7304041000d6e51')

_rootdir="prboom-plus-${pkgver}/prboom2"
_builddir="${_rootdir}/cbuild"

prepare() {
  cd "${srcdir}"  
  sed -i -E 's/mktemp/mkstemp/g' $(find "${_rootdir}" -type f -name r_demo.c)

  cd "prboom-plus-${pkgver}"
  patch -p1 < "${srcdir}/afece38_guard_opengl_call_in_d_display_with_gl_doom.patch"
}

build() {
  cd "${srcdir}"

  mkdir -p "${_builddir}"
  cd "${_builddir}"

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release ../
  make
}

package() {
  cd "${srcdir}/${_builddir}"

  make DESTDIR="${pkgdir}" gamesdir=/usr/bin install
}
