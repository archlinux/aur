# Maintainer: Evan Goode <mail@evangoo.de>
# Contributor: Sefa Eyeoglu <contact@scrumplex.net>
# Contributor: txtsd <aur.archlinux@ihavea.quest>
# Contributor: seth <getchoo at tuta dot io>
# Contributor: fn2006 <usernamefn2006alreadyused@protonmail.com>
# Contributor: Lenny McLennington <lennymclennington@protonmail.com>
# Contributor: Elijah Gregg <lovetocode999@tilde.team>
# Contributor: Miko <mikoxyzzz@gmail.com>
# Contributor: Cheru Berhanu <aur attt cheru doot dev>
# Contributor: dada513 <dada513@protonmail.com>

_pkgname=fjordlauncher
pkgname=${_pkgname}-git
pkgver=9.1.0.r0.g390af2df4
pkgrel=1
pkgdesc="Prism Launcher fork with support for alternative auth servers"
arch=('i686' 'x86_64' 'aarch64')
url='https://github.com/unmojang/FjordLauncher'
license=('GPL-3.0-only AND LGPL-3.0-or-later AND LGPL-2.0-or-later AND Apache-2.0 AND MIT AND LicenseRef-Batch AND OFL-1.1')
depends=(
  glibc
  gcc-libs
  java-runtime
  libgl
  qt6-base
  qt6-5compat
  qt6-svg
  qt6-imageformats
  qt6-networkauth
  quazip-qt6
  zlib
  hicolor-icon-theme
  tomlplusplus
  cmark
)
provides=('fjordlauncher')
conflicts=('fjordlauncher')
makedepends=(cmake extra-cmake-modules git jdk17-openjdk scdoc ghc-filesystem gamemode)
optdepends=('glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions'
            'flite: minecraft voice narration')
source=("git+https://github.com/unmojang/FjordLauncher.git"
        {lionshead,batch,mdi}.license)
b2sums=('SKIP'
        'be4289832af95b1cd6e721dc16b84a034533de9718d9b43a49bd08dd6fe4e28eaa15228bfb311867b18fddbda1c9fc4c91f04c6d5c1a3bcc39aaa5161425e3ba'
        '356248a6b86f06d260e0920b49d34034f79f9bc504c7fdc1849d929d2ff9b169e693a8269a2c0b34656b3802970d9b8be41a92b35177eaa3c4ccc89a702f5c9d'
        'b35c447cd9223e096a2bb75e0741a7d0a3a1606af54c957e4f276f4e6861a9b3f06ae1d646137e8d2f24ba2238c9967c76eff8cc631a68d7e48e376056982cc6')

pkgver() {
  cd FjordLauncher
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd FjordLauncher

  git submodule init
  git config submodule.libraries/cmark.active false
  git config submodule.libraries/extra-cmake-modules.active false
  git config submodule.libraries/filesystem.active false
  git config submodule.libraries/quazip.active false
  git config submodule.libraries/tomlplusplus.active false
  git config submodule.libraries/zlib.active false
  git submodule--helper update
}

build() {
  export PATH="/usr/lib/jvm/java-17-openjdk/bin/:$PATH"

  cmake -DCMAKE_BUILD_TYPE= \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DLauncher_BUILD_PLATFORM="archlinux" \
    -DLauncher_QT_VERSION_MAJOR="6" \
    -Bbuild -SFjordLauncher
  cmake --build build
}

check() {
  cd build
  ctest .
}

package() {
  # licenses
  install -Dm644 lionshead.license -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm644 batch.license -t "$pkgdir"/usr/share/licenses/$pkgname/
  install -Dm644 mdi.license -t "$pkgdir"/usr/share/licenses/$pkgname/

  cd build
  DESTDIR="$pkgdir" cmake --install .

  mv "${pkgdir}/usr/share/mime/packages/modrinth-mrpack-mime.xml" \
     "${pkgdir}/usr/share/mime/packages/fjordlauncher-modrinth-mrpack-mime.xml"
}

# vim:set ts=2 sw=2 et:
