# Maintainer: actuallyaridan <https://github.com/actuallyaridan>
#
# This is the source of truth for the AUR package. On release,
# .github/workflows/release.yml injects the real pkgver and sha256sums,
# generates .SRCINFO, and pushes both to the AUR. The two values below are
# placeholders; everything else is used verbatim.

pkgname=linux-explorer
pkgver=2.0
pkgrel=1
pkgdesc="A faithful recreation of Windows 7's Explorer and Control Panel"
arch=('x86_64')
url="https://github.com/actuallyaridan/linux-explorer"
license=('GPL-3.0-only')
depends=('qt6-base' 'qt6-multimedia' 'kio' 'kcoreaddons' 'kconfig'
         'kwidgetsaddons' 'kwindowsystem' 'solid' 'libaero-qt'
         'libcups' 'openssl' 'zlib')
optdepends=('kio-extras: real search, and archives that open as folders'
            'kio-admin: Open as Administrator'
            'ark: Send to Compressed (zipped) folder'
            'ffmpegthumbs: thumbnails for video'
            'kdegraphics-thumbnailers: thumbnails for PDF and RAW'
            'kdenetwork-filesharing: Samba browsing behind Map network drive'
            'polkit: installing and uninstalling programs from the Control Panel'
            'yay: reinstalling AUR programs from Programs and Features'
            'ufw: firewall status on the Firewall page of the Control Panel')
# The Control Panel used to be its own package, which installed the same
# start menu entry and is replaced by this one
provides=('linux-control')
conflicts=('linux-control')
replaces=('linux-control')
makedepends=('cmake' 'ninja')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('65e79399cbedbe2320ce6b2ca6576639a72b0b35358a9494e04aaba25fe69e2e')

build() {
    cmake -S "$pkgname-$pkgver" -B build \
        -G Ninja \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
