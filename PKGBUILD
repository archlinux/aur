# Maintainer: Mehmet Samet Duman <yongdohyun@projecttick.org>

pkgname=meshmc
pkgver=7.2.0
pkgrel=1
pkgsnapshot=v202604151700
pkgdesc="Minecraft launcher with ability to manage multiple instances"
arch=(x86_64)
url='https://projecttick.org/p/meshmc'
license=('GPL-3.0-or-later AND LGPL-3.0-or-later AND LGPL-2.0-or-later AND Apache-2.0 AND MIT AND LicenseRef-Batch AND OFL-1.1')
depends=(
  glibc
  mesa-utils
  libarchive
  libgl
  pciutils
  qt6-base
  qt6-imageformats
  qt6-networkauth
  qt6-svg
  zlib
  hicolor-icon-theme
  cmark
  libstdc++
  libgcc
)
makedepends=(
  cmake
  extra-cmake-modules
  git
  jdk17-openjdk
  ninja
  scdoc
  vulkan-headers
)
optdepends=(
  'glfw: to use system GLFW libraries'
  'openal: to use system OpenAL libraries'
  'visualvm: Profiling support'
  'xorg-xrandr: for older minecraft versions'
  'orca: minecraft screen reader'
  'flite: minecraft voice narration'
  'java-runtime: use system java versions'
)
source=("https://github.com/Project-Tick/Project-Tick/releases/download/$pkgsnapshot/meshmc-$pkgsnapshot.tar.gz"
  {lionshead,batch,mdi}.license)
b2sums=('db0938856d933c30803522835c7936d0d64a9e31d4cbf2ec81706ed1057b07d4853e092bfdc72beb601fed220c5abd0fdd62ad704a68232fcbf27812cc976925'
  'be4289832af95b1cd6e721dc16b84a034533de9718d9b43a49bd08dd6fe4e28eaa15228bfb311867b18fddbda1c9fc4c91f04c6d5c1a3bcc39aaa5161425e3ba'
  '356248a6b86f06d260e0920b49d34034f79f9bc504c7fdc1849d929d2ff9b169e693a8269a2c0b34656b3802970d9b8be41a92b35177eaa3c4ccc89a702f5c9d'
  'b35c447cd9223e096a2bb75e0741a7d0a3a1606af54c957e4f276f4e6861a9b3f06ae1d646137e8d2f24ba2238c9967c76eff8cc631a68d7e48e376056982cc6')

build() {
  export PATH="/usr/lib/jvm/java-17-openjdk/bin/:$PATH"

  local cmake_options=(
    -B build
    -S "meshmc-$pkgsnapshot"
    -G Ninja
    -D CMAKE_CXX_FLAGS="-Wall -pedantic -Wno-deprecated-declarations -fstack-protector-strong --param=ssp-buffer-size=4 -O3"
    -D MeshMC_BUILD_PLATFORM=archlinux
    -D MeshMC_DISABLE_JAVA_DOWNLOADER=OFF
    -W no-dev
    -D CMAKE_BUILD_TYPE=None
    -D CMAKE_INSTALL_PREFIX=/usr
  )

  cmake "${cmake_options[@]}"
  cmake --build build
}

check() {
  ctest --test-dir build
}

package() {
  # licenses
  install -Dm644 lionshead.license -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm644 batch.license -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm644 mdi.license -t "$pkgdir"/usr/share/licenses/$pkgname/

  DESTDIR="$pkgdir" cmake --install build
}

# mnv:set ts=2 sw=2 et:
# vim:set ts=2 sw=2 et:
