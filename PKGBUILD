# Maintainer: Evan Goode <mail@evangoo.de>
# Contributor: Giovanni Harting <anonfunc@archlinux.org>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: txtsd <aur.archlinux@ihavea.quest>
# Contributor: seth <getchoo at tuta dot io>
# Contributor: fn2006 <usernamefn2006alreadyused@protonmail.com>
# Contributor: Lenny McLennington <lennymclennington@protonmail.com>
# Contributor: Elijah Gregg <lovetocode999@tilde.team>
# Contributor: Miko <mikoxyzzz@gmail.com>
# Contributor: Cheru Berhanu <aur attt cheru doot dev>
# Contributor: dada513 <dada513@protonmail.com>

pkgname=fjordlauncher
pkgver=11.0.2.0
pkgrel=1
pkgdesc="Prism Launcher fork with support for alternative auth servers"
arch=(x86_64)
url='https://github.com/unmojang/FjordLauncher'
license=('GPL-3.0-only AND LGPL-3.0-or-later AND LGPL-2.0-or-later AND Apache-2.0 AND MIT AND LicenseRef-Batch AND OFL-1.1')
depends=(
  glibc
  mesa-utils
  libarchive
  libgl
  pciutils
  qrencode
  qt6-base
  qt6-imageformats
  qt6-networkauth
  qt6-svg
  zlib
  hicolor-icon-theme
  tomlplusplus
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
  gamemode
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
source=("https://github.com/unmojang/FjordLauncher/releases/download/$pkgver/FjordLauncher-$pkgver.tar.gz"
  {lionshead,batch,mdi}.license)
b2sums=('282330968402009682a488870eb29a23f7f82235797f0b6ae3247ba36abb1734975031c38fd24cf713d86e451b9eb0841a4e77ec1cab63eed4bfb73ff9a8baec'
  'be4289832af95b1cd6e721dc16b84a034533de9718d9b43a49bd08dd6fe4e28eaa15228bfb311867b18fddbda1c9fc4c91f04c6d5c1a3bcc39aaa5161425e3ba'
  '356248a6b86f06d260e0920b49d34034f79f9bc504c7fdc1849d929d2ff9b169e693a8269a2c0b34656b3802970d9b8be41a92b35177eaa3c4ccc89a702f5c9d'
  'b35c447cd9223e096a2bb75e0741a7d0a3a1606af54c957e4f276f4e6861a9b3f06ae1d646137e8d2f24ba2238c9967c76eff8cc631a68d7e48e376056982cc6')

build() {
  export PATH="/usr/lib/jvm/java-17-openjdk/bin/:$PATH"

  local cmake_options=(
    -B build
    -S "FjordLauncher-$pkgver"
    -G Ninja
    -D Launcher_BUILD_PLATFORM=archlinux
    -D Launcher_ENABLE_JAVA_DOWNLOADER=ON
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

# vim:set ts=2 sw=2 et:
