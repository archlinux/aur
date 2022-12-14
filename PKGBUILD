# Maintainer:  Florian Lindner <florian.lindner@xgm.de>
# Contributor: Jon Gjengset <jon@thesquareplanet.com>

pkgname=hotspot-git
pkgver=v1.4.0.r41.gff86112
pkgrel=1
pkgdesc="The Linux perf GUI for performance analysis"
arch=('any')
url="https://github.com/KDAB/hotspot"
license=('GPL2')
depends=('elfutils' 'kcoreaddons' 'kddockwidgets' 'ki18n' 'kconfig' 'kio' 'kitemviews'  'kitemmodels' 'kconfigwidgets' 'kparts' 'libelf' 'qt5-base>=5.6.0' 'solid' 'threadweaver')
makedepends=('git' 'cmake>=3.1.0' 'extra-cmake-modules' 'desktop-file-utils')
optdepends=('rustc-demangle>=0.1.18-2: rustc symbols demangling') 
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${pkgname%-git}"
    git submodule update --init --recursive
}

build() {
    cd "${pkgname%-git}"
    cmake . -DCMAKE_INSTALL_PREFIX=/usr \
            -DBUILD_TESTING=off
    cmake --build .
}

package() {
    cd "${pkgname%-git}"
    DESTDIR="${pkgdir}/" cmake --install .
    desktop-file-install com.kdab.hotspot.desktop --dir="${pkgdir}/usr/share/applications/"
}
