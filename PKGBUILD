# Maintainer:  Christopher Reimer <mail at c-reimer dot de>

pkgname=opengothic
pkgver=0.48
pkgrel=1
pkgdesc="Open source remake of Gothic 2: Night of the raven"
arch=('x86_64')
url='https://github.com/Try/OpenGothic'
license=('MIT')
depends=('alsa-lib' 'gcc-libs' 'libx11' 'vulkan-icd-loader')
makedepends=('cmake' 'git' 'glslang' 'libglvnd' 'vulkan-headers')
conflicts=('bullet')
source=("git+https://github.com/Try/OpenGothic#commit=f4cf3eed8ede6a8a7a5af1cb5dab6d8c7331abf0" #tag=v0.48
        "git+https://github.com/Try/Tempest.git#commit=48dd692e16990a812703a209c7784ea602a3fd8f"
        "git+https://github.com/schellingb/TinySoundFont.git#commit=d4ffcdc8a34d3f61f22e4b283b4c100f5adf4b82"
        "git+https://github.com/Try/ZenLib.git#commit=a38ad95781565607dac8ccdd06412b60c9612521"
        "git+https://github.com/bulletphysics/bullet3.git#commit=e7e46154bb2f4be77ad79657bcdc2675305b69a4"
        "git+https://github.com/tito/libsquish.git#commit=f5e44a360fd8b456b1291a2eaba61871c64d6288"
        "cstddef.diff"
)
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'fa0fd1a168b9368dfb5be632353f958496add647a0a62d08f593d5c0eb9df9709728aac60fa3b85dbacd54487407f51260b8fa96d984a8ff3c79c9927c486272')
options=('!emptydirs')

prepare() {
  cd "${srcdir}/OpenGothic"
  git submodule init
  git config submodule.lib/Tempest.url "${srcdir}/Tempest"
  git config submodule.lib/TinySoundFont.url "${srcdir}/TinySoundFont"
  git config submodule.lib/ZenLib.url "${srcdir}/ZenLib"
  git config submodule.lib/bullet3.url "${srcdir}/bullet3"
  git submodule update
  
  patch -p1 -i "$srcdir/cstddef.diff"

  cd "${srcdir}/OpenGothic/lib/ZenLib"
  git submodule init
  git config submodule.lib/libsquish.url "${srcdir}/libsquish"
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

