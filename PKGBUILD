# Maintainer: FlekGeKei <FlekGeKei@outlook.com>

pkgname=elyprismlauncher
pkgver=8.2
pkgrel=1
pkgdesc="This fork of Prism Launcher replaces legacy Mojang accounts with Ely.by accounts. This is not endorsed by Prism Launcher or Ely.by."
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/Octol1ttle/ElyPrismLauncher"
license=('GPL3')
depends=('java-runtime=17' 'libgl' 'qt6-base' 'qt6-5compat' 'qt6-svg' 'qt6-imageformats' 'zlib' 'hicolor-icon-theme' 'quazip-qt6' 'tomlplusplus' 'cmark')
makedepends=('cmake' 'extra-cmake-modules' 'git' 'jdk17-openjdk' 'scdoc' 'ghc-filesystem' 'gamemode')
optdepends=('glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions'
            'java-runtime=8: for older minecraft versions')
conflicts=('prismlauncher')
provides=('prismlauncher')
if [[ ${pkgrel} > 1 ]]; then
  source=("https://github.com/Octol1ttle/ElyPrismLauncher/releases/download/${pkgver}-${pkgrel}/PrismLauncher-${pkgver}-${pkgrel}.tar.gz")
else
  source=("https://github.com/Octol1ttle/ElyPrismLauncher/releases/download/${pkgver}/PrismLauncher-${pkgver}.tar.gz")
fi
sha256sums=('0ef8d62791845635299d51f57075d40c3d6339d9c61b1e5a92752670b873e5b8')

build() {
  if [[ ${pkgrel} > 1 ]]; then
    cd "PrismLauncher-${pkgver}-${pkgrel}"
  else
    cd "PrismLauncher-${pkgver}"
  fi

  export PATH="/usr/lib/jvm/java-17-openjdk/bin:$PATH"

  cmake -DCMAKE_BUILD_TYPE= \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DLauncher_BUILD_PLATFORM="archlinux" \
    -DLauncher_QT_VERSION_MAJOR="6" \
    -Bbuild -S. \
    -DLauncher_DRM="OFF"
  cmake --build build
}

check() {
  if [[ ${pkgrel} > 1 ]]; then
    cd "PrismLauncher-${pkgver}-${pkgrel}"
  else
    cd "PrismLauncher-${pkgver}"
  fi
  ctest .
}

package() {
  if [[ ${pkgrel} > 1 ]]; then
    cd "PrismLauncher-${pkgver}-${pkgrel}"
  else
    cd "PrismLauncher-${pkgver}"
  fi
  DESTDIR="${pkgdir}" cmake --install .
}

