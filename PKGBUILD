# Maintainer: rern <rernrern@gmail.com>

pkgname=camilladsp
pkgver=1.0.1
pkgrel=1
pkgdesc='IIR and FIR engine for crossovers, room correction etc.'
url=https://github.com/HEnquist/camilladsp
arch=(armv6h armv7h aarch64)
license=(GPL)
depends=(alsa-lib openssl)
makedepends=(pkg-config rust)
source=(https://github.com/HEnquist/camilladsp/archive/refs/tags/v$pkgver.tar.gz
        camilladsp.install
        camilladsp.service
        camilladsp.yml)
sha256sums=('890d84d2ae105968d536d9795ff4c9da2acedb7e6eaa7794a45fc4ca02c028ed'
            '15e9bb22a32472b88bd092d5bdbca0cdc7de8d0a476e954558ca8e00ab8c4517'
            '993f05f04e1627b1739046e3c59d880deec1d4849525fa0e633dda5493923b48'
            'dd7932754e220e3e68250dae326ce6a81f6a61ce7923f6e001c9c3c1787a3b07')

backup=('srv/http/data/camilladsp/configs/camilladsp.yml')
install=camilladsp.install

build() {
    cd $srcdir/$pkgname-$pkgver
    cargo build --release
}

package() {
    install -Dm 775 $srcdir/$pkgname-$pkgver/target/release/camilladsp -t $pkgdir/usr/bin
    install -Dm 755 -g http -o http camilladsp.yml -t $pkgdir/srv/http/data/camilladsp/configs
    install -Dm 644 camilladsp.service -t $pkgdir/usr/lib/systemd/system
    mkdir $pkgdir/srv/http/data/camilladsp/coeffs
    chown http:http $pkgdir/srv/http/data/camilladsp/coeffs
}
