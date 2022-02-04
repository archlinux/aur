# Maintainter: Woshiluo Luo <woshiluo.luo@outlook.com>
pkgname=webdav-server-rs-git
_pkgname=webdav-server-rs
pkgver=0.4.0.4.g547602e
pkgrel=1
pkgdesc="webdav server in rust"
arch=('x86_64')
url="https://github.com/miquels/webdav-server-rs"
license=('APACHE')
makedepends=('git' 'rust')
depends=('pam')
source=(git+https://github.com/woshiluo/webdav-server-rs 'webdav-server.service')
backup=('etc/webdav-server-rs/config.toml')

md5sums=('SKIP'
         '229822929b0b74460306fb0131b90db9')

pkgver() {
	cd "$srcdir/$_pkgname"

	echo $(git describe --tags | tail -c +2 | sed 's/-/./g')
}

build() {
	cd "$srcdir/$_pkgname"

	cargo build --release --no-default-features --features=pam
}

package() {
	cd $srcdir
	install -Dm644 webdav-server.service ${pkgdir}/usr/lib/systemd/system/webdav-server.service

	cd "$_pkgname"

	mkdir -p $pkgdir/usr/bin
	install -Dm644 webdav-server.toml ${pkgdir}/etc/webdav-server-rs/config.toml
	find target/release \
		-maxdepth 1 \
		-executable \
		-type f \
		-exec install -m 755 "{}" "$pkgdir"/usr/bin \;
}
