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
pkgver=8.4.r1.gf4b787282
pkgrel=2
pkgdesc="Prism Launcher fork with support for alternative auth servers"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/unmojang/FjordLauncher"
license=('GPL-3.0-only AND LGPL-3.0-or-later AND LGPL-2.0-or-later AND Apache-2.0 AND MIT AND BSD-2-Clause AND BSD-3-Clause AND LicenseRef-Batch AND OFL-1.1')
depends=('java-runtime=17' 'libgl' 'qt6-base' 'qt6-5compat' 'qt6-svg' 'qt6-imageformats' 'qt6-networkauth' 'zlib' 'hicolor-icon-theme' 'quazip-qt6' 'cmark' 'tomlplusplus')
provides=('fjordlauncher')
conflicts=('fjordlauncher')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'jdk17-openjdk' 'scdoc' 'ghc-filesystem' 'gamemode')
optdepends=('glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions'
            'java-runtime=8: for older minecraft versions'
            'flite: minecraft voice narration'
)
options=(debug)
source=("git+https://github.com/unmojang/FjordLauncher.git")
sha256sums=('SKIP')

pkgver() {
  cd "FjordLauncher"
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "FjordLauncher"

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
  export PATH="/usr/lib/jvm/java-17-openjdk/bin:$PATH"

  cmake -DCMAKE_BUILD_TYPE= \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DLauncher_APP_BINARY_NAME="${_pkgname}" \
    -DLauncher_QT_VERSION_MAJOR="6" \
    -Bbuild -SFjordLauncher
  cmake --build build
}

check() {
  cd "build"
  ctest .
}

package() {
  cd "build"
  DESTDIR="${pkgdir}" cmake --install .
  mv "${pkgdir}/usr/share/mime/packages/modrinth-mrpack-mime.xml" \
     "${pkgdir}/usr/share/mime/packages/fjordlauncher-modrinth-mrpack-mime.xml"
}
