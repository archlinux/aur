# Maintainer:  Christopher Reimer <mail at c-reimer dot de>

pkgname=opengothic
pkgver=0.35
pkgrel=1
pkgdesc="Open source remake of Gothic 2: Night of the raven"
arch=('x86_64')
url='https://github.com/Try/OpenGothic'
license=('MIT')
depends=('alsa-lib' 'gcc-libs' 'libx11' 'vulkan-icd-loader')
makedepends=('cmake' 'git' 'glslang' 'libglvnd' 'vulkan-headers')
conflicts=('bullet')
source=("git+https://github.com/Try/OpenGothic#commit=a144bbd3917fa51d067586fcde5a27daa8fe7bad" #tag=v0.35
        "git+https://github.com/Try/Tempest.git#commit=af9f1b4c6decdd8511d1bb302ceadc2540892580"
        "git+https://github.com/schellingb/TinySoundFont.git#commit=d4ffcdc8a34d3f61f22e4b283b4c100f5adf4b82"
        "git+https://github.com/Try/ZenLib.git#commit=133dab93cc8dd7c9f069fca37b2dae1409c34f30"
        "git+https://github.com/bulletphysics/bullet3.git#commit=e7e46154bb2f4be77ad79657bcdc2675305b69a4"
        "git+https://github.com/tito/libsquish.git#commit=f5e44a360fd8b456b1291a2eaba61871c64d6288"
        "git+https://github.com/physfs-mirror/PhysicsFS.git#commit=a25c37f5f1552e30094234bac46a21e3e57cf9f7"
)
sha512sums=('SKIP'
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
  git config submodule.lib/Tempest.url "${srcdir}/Tempest"
  git config submodule.lib/TinySoundFont.url "${srcdir}/TinySoundFont"
  git config submodule.lib/ZenLib.url "${srcdir}/ZenLib"
  git config submodule.lib/bullet3.url "${srcdir}/bullet3"
  git submodule update

  cd "${srcdir}/OpenGothic/lib/ZenLib"
  git submodule init
  git config submodule.lib/libsquish.url "${srcdir}/libsquish"
  git config submodule.lib/physfs.url "${srcdir}/PhysicsFS"
  git submodule update
}

build() {
  cd "OpenGothic"
  cmake -B build -DBUILD_SHARED_LIBS=ON -DCMAKE_BUILD_TYPE:STRING=RelWithDebInfo -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  cd "OpenGothic"
  DESTDIR="${pkgdir}" make -C build install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

