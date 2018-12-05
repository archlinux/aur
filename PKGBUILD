pkgname=('lrad-git' 'lrad-daemon-git')
_pkgname='lrad'
pkgver=0.1.0.76.g1255f83
pkgrel=1
arch=('any')
url='https://github.com/sameer/lrad'
license=('MIT')
makedepends=('rust-nightly' 'cargo-nightly' 'cmake' 'gcc' 'git' 'openssl' 'curl')
source=("$_pkgname::git+https://github.com/sameer/lrad.git")
sha256sums=('SKIP')

pkgver() {
	cd $_pkgname
	echo "$(grep '^version =' ./lrad-lib/Cargo.toml|head -n1|cut -d\" -f2).$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

package_lrad-git() {
	pkgdesc='An update framework CLI tool for applications running on hobbyist systems'
	depends=('git' 'openssl' 'go-ipfs' 'curl')
	provides=('lrad')
	conflicts=('lrad')

	cd $_pkgname

	env rustup toolchain install nightly
	env cargo +nightly build --release

	install -D -m755 "$srcdir/$_pkgname/target/release/lrad-cli" "$pkgdir/usr/bin/lrad"
}

package_lrad-daemon-git() {
	pkgdesc='Daemon for the lrad update framework to be run on target systems'
	depends=('git' 'docker' 'openssl' 'go-ipfs' 'systemd')
	provides=('lrad-daemon')
	conflicts=('lrad-daemon')

	cd $_pkgname

	install -D -m755 "$srcdir/$_pkgname/target/release/lrad-daemon" "$pkgdir/usr/bin/lrad-daemon"
	mkdir -p "$pkgdir/etc/lrad"
	install -D -m644 "$srcdir/$_pkgname/lrad-daemon/lrad-daemon.toml" "$pkgdir/etc/lrad/lrad-daemon.toml"
	install -D -m644 "$srcdir/$_pkgname/lrad-daemon/lrad-daemon.service" "$pkgdir/usr/lib/systemd/system/lrad-daemon.service"
}
