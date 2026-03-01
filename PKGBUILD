# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Florian Lindner <florian.lindner@xgm.de>

pkgname=hotspot
pkgver=1.6.0
pkgrel=2
epoch=1
pkgdesc="The Linux perf GUI for performance analysis"
arch=('x86_64')
url="https://github.com/KDAB/hotspot"
license=('GPL-2.0-only')
depends=(
    'elfutils'
    'kconfig'
    'kconfigwidgets'
    'kcoreaddons'
    'kddockwidgets'
    'kgraphviewer'
    'ki18n'
    'kio'
    'kitemmodels'
    'kitemviews'
    'kparts'
    'libelf'
    'perf'
    'qcustomplot' # need the header file for qcustomplot-qt6
    'qcustomplot-qt6'
    'qt6-base>=6.4'
    'solid'
    'syntax-highlighting'
    'threadweaver'
    'vulkan-headers'
)
makedepends=('cmake>=3.16.0' 'desktop-file-utils' 'extra-cmake-modules' 'git')
optdepends=('binutils: Support for annotating individual instructions'
            'rustc-demangle>=0.1.18-2: Demangling of Rust symbols')
source=("git+$url#commit=b0b3c64725abacb1a1966afe5fabe18fd0f84a1b"
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
    cmake -DBUILD_TESTING=off -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr -DQT6_BUILD=on .
    cmake --build .
}

package() {
    cd $pkgname
    DESTDIR="$pkgdir" cmake --install .
    desktop-file-install com.kdab.hotspot.desktop --dir="$pkgdir/usr/share/applications/"
}
