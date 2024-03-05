# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Florian Lindner <florian.lindner@xgm.de>

pkgname=hotspot
pkgver=20240304
pkgrel=2
pkgdesc="The Linux perf GUI for performance analysis"
arch=('x86_64')
url="https://github.com/KDAB/hotspot"
license=('GPL-2.0-only')
depends=(
    'elfutils'
    'kconfig5'
    'kconfigwidgets5'
    'kcoreaddons5'
    'kddockwidgets'
    'ki18n5'
    'kio5'
    'kitemmodels5'
    'kitemviews5'
    'kparts5'
    'libelf'
    'perf'
    'qt5-base>=5.15.0'
    'rustc-demangle>=0.1.18-2'
    'solid5'
    'threadweaver5'
)
makedepends=('cmake>=3.16.0' 'desktop-file-utils' 'extra-cmake-modules' 'git')
source=("git+$url#commit=6f9f958c4ff68b3c94ccca0fa3c2d86c46c9185f"
        "git+https://github.com/KDAB/perfparser.git"
        "git+https://github.com/koenpoppe/PrefixTickLabels")
b2sums=('SKIP' 'SKIP' 'SKIP')

prepare() {
    cd $pkgname
    git submodule init
    git config submodule.3rdparty/perfparser.url       "$srcdir/perfparser"
    git config submodule.3rdparty/PrefixTickLabels.url "$srcdir/PrefixTickLabels"
    git -c protocol.file.allow=always submodule update
}

build() {
    cd $pkgname
    cmake -DCMAKE_INSTALL_PREFIX=/usr -DBUILD_TESTING=off .
    cmake --build .
}

package() {
    cd $pkgname
    DESTDIR="$pkgdir" cmake --install .
    desktop-file-install com.kdab.hotspot.desktop --dir="$pkgdir/usr/share/applications/"
}
