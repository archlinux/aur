# Maintainer: Natalie Vock <natalie dot vock at gmx dot de>

pkgbase=kcgroups-dmemcg
pkgname=('kcgroups-dmemcg' 'plasma-foreground-booster-dmemcg')
_tag=dmemcg-experimental
pkgver=0.1
pkgrel=1
pkgdesc="KDE library to manipulate cgroups (and boost foreground apps) - fork adding dmem cgroup support"
arch=('i686' 'x86_64')
url="https://github.com/pixelcluster/kcgroups"
license=('LGPL-2.1-or-later')
makedepends=('qt6-base' 'plasma-workspace' 'kwindowsystem' 'kconfig' 'kdbusaddons' 'cmake' 'extra-cmake-modules' 'git')
conflicts=('kcgroups-git')
source=("kcgroups::git+https://github.com/pixelcluster/kcgroups.git#tag=kcgroups-${_tag}"
	"plasma-foreground-booster::git+https://github.com/pixelcluster/kcgroups.git#tag=booster-${_tag}")
sha256sums=('fc231c52a9a0b135870b73ce51849a64ea84f80eb8f921c0c0d85af8e12fde28'
            'd48cf2a39ad087be415fced5b83b5f2ce497cb809fefae622e64e67c824d3286')

prepare() {
  mkdir -p kcgroups-build
  mkdir -p kcgroups-install
  mkdir -p plasma-foreground-booster-build
}

build () {
    cd kcgroups-build
    cmake ../kcgroups \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo \
    -DBUILD_WITH_QT6=ON
    make
    # HACK: plasma-foreground-booster needs an install of kcgroups to build.
    # Install it to a temporary directory inside the build area.
    make DESTDIR="../kcgroups-install" install

    cd ../plasma-foreground-booster-build
    CMAKE_PREFIX_PATH=../kcgroups-install/usr \
    cmake ../plasma-foreground-booster \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=RelWithDebInfo
    make
}

package_kcgroups-dmemcg() {
    depends=('qt6-base' 'kwindowsystem' 'kconfig' 'kdbusaddons')
    cd "kcgroups-build"
    make DESTDIR="${pkgdir}" install
}

package_plasma-foreground-booster-dmemcg() {
    cd "plasma-foreground-booster-build"
    make DESTDIR="${pkgdir}" install
}
