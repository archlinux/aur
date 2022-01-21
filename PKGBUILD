# Maintainer: 31337h4ck3r at gmail dot com
# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: Sergej Pupykin <pupykin.s+arch@gmail.com>
# Contributor: Stefano Zamprogno <stefano dot zamprogno at gmail dot com>
# Contributor: Chuck Yang <Chuck.Yang@gmail.com>

pkgname=lshw-git
pkgver=B.02.19.r74.g52736f6
pkgrel=2
pkgdesc='A small tool to provide detailed information on the hardware configuration of the machine'
url=https://ezix.org/project/wiki/HardwareLiSter
license=(GPL)
arch=(x86_64)
depends=(gcc-libs hwdata)
optdepends=('gtk3: for gtk-lshw')
makedepends=(gtk3 sqlite docbook-utils perl-sgmls git)
conflicts=("${pkgname%-git}")
provides=("${pkgname%-git}")
options=(!lto)
source=(git+https://ezix.org/src/pkg/lshw.git)
sha256sums=('SKIP')

pkgver() {
    cd "${pkgname%-git}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "${pkgname%-git}"
    sed -i 's|/usr/bin/gtk-lshw|/usr/sbin/gtk-lshw|' src/gui/integration/gtk-lshw.desktop
    sed -i '/^LDFLAGS=$/d' src/core/Makefile src/gui/Makefile
}

build() {
    cd "${pkgname%-git}"
    export VERSION=$pkgver
    make SBINDIR=/usr/bin
    make SBINDIR=/usr/bin gui
}

package() {
    cd "${pkgname%-git}"
    make DESTDIR="$pkgdir"/ SBINDIR=/usr/bin install
    make DESTDIR="$pkgdir"/ SBINDIR=/usr/bin install-gui
    install -Dm0644 src/gui/integration/gtk-lshw.desktop -t "$pkgdir"/usr/share/applications
    install -Dm0644 src/gui/integration/gtk-lshw.pam -t "$pkgdir"/usr/share/doc/$pkgname
    install -Dm0644 src/gui/integration/console.apps -t "$pkgdir"/usr/share/doc/$pkgname
    rm -f "$pkgdir"/usr/share/lshw/{pci,usb}.ids
}
