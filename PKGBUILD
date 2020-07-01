# Maintainer: Sergey Shatunov <me@prok.pw>
pkgname=zram-generator
pkgver=0.2.0+rc.1
pkgrel=1
pkgdesc="Systemd unit generator for zram devices"
arch=("x86_64")
url="https://github.com/systemd/zram-generator"
license=('MIT')
depends=("systemd")
makedepends=('git' 'rust' 'ruby-ronn-ng')
_commit=3821c08f9e236da549ed0eae5d75d2c08a1e7502 # tags/0.2.0-rc.1^0
install='zram-generator.install'
source=("${pkgname%-git}::git+https://github.com/systemd/zram-generator.git#commit=$_commit"
        'half-memory.conf.example'
        'zram-generator.install')
sha256sums=('SKIP'
            '1aa3e7a47303c0b2dff6d74cc569c12e8009ed4642301db67fb389cb313141cf'
            '17f510e96f763d1c9aa8c0de757ad38dbe089465fb802e3c34682793f060bf77')

pkgver() {
	cd "$srcdir/${pkgname%-git}"

	printf "%s" "$(git describe --tags | sed 's/^v//;s/-/+/g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"

	cargo build --release
}

check() {
	cd "$srcdir/${pkgname%-git}"

	cargo test --release
}

package() {
	cd "$srcdir/${pkgname%-git}"

	make DESTDIR="$pkgdir" install
	install -Dpm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dpm644 "$srcdir/half-memory.conf.example" "$pkgdir/usr/share/doc/zram-generator/half-memory.conf.example"
}
