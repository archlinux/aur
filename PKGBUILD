# Maintainer:  Christopher Reimer <mail at c-reimer dot de>

pkgname=opengothic
pkgver=1.0.2207
pkgrel=2
pkgdesc="Open source remake of Gothic 2: Night of the raven"
arch=('x86_64')
url='https://github.com/Try/OpenGothic'
license=('MIT')
depends=('alsa-lib' 'gcc-libs' 'libx11' 'libxcursor' 'vulkan-icd-loader')
makedepends=('cmake' 'git' 'glslang' 'libglvnd' 'vulkan-headers')
source=("git+https://github.com/Try/OpenGothic#commit=16fff0e63df6a00e9801b64c8c72557dbeecb7f7" #tag=opengothic-v1.0.2207
        "git+https://github.com/Try/Tempest.git"
        "git+https://github.com/schellingb/TinySoundFont.git"
        "git+https://github.com/bulletphysics/bullet3.git"
        "git+https://github.com/GothicKit/phoenix.git"
        "git+https://github.com/doctest/doctest.git"
        "git+https://github.com/g-truc/glm.git"
        "git+https://github.com/lmichaelis/phoenix-libsquish.git"
        "git+https://github.com/mandreyel/mio.git"
)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')
options=('!emptydirs')

prepare() {
  cd "${srcdir}/OpenGothic"
  git submodule init
  git config submodule.lib/Tempest.url "$srcdir/Tempest"
  git config submodule.lib/bullet3.url "$srcdir/bullet3"
  git config submodule.lib/TinySoundFont.url "$srcdir/TinySoundFont"
  git config submodule.lib/phoenix.url "$srcdir/phoenix"
  git -c protocol.file.allow=always submodule update
  
  cd "${srcdir}/OpenGothic/lib/phoenix"
  git submodule init
  git config submodule.vendor/doctest.url "$srcdir/doctest"
  git config submodule.vendor/glm.url "$srcdir/glm"
  git config submodule.vendor/libsquish.url "$srcdir/phoenix-libsquish"
  git config submodule.vendor/mio.url "$srcdir/mio"


  git -c protocol.file.allow=always submodule update
}

build() {
  cd "OpenGothic"
  
  cmake -B build \
    -DOpenGL_GL_PREFERENCE=GLVND \
    -DTEMPEST_BUILD_SHARED=OFF \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  cd "OpenGothic"
  DESTDIR="${pkgdir}" make -C build install
  rm -r "${pkgdir}/usr/lib"
  rm -r "${pkgdir}/usr/include"
  
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

