# Maintainer: polylux <otto.naderer@openmailbox.org>
# Creator:  prettyvanilla <prettyvanilla@posteo.at>

pkgname=caudio-git
pkgver=2.3.0.r283.4f36d26
pkgrel=1
pkgdesc="Advanced C++ wrapper around OpenAL"
arch=('i686' 'x86_64')
url="https://git.socialnerds.org/gfxdev/caudio.git"
license=('zlib')
depends=('openal' 'libogg' 'libvorbis')
makedepends=('git' 'cmake')
provides=('caudio')
conflicts=('caudio')

_gitname=caudio
#source=("git+https://github.com/R4stl1n/${_gitname}.git")
source=("git+https://git.socialnerds.org/gfxdev/caudio.git")
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  local rel=`grep "^PROJECT_NUMBER" Doxyfile | cut -d "=" -f 2 | tr -d " "`
  printf "%s.r%s" "${rel}" "$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "${_gitname}"

  cmake -DCMAKE_BUILD_TYPE=RelWithDebInfo \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCAUDIO_BUILD_EAX_PLUGIN=OFF \
        -DCAUDIO_BUILD_MP3DECODER_PLUGIN=ON \
        -DCAUDIO_BUILD_SAMPLES=OFF \
        -DCAUDIO_SYSTEM_OGG=ON \
        -DCAUDIO_DEPENDENCIES_DIR=""
  make
}

package() {
  cd "${_gitname}"
  make install DESTDIR="${pkgdir}"

  install License.txt -Dm644 ${pkgdir}/usr/share/licenses/$_pkgname/License.txt
}

