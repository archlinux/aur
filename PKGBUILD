# SPDX-License-Identifier: GPL-3.0-or-later
# SPDX-FileCopyrightText: 2026 Krema Contributors

pkgname=krema
pkgver=0.13.0
pkgrel=1
pkgdesc='A lightweight dock for KDE Plasma 6 — spiritual successor to Latte Dock'
arch=('x86_64' 'aarch64')
url='https://krema.bhyoo.com/'
license=('GPL-3.0-or-later' 'MIT-CMU')
depends=(
    'qt6-declarative>=6.8'
    'qt6-wayland'
    'qt6-quick3d>=6.8'
    'kwindowsystem>=6.0'
    'kconfig>=6.0'
    'kcoreaddons>=6.0'
    'kdbusaddons>=6.0'
    'ki18n>=6.0'
    'kglobalaccel>=6.0'
    'kcolorscheme>=6.0'
    'kiconthemes>=6.0'
    'kcrash>=6.0'
    'kxmlgui>=6.0'
    'kservice>=6.0'
    'kio>=6.0'
    'kjobwidgets>=6.0'
    'kirigami>=6.0'
    'kirigami-addons'
    'layer-shell-qt>=6.0'
    'plasma-workspace'
    'kpipewire'
    'pipewire'
    'wayland>=1.22'
)
makedepends=(
    'cmake>=3.22'
    'ninja'
    'extra-cmake-modules>=6.0'
    'gcc>=14'
    'qt6-shadertools'
    'qt6-base'
)
source=("$pkgname-$pkgver.tar.gz::https://github.com/isac322/krema/releases/download/v0.13.0/krema-0.13.0.tar.gz")
sha256sums=('213ddf7198d430cddc4ac110bcb8d5f0413b60f0414e3cf39492dd25a57af07d')

build() {
    cmake -S "$pkgname-$pkgver" -B build \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTING=OFF
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    # Qt private/QPA APIs have no ABI guarantee across minor releases despite
    # unchanged SONAMEs; rebuild krema after Qt upgrades.
    local qt_version qt_epoch
    local qt_major qt_minor
    qt_version=$(pacman -Q qt6-base | awk '{print $2}')
    qt_epoch=
    case $qt_version in
        *:*) qt_epoch=${qt_version%%:*}:; qt_version=${qt_version#*:};;
    esac
    qt_version=${qt_version%%-*}
    qt_major=${qt_version%%.*}
    qt_minor=${qt_version#*.}
    qt_minor=${qt_minor%%.*}
    depends+=(
        "qt6-base>=${qt_epoch}${qt_major}.${qt_minor}"
        "qt6-base<${qt_epoch}${qt_major}.$((qt_minor + 1))"
    )
    # MIT-CMU is not one of Arch's common licenses, so its text must ship.
    install -Dm644 "$pkgname-$pkgver/LICENSES/MIT-CMU.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/MIT-CMU.txt"
}
