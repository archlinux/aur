# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Florian Lindner <florian.lindner@xgm.de>

pkgname=hotspot
pkgver=1.5.1
pkgrel=4
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
    'kddockwidgets-qt6'
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
makedepends=('cmake>=3.16.0' 'desktop-file-utils' 'extra-cmake-modules')
optdepends=('binutils: Support for annotating individual instructions'
            'rustc-demangle>=0.1.18-2: Demangling of Rust symbols')
source=("$url/releases/download/v$pkgver/$pkgname-v$pkgver.tar.gz"
        "$url/releases/download/v$pkgver/$pkgname-perfparser-v$pkgver.tar.gz"
        "$url/releases/download/v$pkgver/$pkgname-PrefixTickLabels-v$pkgver.tar.gz")
b2sums=('1751e115213af409210d7fd35a4113d1d528a9bb04be12fa7b05ce56523c447e7c12b21651a863e00734f2fed65403000d889e3005d083e37dc71a025e61a0cb'
        '6967ce1cfec531d8cb19656fcd71a0891e3ba15f93ea15eaf4ff93983415773a27bf7c47c551f9b45e85a155b3ac3002498083c7088816d1286fcdba3ad675d3'
        '915ad463c5f088b8945e0038bd61beff77ca8283b4b31a4ee1e7042619f6e7adc9471c3e601e7bdb6c9e4a85cdb1b87ebb085a523a2f3756367504e8ae6ef3dc')

prepare() {
    mv perfparser/*       $pkgname/3rdparty/perfparser
    mv PrefixTickLabels/* $pkgname/3rdparty/PrefixTickLabels
    
    cd $pkgname
    # fix build with Qt 6.9 https://github.com/KDAB/hotspot/commit/ec54b1efe74ca4b6cc1e432046de6269029c02ed
    sed -i 's/painter->setBrush({});/painter->setBrush(QBrush());/g' src/models/timelinedelegate.cpp
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
