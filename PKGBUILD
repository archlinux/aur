# Maintainer: fordprefect <fordprefect@dukun.de>
pkgname=spoofer
pkgver=1.0.5
pkgrel=2
pkgdesc="client software for the spoofer internet research project on ip spoofing, BCP38 compliance"
url="https://spoofer.caida.org"
arch=('x86_64' 'i686')
license=('GPL3')
depends=("libpcap" "protobuf" "qt5-base")
install=spoofer.install
source=("https://www.caida.org/projects/spoofer/downloads/spoofer-1.0.5.tar.gz"
        "spoofer-gui.desktop"
        "spoofer.service"
        "Spoofer.conf"
        "spoofer.install")
sha1sums=('7a9a497181bc7bcbab9276a0e741040075d92b15'
          'fe2779dcfaf0e401f3fa8d7226e7fe97a7af5b66'
          'ecbb2e4ee11288ca682e68ce5f76da4de42d4117'
          '20feb9ceffbb30d45a30d2c5e1908e4dabe2b17c'
          '01197fc6c9c8394934f1aa9891b9c5d124aa2b4e')
options=(emptydirs)

build() {
    cd "$srcdir/$pkgname-$pkgver"
    ./configure
    make
}
 
package() {
    # install binaries
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" PREFIX=/usr install 
    mv "$pkgdir/usr/local/bin" "$pkgdir/usr/"
    rmdir "$pkgdir/usr/local"

    # install other files
    cd ..
    install -Dm644 spoofer-gui.desktop "$pkgdir/usr/share/spoofer/spoofer.desktop"
    install -Dm644 spoofer.service "$pkgdir/usr/lib/systemd/system/spoofer.service"
    install -Dm644 Spoofer.conf "$pkgdir/etc/xdg/CAIDA/Spoofer.conf"
    mkdir -p "$pkgdir/var/lib/spoofer"
}
