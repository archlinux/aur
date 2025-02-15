# Maintainer: Lenny McLennington <lennymclennington@protonmail.com>
# Contributor: Kaydax <contact+aur@kaydax.xyz>
# Contributor: Miko <mikoxyzzz@gmail.com>
# Contributor: Cheru Berhanu <aur attt cheru doot dev>

_pkgname=multimc
pkgname=${_pkgname}-git
pkgver=0.6.16.r222.g2eb4cc96
pkgrel=1
pkgdesc="Minecraft launcher with ability to manage multiple instances. Includes old name/icons and ability to sign in with a Microsoft account."
arch=('i686' 'x86_64')
url="https://github.com/MultiMC/Launcher"
license=('Apache')
depends=('java-runtime' 'libgl' 'qt5-base' 'zlib')
provides=('multimc')
conflicts=('multimc')
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
        application.desktop
        modern-java.patch
        fix-jars.patch
        mmc-brand.patch
)

sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            'cb003424404d83e3ee6e8c0c4d6be1562325185efac3f249f63542c05eda71144fd865e065c5bd00b981288df0ced12bb4ac6311ddd0cf9cc6dd7d611f94b107'
            'a7c4654dd5ee260c25e0eab2dba0d929f09bc38b9af1505408a55058e73eaf35986b4a0e6de7e1893ebf860c472df984011340b3989f996a9d170cbc37dfd691'
            'fed9f3a12441c48b163ae76b2b0e5be2f609e72430f0ae071856d62ff0e0572f429dc116714cbfbf1964191ec3439060fdb07a51a9e86b75be4fea24a2f28ef2'
            'a200f869b66010e5e9838c863459d25c42b5bb43ea035968363cd67cfd5d26c93c02b9c80de9f96dae4693f4719c81a07c593f31ea873f67ff60456c29983a9e'
            '34a45c1d1247e7c9c597480f15d1a6091a858e17d070b778897cd41c9f3360af824f6050979dcd0bec2a61cf078845755805d27464473109978112d3d00c0661')

pkgver() {
  cd Launcher
  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/Launcher"
  patch -p1 < "${srcdir}/0001-Readd-lin-system-and-LAUNCHER_LINUX_DATADIR.patch"
  patch -p1 < "${srcdir}/modern-java.patch"
  patch -p1 < "${srcdir}/fix-jars.patch"
  patch -p1 < "${srcdir}/mmc-brand.patch"

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
    -DLauncher_APP_BINARY_NAME="${_pkgname}" \
    -DLauncher_SHARE_DEST_DIR="share/${_pkgname}" \
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
  install -D "${srcdir}/Launcher/launcher/resources/multimc/scalable/launcher.svg" "${pkgdir}/usr/share/pixmaps/${_pkgname}.svg"
  install -D "${srcdir}/application.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"
  install -D "${srcdir}/Launcher/build/libLauncher_quazip.so" "${pkgdir}/usr/lib/libLauncher_quazip.so"
  install -D "${srcdir}/Launcher/build/libLauncher_nbt++.so" "${pkgdir}/usr/lib/libLauncher_nbt++.so"
}

