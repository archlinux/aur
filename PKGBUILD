# Maintainer:  Florian Lindner <florian.lindner@xgm.de>
# Contributor: Jon Gjengset <jon@thesquareplanet.com>

pkgname=hotspot-git
pkgver=v1.3.0.r28.g103fd82
pkgrel=1
pkgdesc="The Linux perf GUI for performance analysis"
arch=('any')
url="https://github.com/KDAB/hotspot"
license=('GPL2')
depends=('qt5-base>=5.6.0' 'libelf' 'elfutils' 'threadweaver' 'ki18n' 'kconfig' 'kio' 'kitemviews' 'kcoreaddons' 'kitemmodels' 'kconfigwidgets' 'solid')
makedepends=('git' 'cmake>=3.1.0' 'extra-cmake-modules' 'desktop-file-utils')
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
    cmake . -DCMAKE_INSTALL_PREFIX=/usr
    make
}

package() {
    cd "${pkgname%-git}"
    make DESTDIR="${pkgdir}/" install
    desktop-file-install hotspot.desktop --dir="${pkgdir}/usr/share/applications/"
}
