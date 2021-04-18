# Maintainer:  Christopher Reimer <mail at c-reimer dot de>

pkgname=opengothic
pkgver=0.36
pkgrel=1
pkgdesc="Open source remake of Gothic 2: Night of the raven"
arch=('x86_64')
url='https://github.com/Try/OpenGothic'
license=('MIT')
depends=('alsa-lib' 'gcc-libs' 'libx11' 'vulkan-icd-loader')
makedepends=('cmake' 'git' 'glslang' 'libglvnd' 'vulkan-headers')
conflicts=('bullet')
source=("git+https://github.com/Try/OpenGothic#commit=f1f450d1db11d718104c2cc921e5361f393c6242" #tag=v0.36
        "git+https://github.com/Try/Tempest.git#commit=6507d44eebc1b2b0cdee99e155e2c447102d5eed"
        "git+https://github.com/schellingb/TinySoundFont.git#commit=d4ffcdc8a34d3f61f22e4b283b4c100f5adf4b82"
        "git+https://github.com/Try/ZenLib.git#commit=60f536273d58412caaa393d3325945c81111724a"
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

