# SPDX-FileCopyrightText: 2026 Phoenix DNA contributors
# SPDX-License-Identifier: BSD-2-Clause
#
# Arch Linux PKGBUILD for Phoenix DNA. CachyOS uses the same package.
#
# Test from this directory:
#   ../../make-source-archive.sh --worktree ../../dist
#   SRCDEST="../../dist" makepkg -f -C --noconfirm
#
# Kept in step with agent/phoenix_dna/__init__.py by
# packaging/check-versions.sh.

pkgname=phoenix-dna
pkgver=0.1.0
pkgrel=1
pkgdesc='Voice-first AI agent for the KDE Plasma panel'
arch=('x86_64' 'aarch64')
url='https://github.com/phoenix-ren/phoenix-dna'
license=('BSD-2-Clause' 'ISC' 'MIT' 'FSFAP')
depends=(
    'libplasma' 'plasma-workspace' 'kwin'
    'kcoreaddons' 'kconfig' 'kconfigwidgets' 'ki18n'
    'kglobalaccel' 'kpackage' 'kwindowsystem'
    'kirigami' 'ksvg'
    'qt6-base' 'qt6-declarative' 'qt6-svg'
    'python' 'python-dbus' 'python-gobject' 'pipewire'
)
makedepends=(
    'cmake' 'extra-cmake-modules' 'boost'
    'kirigami' 'ksvg' 'libplasma' 'kwin'
)
optdepends=(
    'ffmpeg: read answers aloud'
    'kdialog: ask for the administrator password'
    'sudo: run commands as root on demand'
    'texlive-xetex: render LaTeX formulas to PDF'
)
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('e87933e5168b5e970acb13434a04d574b0a87afcb1c12a71752d08e224b883a8')

build() {
    cd "$pkgname-$pkgver"
    cmake -S . -B build \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTING=ON \
        -DPHOENIX_BUILD_DEVTOOLS=OFF \
        -DPHOENIX_UPDATE_CACHES=OFF \
        -DPHOENIX_AGENT_PYTHON=/usr/bin/python
    cmake --build build
}

check() {
    cd "$pkgname-$pkgver"
    QT_QPA_PLATFORM=offscreen ctest --test-dir build --output-on-failure
}

package() {
    DESTDIR="$pkgdir" cmake --install "$pkgname-$pkgver/build"
}
