# Maintainer: Eren Simsek <18117384-caferen@users.noreply.gitlab.com>
# Maintainer: Guy Boldon <gb@guyboldon.com>

pkgbase=coolercontrol
pkgname=(coolercontrol coolercontrold)
_app_id="org.$pkgbase.CoolerControl"
pkgver=5.0.0
pkgrel=1
arch=("x86_64")
url="https://gitlab.com/coolercontrol/coolercontrol"
license=("GPL-3.0-or-later")
depends=(
    "gcc-libs"
    "glibc"
)
makedepends=(
    "cmake"
    "bubblewrap"
    "rust"
    "cargo"
    "libdrm"
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
    "https://gitlab.com/coolercontrol/coolercontrol/-/releases/$pkgver/downloads/packages/coolercontrold-vendor-$pkgver.tar.gz"
)
sha256sums=(
  'ebdc2e5aa4d4e380d71d10c3e3d22de3f93f3b49ef78255f3183a1d734801ffe'
  'daf5fd9272531bfc15aa00b1aaccd6875573d7b71234f9361257593744ddde82'
)

build() {
    # desktop application
    cd "${srcdir}/$pkgbase-$pkgver/coolercontrol"
    cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build

    # service daemon
    cd "${srcdir}/$pkgbase-$pkgver/coolercontrold"
    cargo build --release --frozen
}

check() {
    cd "${srcdir}/$pkgbase-$pkgver"
    desktop-file-validate "packaging/metadata/$_app_id.desktop"
    appstream-util validate-relax --nonet "packaging/metadata/$_app_id.metainfo.xml"

    cd "${srcdir}/$pkgbase-$pkgver/coolercontrold/target/release"
    ./coolercontrold --version
}

package_coolercontrol() {
    pkgdesc="A program to monitor and control your cooling devices. This package contains the desktop application. (official package)"
    depends=(
        "qt6-webengine"
        "hicolor-icon-theme"
        "coolercontrold=$pkgver-$pkgrel"
    )

    cd "${srcdir}/$pkgbase-$pkgver/coolercontrol"
    DESTDIR="$pkgdir" cmake --install build

    cd "${srcdir}/$pkgbase-$pkgver"

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

package_coolercontrold() {
    pkgdesc="A program to monitor and control your cooling devices. This package contains the service daemon. (official package)"
    depends=(
        "libdrm"
    )
    optdepends=(
        "liquidctl: liquidctl driver support"
        "lm_sensors: kernel hwmon driver support"
    )

    cd "${srcdir}/$pkgbase-$pkgver/coolercontrold"
    install -Dm755 "target/release/coolercontrold" -t "$pkgdir/usr/bin"

    cd "${srcdir}/$pkgbase-$pkgver"
    install -Dm644 "packaging/systemd/coolercontrold.service" -t "$pkgdir/usr/lib/systemd/system/"
    install -Dm644 README.md -t "$pkgdir/usr/share/doc/coolercontrold"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/coolercontrold"
}
