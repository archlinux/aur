# Maintainer: Eren Simsek <18117384-caferen@users.noreply.gitlab.com>
# Maintainer: Guy Boldon <gb@guyboldon.com>

pkgname=coolercontrol
_app_id="org.$pkgname.CoolerControl"
pkgver=5.0.1
pkgrel=1
pkgdesc="A program to monitor and control your cooling devices. This package contains the desktop application. (official package)"
arch=("x86_64")
url="https://gitlab.com/coolercontrol/coolercontrol"
license=("GPL-3.0-or-later")
depends=(
    "qt6-webengine"
    "hicolor-icon-theme"
    "coolercontrold=$pkgver-$pkgrel"
)
makedepends=(
    "cmake"
    "qt6-webengine"
    "hicolor-icon-theme"
)
checkdepends=(
    "appstream-glib"
    "desktop-file-utils"
)
# lto is handled by cargo and can conflict with makepkg settings
options=(
    !lto
)
source=(
    "https://gitlab.com/coolercontrol/coolercontrol/-/releases/$pkgver/downloads/packages/coolercontrol-$pkgver.tar.gz"
)
sha256sums=(
  '9239f628b35cd122b6c637402caedf4b3937dd073d02ebabe17af67a73b815fb'
)

build() {
    cd "${srcdir}/$pkgname-$pkgver/coolercontrol"
    cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

check() {
    cd "${srcdir}/$pkgname-$pkgver"
    desktop-file-validate "packaging/metadata/$_app_id.desktop"
    appstream-util validate-relax --nonet "packaging/metadata/$_app_id.metainfo.xml"
}

package() {
    cd "${srcdir}/$pkgname-$pkgver/coolercontrol"
    DESTDIR="$pkgdir" cmake --install build

    cd "${srcdir}/$pkgname-$pkgver"

    install -Dm644 "packaging/metadata/$_app_id.desktop" -t "$pkgdir/usr/share/applications/"
    install -Dm644 "packaging/metadata/$_app_id.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
    install -Dm644 "packaging/metadata/$_app_id-alert.svg" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
    install -Dm644 "packaging/metadata/$_app_id-symbolic.svg" -t "$pkgdir/usr/share/icons/hicolor/symbolic/apps/"
    install -Dm644 "packaging/metadata/$_app_id-alert-symbolic.svg" -t "$pkgdir/usr/share/icons/hicolor/symbolic/apps/"
    install -Dm644 "packaging/metadata/$_app_id.png" -t "$pkgdir/usr/share/pixmaps/"
    install -Dm644 "packaging/metadata/$_app_id-alert.png" -t "$pkgdir/usr/share/pixmaps/"
    install -Dm644 "packaging/metadata/$_app_id.metainfo.xml" -t "$pkgdir/usr/share/metainfo/"

    install -Dm644 README.md -t "$pkgdir/usr/share/doc/coolercontrol"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/coolercontrol"
}