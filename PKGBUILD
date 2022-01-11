# Maintainer: Yellow <yellow@example.com>
# Contributor: Elijah Gregg <lovetocode999@tilde.team>
# Contributor: Lenny McLennington <lennymclennington@protonmail.com>
# Contributor: Miko <mikoxyzzz@gmail.com>
# Contributor: Cheru Berhanu <aur attt cheru doot dev>

pkgname=polymc
pkgver=1.0.5
pkgrel=1
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('i686' 'x86_64')
url="https://github.com/PolyMC/PolyMC"
license=('GPL3')
depends=('java-runtime' 'libgl' 'qt5-base' 'zlib')
provides=('polymc')
conflicts=('polymc' 'multimc')
makedepends=('cmake' 'git' 'java-environment')
optdepends=('glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions'
)
source=("PolyMC::git+https://github.com/PolyMC/PolyMC#commit=1cc7a193c27855bd30a90cb24ad678064a26022d" # 1.0.5
        "git+https://github.com/MultiMC/libnbtplusplus#commit=dc72a20b7efd304d12af2025223fad07b4b78464"
        "git+https://github.com/PolyMC/quazip#commit=c9ef32de19bceb58d236f5c22382698deaec69fd")

sha256sums=('SKIP'
            'SKIP'
            'SKIP')

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
    -DLauncher_APP_BINARY_NAME="${pkgname}" \
    -DLauncher_SHARE_DEST_DIR="share/${pkgname}" \
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
  install -D "${srcdir}/PolyMC/build/libLauncher_quazip.so" "${pkgdir}/usr/lib/libLauncher_quazip.so"
  install -D "${srcdir}/PolyMC/build/libLauncher_nbt++.so" "${pkgdir}/usr/lib/libLauncher_nbt++.so"
}

