# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Christopher Reimer <mail at c-reimer dot de>
pkgname=opengothic
pkgver=1.0.3756
_tag=0.92
pkgrel=1
pkgdesc="Open source re-implementation of Gothic 2: Night of the Raven."
arch=('x86_64')
url="https://github.com/Try/OpenGothic"
license=('MIT')
depends=(
  'alsa-lib'
  'libgcc'
  'libpipewire'
  'libpulse'
  'libstdc++'
  'libx11'
  'libxcursor'
  'libglvnd'
  'portaudio'
  'vulkan-icd-loader'
)
makedepends=(
  'cmake'
  'git'
  'glslang'
  'vulkan-headers'
)
source=("git+https://github.com/Try/OpenGothic#tag=v${_tag}"
        "git+https://github.com/Try/Tempest.git"
        "git+https://github.com/bulletphysics/bullet3.git"
        "git+https://github.com/schellingb/TinySoundFont.git"
        "git+https://github.com/GothicKit/ZenKit.git"
        "git+https://github.com/GothicKit/dmusic.git"
        "git+https://github.com/lmichaelis/phoenix-libsquish.git"
)
sha256sums=('017a6371973811bee13d17cbd71be81012a6c065c6d355593a2db8cd7d5886a9'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

prepare() {
  cd OpenGothic
  git submodule init
  git config submodule.lib/Tempest.url "$srcdir/Tempest"
  git config submodule.lib/bullet3.url "$srcdir/bullet3"
  git config submodule.lib/TinySoundFont.url "$srcdir/TinySoundFont"
  git config submodule.lib/ZenKit.url "$srcdir/ZenKit"
  git config submodule.lib/dmusic.url "$srcdir/dmusic"
  git -c protocol.file.allow=always submodule update

  cd lib/ZenKit
  git submodule init vendor/libsquish
  git config submodule.vendor/libsquish.url "$srcdir/phoenix-libsquish"
  git -c protocol.file.allow=always submodule update
}

build() {
  local cmake_options=(
    -B build
    -S OpenGothic
    -W no-dev
    -D CMAKE_BUILD_TYPE='RelWithDebInfo'
    -D CMAKE_INSTALL_PREFIX='/usr'
    -D CMAKE_POLICY_VERSION_MINIMUM='3.5'
    -D BUILD_SHARED_LIBS='OFF'
    -D TEMPEST_BUILD_SHARED='OFF'
  )
  cmake "${cmake_options[@]}"
  cmake --build build
}

package() {
  install -Dm755 "build/$pkgname/Gothic2Notr" -t "$pkgdir/usr/bin/"
  install -Dm644 OpenGothic/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
