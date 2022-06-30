# Maintainer:  Christopher Reimer <mail at c-reimer dot de>

pkgname=opengothic
pkgver=0.59
pkgrel=1
pkgdesc="Open source remake of Gothic 2: Night of the raven"
arch=('x86_64')
url='https://github.com/Try/OpenGothic'
license=('MIT')
depends=('alsa-lib' 'gcc-libs' 'libx11' 'vulkan-icd-loader')
makedepends=('cmake' 'git' 'glslang' 'libglvnd' 'vulkan-headers')
conflicts=('bullet')
source=("git+https://github.com/Try/OpenGothic#commit=2de4fd8cf49f4f4626ae715d257be7594b0b79b5" #tag=v0.59
        "git+https://github.com/Try/Tempest.git#commit=09b49484861b63f2e7676fc2eb3413b7bf12a3b8"
        "git+https://github.com/schellingb/TinySoundFont.git#commit=d4ffcdc8a34d3f61f22e4b283b4c100f5adf4b82"
        "git+https://github.com/Try/ZenLib.git#commit=0867083b2f882373f81805ba096bcf07c63e42af"
        "git+https://github.com/bulletphysics/bullet3.git#commit=ebe1916b90acae8b13cd8c6b637d8327cdc64e94"
)
sha512sums=('SKIP'
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

