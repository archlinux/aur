# macfand PKGBUILD
#
# Maintainer: Aaron Blakely <aaron@ephasic.org>
pkgname=macfand-git
_pkgname=macfand
pkgver=1.1.r84.efb60be
pkgrel=1
pkgdesc="Mac fan control daemon"
arch=(x86_64 i686)
url="https://github.com/ablakely/${_pkgname}.git"
license=('MIT')
depends=(libconfig)
makedepends=(git make)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("git+$url")
options=(!debug strip)
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "1.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/${_pkgname}"
    make
}

package() {
    cd "$srcdir/${_pkgname}"

    # Install main binary
    install -Dm755 macfand "$pkgdir/usr/bin/macfand"

    # Install config
    install -Dm644 macfand.conf "$pkgdir/etc/macfand.conf"

    # Install docs & license
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 macfand.1 "$pkgdir/usr/share/man/man1/macfand.1"

    # Install systemd unit
    PREFIX=/usr sh ./macfand.service.gen > macfand.service
    install -Dm644 macfand.service "$pkgdir/usr/lib/systemd/system/macfand.service"

    # Update model list (⚠ don’t use sudo in PKGBUILD)
    perl ./util/updatemodel.pl "$pkgdir/etc/macfand.conf" "$pkgdir/usr/share/$pkgname/machines/"
}

