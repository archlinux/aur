# Maintainer: Matt Coffin <mcoffin13@gmail.com>
pkgname=fanctl-git
pkgver=0.4.1.r0.05737f6
pkgrel=1
pkgdesc="fanctl is a replacement for fancontrol from lm_sensors meant to have a more fine-grained control interface in its config file"
arch=('x86_64')
url="https://gitlab.com/mcoffin/fanctl"
license=('GPL3')
groups=()
depends=()
makedepends=('git' 'cargo') # 'bzr', 'git', 'mercurial' or 'subversion'
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
replaces=()
backup=()
options=()
install=
source=('fanctl::git+https://gitlab.com/mcoffin/fanctl.git#branch=master'
        fanctl.service)
noextract=()
sha512sums=('SKIP'
            '7aab4bdec106c131f20f78bb150e4f6b2875fede6cef3ffbe164279f2f2b35aeabc0c81b7375e4eee4513acb9a0cc7ce43edb1492b27275dd63d520de26a6d69')

pkgver() {
	cd "$srcdir/${pkgname%-git}"
	printf "%s" "$((git get-version -a -v || git describe --long) | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$srcdir/${pkgname%-git}"
	cargo build --release
}

package() {
	cd "$srcdir/${pkgname%-git}"
	cargo install --path . --root "$pkgdir/usr" --bins
	for f in "$pkgdir/usr/"{.crates.toml,.crates2.json}; do
		if [ -e $f ]; then
			rm $f
		fi
	done
	install -D -m 644 -t "$pkgdir/usr/share/licenses/$pkgname" ./COPYING
	install -D -m 644 fanctl.yml "$pkgdir/usr/share/fanctl.example.yml"
	install -D -m 644 -t "$pkgdir/usr/lib/systemd/system" "$srcdir/fanctl.service"
}
