# Maintainer: Sergey Shatunov <me@prok.pw>
pkgname=zram-generator-git
pkgver=0.1.2+23+g9de243e
pkgrel=1
pkgdesc="Systemd unit generator for zram devices"
arch=("x86_64")
url="https://github.com/systemd/zram-generator"
provides=('zram-generator')
conflicts=('zram-generator')
license=('MIT')
depends=("systemd")
makedepends=('git' 'rust')
install='zram-generator.install'
source=("${pkgname%-git}::git+https://github.com/systemd/zram-generator.git#branch=master"
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

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm755 target/release/zram-generator "$pkgdir/usr/lib/systemd/system-generators/zram-generator"
	install -Dm644 zram-generator.conf.example "$pkgdir/usr/share/doc/zram-generator/zram-generator.conf.example"
	install -Dm644 "$srcdir/half-memory.conf.example" "$pkgdir/usr/share/doc/zram-generator/half-memory.conf.example"
}
