# Maintainer: FixFromDarkness <aur@forestfox.tk>
pkgname=microbin
pkgver=1.1.0
pkgrel=1
pkgdesc="A tiny, self-contained, configurable paste bin and URL shortener written in Rust."
arch=('any')
url="https://github.com/szabodanika/microbin"
license=('BSD')
makedepends=('cargo')
checkdepends=('cargo')

backup=('etc/microbin.conf')

source=("https://github.com/szabodanika/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
"$pkgname.service" "$pkgname.conf")
sha256sums=('5029d7fb52e9d2f476bb17c97909639c1e2526583480dbdf790cf767574efd4d'
            '3704d0a839585b6e6a38dda635f7c8119a3c8286420f62a028ae1b7d27a89ad0'
            '8e943fc702637b1b7441491db945c078d190c4208cd202e5e360cad90ca793ab')


#prepare() {
#    cd "$srcdir/$pkgname-$pkgver"
#    cargo fetch
#}

build() {
	cd "$srcdir/$pkgname-$pkgver"

	export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    
    ## Disable lto
    export CFLAGS=`echo $CFLAGS | sed 's/-flto//g'`
    export CXXFLAGS=`echo $CXXFLAGS | sed 's/-flto//g'`
    export LDFLAGS=`echo $LDFLAGS | sed 's/-flto//g'`
    
    cargo build --release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/$pkgname"
	install -Dm644 ../$pkgname.service "$pkgdir"/usr/lib/systemd/system/$pkgname.service
	install -Dm644 ../$pkgname.conf "$pkgdir"/etc/$pkgname.conf
	install -do http -g http "$pkgdir"/var/lib/microbin/
}
