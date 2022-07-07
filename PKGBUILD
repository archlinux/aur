# Maintainer: FixFromDarkness <aur@forestfox.tk>
pkgname=microbin
pkgver=1.0.2
pkgrel=2
pkgdesc="A tiny, self-contained, configurable paste bin and URL shortener written in Rust."
arch=('any')
url="https://github.com/szabodanika/microbin"
license=('BSD')
makedepends=('cargo')
checkdepends=('cargo')
# install="$pkgname.install"
source=("https://github.com/szabodanika/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
"$pkgname.service")
sha256sums=('04d3f002b8a1558661e0ae9b70535e28b5f75b19d29ab421f11ea79fbd57c65d'
            '83676bfb39c58acf01937a1a0ca7c92386a6cddf0529c943b680265ff4b2fe21')

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
	install -Dm644 ../$pkgname.service "$pkgdir"/usr/lib/systemd/system/microbin.service
	install -do http -g http "$pkgdir"/var/lib/microbin/
}
