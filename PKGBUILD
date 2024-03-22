# Maintainer: Marco Rubin <marco.rubin@protonmail.com>
# Contributor: Florian Lindner <florian.lindner@xgm.de>

pkgname=hotspot
pkgver=20240312
_commit=61c5ad91765d5916d211742949878004d725ac51
pkgrel=1
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
source=("git+$url#commit=$_commit"
        "git+https://github.com/KDAB/perfparser.git"
        "git+https://github.com/koenpoppe/PrefixTickLabels")
b2sums=('338f32fea8ab56f11211ec161f30746546400ee4066ba2d6d44a6cb95aaba16bbb85a442439ab76eb5b9eb983e5963e4e8116234649667da8d491dbb878cab08'
        'SKIP'
        'SKIP')

pkgver() {
    cd $pkgname
    git log -n1 --pretty='format:%cd' --date=format:'%Y%m%d' $_commit
}

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
