# Maintainer: Miko <mikoxyzzz@gmail.com>
# Contributor: Cheru Berhanu <aur attt cheru doot dev>

pkgname=devlauncher-git
pkgver=0.6.13.r82.gc2c56a2f
pkgrel=2
pkgdesc="Minecraft launcher with ability to manage multiple instances."
arch=('i686' 'x86_64')
url="https://github.com/MultiMC/Launcher"
license=('Apache')
depends=('java-runtime' 'libgl' 'qt5-base' 'zlib')
provides=('multimc')
makedepends=('cmake' 'git' 'java-environment')
optdepends=('glfw: to use system GLFW libraries'
            'openal: to use system OpenAL libraries'
            'visualvm: Profiling support'
            'xorg-xrandr: for older minecraft versions'
)
source=("git+https://github.com/MultiMC/Launcher"
        "git+https://github.com/MultiMC/libnbtplusplus"
        "git+https://github.com/MultiMC/quazip"
        0001-Readd-lin-system-and-LAUNCHER_LINUX_DATADIR.patch
        devlauncher.desktop
        modern-java.patch
)

sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'cb003424404d83e3ee6e8c0c4d6be1562325185efac3f249f63542c05eda71144fd865e065c5bd00b981288df0ced12bb4ac6311ddd0cf9cc6dd7d611f94b107'
            '6ab7bfce06f7ed785186f5c27c91244df9d1d2e6dcd0d43720273e9673785c89dc7bd80ccd8650856614a0c3866fdd3763b0bba00c0bcf7212edaaada88a0440'
            '0005a23628afbecb40591e9ef0fd2fc63367ca1be71a874de6791fb19ae112b5907e19975b40b770122e9e34cc3297b14d2a9d72c42f3fbfac221e41cbc67890')

pkgver() {
  cd Launcher
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/Launcher"
  patch -p1 < "${srcdir}/0001-Readd-lin-system-and-LAUNCHER_LINUX_DATADIR.patch"
  patch -p1 < "${srcdir}/modern-java.patch"

  git submodule init
  git config submodule.libnbtplusplus.url "${srcdir}/libnbtplusplus"
  git config submodule.quazip.url "${srcdir}/quazip"
  git submodule update
}

build() {
  cd "${srcdir}/Launcher"
  mkdir -p build

  cd build
  cmake -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DLauncher_LAYOUT=lin-system \
    ..
  make
}

check() {
  cd "${srcdir}/Launcher/build"
  make test
}

package() {
  cd "${srcdir}/Launcher/build"
  make install DESTDIR="${pkgdir}"
  install -D "${srcdir}/Launcher/launcher/resources/multimc/scalable/launcher.svg" "${pkgdir}/usr/share/pixmaps/devlauncher.svg"
  install -D "${srcdir}/devlauncher.desktop" "${pkgdir}/usr/share/applications/devlauncher.desktop"
  install -D "${srcdir}/Launcher/build/libLauncher_quazip.so" "${pkgdir}/usr/lib/libLauncher_quazip.so"
  install -D "${srcdir}/Launcher/build/libLauncher_nbt++.so" "${pkgdir}/usr/lib/libLauncher_nbt++.so"
}

