# Maintainer: TNE <tne@garudalinux.org>

pkgname=snapper-tools
pkgver=1.2.0
pkgrel=1
pkgdesc="A highly opinionated Snapper GUI and CLI"
arch=('x86_64')
url="https://gitlab.com/garuda-linux/applications/$pkgname"
license=('GPL3')
depends=('qt5-base' 'qt5-svg' 'polkit')
makedepends=('qt5-tools' 'cmake' 'git' 'polkit')
source=("$pkgname-$pkgver.tar.gz::$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('23ed6d6f4342adb8f15f02c4cd77ebb133c6233641b26609492b821d903a9d2a')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cmake -B build -S . \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr' \
        -Wno-dev
    make -C build
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make -C build DESTDIR="$pkgdir" install

    install -Dm0644 org.garuda.snapper-tools.pkexec.policy "$pkgdir/usr/share/polkit-1/actions/org.garuda.snapper-tools.pkexec.policy"
    install -Dm0755 snapper-tools-pkexec "$pkgdir/usr/lib/snapper-tools-pkexec"
    install -Dm0644 snapper-tools-check.desktop "$pkgdir/etc/xdg/autostart/snapper-tools-check.desktop"
}
