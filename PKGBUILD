# Maintainer: Adrian <adrian@mxlinux.org>
pkgname=formatusb
pkgver=26.01arch
pkgrel=1
pkgdesc="USB Device Formatting Utility"
arch=('x86_64' 'i686')
url="https://github.com/MX-Linux/formatusb"
license=('GPL3')
depends=(
    'qt6-base'
    'parted'
    'coreutils'
    'util-linux'
)
makedepends=('qt6-tools' 'cmake')
source=("https://github.com/MX-Linux/formatusb/archive/refs/tags/26.01arch.tar.gz")
sha256sums=('6e2b930e5a17ae404fb29a971e83a185fbbbdb1f3f12378f6b68a78537298a1c')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    rm -rf build

    mkdir -p build
    cd build

    cmake .. -DCMAKE_BUILD_TYPE=Release
    make -j$(nproc)
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 build/formatusb "${pkgdir}/usr/bin/formatusb"

    install -Dm755 lib/formatusb_lib "${pkgdir}/usr/lib/formatusb/formatusb_lib"

    install -dm755 "${pkgdir}/usr/share/formatusb/locale"
    install -Dm644 build/*.qm "${pkgdir}/usr/share/formatusb/locale/" 2>/dev/null || true

    install -Dm644 polkit-actions/org.mxlinux.pkexec.formatusb.policy \
        "${pkgdir}/usr/share/polkit-1/actions/org.mxlinux.pkexec.formatusb.policy"

    install -Dm644 formatusb.desktop "${pkgdir}/usr/share/applications/formatusb.desktop"

    install -Dm644 formatusb.png "${pkgdir}/usr/share/icons/hicolor/48x48/apps/formatusb.png"
    install -Dm644 formatusb.png "${pkgdir}/usr/share/pixmaps/formatusb.png"
    install -Dm644 formatusb.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/formatusb.svg"

    install -dm755 "${pkgdir}/usr/share/doc/formatusb"
    install -Dm644 authors.txt "${pkgdir}/usr/share/doc/formatusb/authors.txt"
    install -Dm644 license.html "${pkgdir}/usr/share/doc/formatusb/license.html"
    gzip -c debian/changelog > "${pkgdir}/usr/share/doc/formatusb/changelog.gz"
    if [ -d help ]; then
        cp -r help "${pkgdir}/usr/share/doc/formatusb/" 2>/dev/null || true
    fi

    install -Dm644 scripts/cli-shell-utils.bash "${pkgdir}/usr/lib/cli-shell-utils/cli-shell-utils.bash"

    install -Dm755 scripts/vmlinuz-version "${pkgdir}/usr/lib/cli-shell-utils/bin/vmlinuz-version"
}
