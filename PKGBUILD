# Maintainer: Yuannan Lin [https://gitlab.com/yuannan] <yuannan@pm.me>

pkgname=yamr
pkgver=0.0.0.2
pkgrel=0
pkgdesc='Yet Another Mirror Ranker. The fastest mirror ranker!⁺ A fast mirrorlist in seconds!'
arch=('any')
url='https://gitlab.com/yuannan/yamr'
license=('GPL3')
depends=('geoip')
conflicts=()
source=("git+https://gitlab.com/yuannan/yamr"
		"$pkgname.service"
		"$pkgname.timer"
		"$pkgname.conf"
		)
sha256sums=("SKIP"
			"b3d16cd45b686caf6c583c4b9627fc5c0ff49b15c101b58d5deed8bc86ace835"
			"ee0e13937fefac4645a10806f22cd632e7b94b56b018c5b6887d2b5ae423c0c7"
			"a2c9e85fb81bb90716deb66991370063895ef0db93d8a6c1f648a5b19dd7f808"
)

build() {
	cd yamr
	git submodule init
	git submodule update
	./clean_build.sh
}

test_out_path="/tmp/yamr.mirrorlist"
check() {
	if [ -e $test_out_path ]; then
		cat $test_out_path
	else
		echo "No test output detected at: " $test_out_path
		return -1
	fi
}

package() {
	install -Dm 755 "$srcdir/$pkgname/build/yamr" "$pkgdir/usr/bin/$pkgname"
	install -Dm 644 "$srcdir/$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
	install -Dm 644 "$srcdir/$pkgname.timer" "$pkgdir/usr/lib/systemd/system/$pkgname.timer"
	install -Dm 644 "$srcdir/$pkgname.conf" "$pkgdir/etc/$pkgname.conf"
}
