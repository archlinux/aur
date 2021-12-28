# Maintainer: Elijah Gregg <lovetocode999@tilde.team>
# Contributor: Lenny McLennington <lennymclennington@protonmail.com>
# Contributor: Miko <mikoxyzzz@gmail.com>
# Contributor: Cheru Berhanu <aur attt cheru doot dev>

_pkgname=polymc
pkgname=${_pkgname}-git
pkgver=1.0.0.r0.g4435665d
pkgrel=1
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('i686' 'x86_64')
url="https://github.com/PolyMC/PolyMC"
license=('GPL3')
depends=('java-runtime' 'libgl' 'qt5-base' 'zlib')
provides=('polymc')
conflicts=('polymc')
makedepends=('cmake' 'git' 'java-environment')
optdepends=('glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions'
)
source=("git+https://github.com/PolyMC/PolyMC"
        "git+https://github.com/MultiMC/libnbtplusplus"
        "git+https://github.com/PolyMC/quazip"
        application.desktop
)

sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            '15c3157b2e56ec5af6e8c079bbf4da6ac6e5552659906beff3dbddc79463e667')

pkgver() {
  cd PolyMC
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/PolyMC"
  git submodule init
  git config submodule.libnbtplusplus.url "${srcdir}/libnbtplusplus"
  git config submodule.quazip.url "${srcdir}/quazip"
  git submodule update
}

build() {
  cd "${srcdir}/PolyMC"
  mkdir -p build

  cd build
  cmake -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DLauncher_LAYOUT=lin-system \
    -DLauncher_APP_BINARY_NAME="${_pkgname}" \
    -DLauncher_SHARE_DEST_DIR="share/${_pkgname}" \
    ..
  make
}

check() {
  cd "${srcdir}/PolyMC/build"
  make test
}

package() {
  cd "${srcdir}/PolyMC/build"
  make install DESTDIR="${pkgdir}"
  install -D "${srcdir}/PolyMC/launcher/resources/multimc/scalable/launcher.svg" "${pkgdir}/usr/share/pixmaps/${_pkgname}.svg"
  install -D "${srcdir}/application.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -D "${srcdir}/PolyMC/build/libLauncher_quazip.so" "${pkgdir}/usr/lib/libLauncher_quazip.so"
  install -D "${srcdir}/PolyMC/build/libLauncher_nbt++.so" "${pkgdir}/usr/lib/libLauncher_nbt++.so"
}

