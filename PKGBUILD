# Maintainer:  Christopher Reimer <mail at c-reimer dot de>

pkgname=opengothic
pkgver=1.0.3010
pkgrel=1
pkgdesc="Open source remake of Gothic 2: Night of the raven"
arch=('x86_64')
url='https://github.com/Try/OpenGothic'
license=('MIT')
depends=('alsa-lib' 'gcc-libs' 'libx11' 'libxcursor' 'vulkan-icd-loader')
makedepends=('cmake' 'git' 'glslang' 'libglvnd' 'vulkan-headers')
source=("git+https://github.com/Try/OpenGothic#commit=46ed4ed4fd8b5b11c4811ce37c277394dd4519f4" #tag=opengothic-v1.0.3010
        "git+https://github.com/Try/Tempest.git"
        "git+https://github.com/schellingb/TinySoundFont.git#commit=92a8f0e9fe3c98358be7d8564db21fc4b1142d04"
        "git+https://github.com/GothicKit/ZenKit.git"
        "git+https://github.com/bulletphysics/bullet3.git"
        "git+https://github.com/GothicKit/dmusic.git"
        "git+https://github.com/doctest/doctest.git"
        "git+https://github.com/g-truc/glm.git"
        "git+https://github.com/lmichaelis/phoenix-libsquish.git"
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
options=('!emptydirs' 'lto')

prepare() {
  cd "${srcdir}/OpenGothic"
  git submodule init
  git config submodule.lib/Tempest.url "$srcdir/Tempest"
  git config submodule.lib/TinySoundFont.url "$srcdir/TinySoundFont"
  git config submodule.lib/ZenKit.url "$srcdir/ZenKit"
  git config submodule.lib/bullet3.url "$srcdir/bullet3"
  git config submodule.lib/dmusic.url "$srcdir/dmusic"
  git -c protocol.file.allow=always submodule update
  
  cd "${srcdir}/OpenGothic/lib/ZenKit"
  git submodule init
  git config submodule.vendor/doctest.url "$srcdir/doctest"
  git config submodule.vendor/glm.url "$srcdir/glm"
  git config submodule.vendor/libsquish.url "$srcdir/phoenix-libsquish"


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

