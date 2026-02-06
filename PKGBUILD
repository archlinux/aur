# Maintainer: MiguVT <contacto@miguvt.com>
# Contributor: Giovanni Harting <anonfunc@archlinux.org>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: txtsd <aur.archlinux@ihavea.quest>
# Contributor: seth <getchoo at tuta dot io>
# Contributor: Lenny McLennington <lennymclennington@protonmail.com>
# Contributor: Elijah Gregg <lovetocode999@tilde.team>
# Contributor: Miko <mikoxyzzz@gmail.com>
# Contributor: Cheru Berhanu <aur attt cheru doot dev>
# Contributor: dada513 <dada513@protonmail.com>

pkgname=quartzlauncher
pkgver=10.0.4
pkgrel=1
pkgdesc="Minecraft launcher with ability to manage multiple instances and offline support, fork of prismlauncher"
arch=(x86_64)
url='https://github.com/MiguVerse/QuartzLauncher'
license=('GPL-3.0-only AND LGPL-3.0-or-later AND LGPL-2.0-or-later AND Apache-2.0 AND MIT AND LicenseRef-Batch AND OFL-1.1')
depends=(
  glibc
  mesa-utils
  gcc-libs
  java-runtime
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
)
makedepends=(cmake extra-cmake-modules git jdk17-openjdk ninja scdoc ghc-filesystem gamemode)
optdepends=('glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions'
            'orca: minecraft screen reader'
            'flite: minecraft voice narration')
source=("https://github.com/MiguVerse/QuartzLauncher/releases/download/$pkgver/PrismLauncher-$pkgver.tar.gz"
        {lionshead,batch,mdi}.license)
b2sums=('a1065aad6cbc240f116d365592bf2c65930a7c80713b8fb8977dd32a62ff2e316f037eb5432b3f22f77ee313d1e3b25884535cdb652766ca8c61592451591748'
        'be4289832af95b1cd6e721dc16b84a034533de9718d9b43a49bd08dd6fe4e28eaa15228bfb311867b18fddbda1c9fc4c91f04c6d5c1a3bcc39aaa5161425e3ba'
        '356248a6b86f06d260e0920b49d34034f79f9bc504c7fdc1849d929d2ff9b169e693a8269a2c0b34656b3802970d9b8be41a92b35177eaa3c4ccc89a702f5c9d'
        'b35c447cd9223e096a2bb75e0741a7d0a3a1606af54c957e4f276f4e6861a9b3f06ae1d646137e8d2f24ba2238c9967c76eff8cc631a68d7e48e376056982cc6')

build() {
  cd PrismLauncher-$pkgver

  export PATH="/usr/lib/jvm/java-17-openjdk/bin/:$PATH"

  cmake -DCMAKE_BUILD_TYPE= \
    -GNinja \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DLauncher_BUILD_PLATFORM="archlinux" \
    -DLauncher_QT_VERSION_MAJOR="6" \
    -DLauncher_ENABLE_JAVA_DOWNLOADER=ON \
    -DCMAKE_C_FLAGS="$CFLAGS -DNDEBUG" \
    -DCMAKE_CXX_FLAGS="$CXXFLAGS -DNDEBUG" \
    -Bbuild -S.
  cmake --build build
}

check() {
  cd PrismLauncher-$pkgver/build
  ctest .
}

package() {
  # licenses
  install -Dm644 lionshead.license -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm644 batch.license -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm644 mdi.license -t "$pkgdir"/usr/share/licenses/$pkgname/

  cd PrismLauncher-$pkgver/build
  DESTDIR="$pkgdir" cmake --install .
}

# vim:set ts=2 sw=2 et:
