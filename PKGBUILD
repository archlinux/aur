# Maintainer: Adrian <adrian@mxlinux.org>
pkgname=uefi-manager-git
pkgrel=2
pkgdesc="A graphical tool for managing UEFI boot entries"
pkgver=25.09.1.r5.g5c4b181
arch=('x86_64' 'i686')
url="https://mxlinux.org"
license=('GPL3')
depends=('efibootmgr' 'qt6-base' 'polkit')
provides=('uefi-manager')
conflicts=('uefi-manager')
makedepends=('cmake' 'ninja' 'qt6-tools' 'git')
source=("$pkgname::git+https://github.com/MX-Linux/uefi-manager.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    # Get version from git tags with commit count and short hash
    git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$pkgname"

    # Get version from git tag (strip any extra pkgver info for CMake)
    _version=$(git describe --tags --abbrev=0 | sed 's/^v//')

    # Flag Arch packaging builds for CMake
    export UEFI_MANAGER_ARCH_BUILD=1

    # Clean any previous build artifacts
    rm -rf build

    # Configure with CMake, passing version override (Arch uses git tags, not debian/changelog)
    cmake -G Ninja \
        -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=ON \
        -DPROJECT_VERSION_OVERRIDE="$_version"

    # Build
    cmake --build build --parallel
}

package() {
    cd "$srcdir/$pkgname"

    # Install binary
    install -Dm755 build/uefi-manager "${pkgdir}/usr/bin/uefi-manager"

    # Install translations
    install -dm755 "${pkgdir}/usr/share/uefi-manager/locale"
    install -Dm644 build/*.qm "${pkgdir}/usr/share/uefi-manager/locale/" 2>/dev/null || true

    # Install helper scripts
    install -dm755 "${pkgdir}/usr/lib/uefi-manager"
    install -Dm755 scripts/helper "${pkgdir}/usr/lib/uefi-manager/helper"
    install -Dm755 scripts/uefimanager-lib "${pkgdir}/usr/lib/uefi-manager/uefimanager-lib"

    # Install PolicyKit policy
    install -Dm644 scripts/org.mxlinux.pkexec.mx-uefimanager-helper.policy \
        "${pkgdir}/usr/share/polkit-1/actions/org.mxlinux.pkexec.mx-uefimanager-helper.policy"

    # Install desktop file
    install -Dm644 uefi-manager.desktop "${pkgdir}/usr/share/applications/uefi-manager.desktop"

    # Install icons
    install -Dm644 uefi-manager.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/uefi-manager.png"
    install -Dm644 uefi-manager.png "${pkgdir}/usr/share/pixmaps/uefi-manager.png"
    install -Dm644 uefi-manager.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/uefi-manager.svg"

    # Install documentation
    install -dm755 "${pkgdir}/usr/share/doc/uefi-manager"
    if [ -d docs ]; then
        cp -r docs/* "${pkgdir}/usr/share/doc/uefi-manager/" 2>/dev/null || true
    fi

    # Install changelog
    gzip -c debian/changelog > "${pkgdir}/usr/share/doc/uefi-manager/changelog.gz"
}
