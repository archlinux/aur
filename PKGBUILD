# Maintainer: Llewelyn Trahaearn <WoefulDerelict at GMail dot com>
# Contributor: SpepS <dreamspepser at yahoo dot it>

pkgname=vsxu-git
pkgver=0.5.1.r50.g4a34b08
pkgrel=2
pkgdesc="A free to use program that lets you create and perform real-time audio visual presets."
arch=('i686' 'x86_64')
url="http://www.vsxu.com/"
license=('GPL' 'custom')
depends=('desktop-file-utils' 'glew' 'glfw' 'libpng' 'opencv' 'xdg-utils')
makedepends=('alsa-lib' 'cmake' 'git' 'jack' 'pulseaudio')
optdepends=(
  'alsa-lib: ALSA support.'
  'jack: JACK support'
  'pulseaudio: PulseAudio support'
)
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("${pkgname}::git+https://github.com/vovoid/vsxu.git"
        "cal3d::git+https://github.com/vovoid/cal3d.git")
sha512sums=('SKIP'
            'SKIP')
_branch=glfw3

pkgver() {
  cd "${srcdir}/${pkgname}"
  git checkout ${_branch} --quiet
  ( set -o pipefail
    git describe --long --tags 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "${pkgname}"
  [[ -d build ]] || mkdir build
  git checkout ${_branch}
  git submodule init
  git config submodule.plugins/src/mesh.importers/cal3d.url "${srcdir}/cal3d"
  git submodule update plugins/src/mesh.importers/cal3d
  # Patch CAL3D to build against GCC 6.1.1
  sed -i -e "s/return false/return 0/" "${srcdir}/vsxu-git/plugins/src/mesh.importers/cal3d/cal3d/src/cal3d/loader.cpp"
  sed -i -e "s/return false/return 0/" "${srcdir}/vsxu-git/plugins/src/mesh.importers/cal3d/cal3d/src/cal3d/xmlformat.cpp"
}

build() {
  cd "${pkgname}/build"
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${pkgname}/build"
  make DESTDIR="${pkgdir}" install

  # License.
  install -Dm644 "../COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
} 
