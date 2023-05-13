# Maintainer: iamawacko <iamawacko@protonmail.com>
pkgname='synth-git'
pkgver=0.6.9.r10.g8b3b738
pkgrel=2
pkgdesc='The Open Source Data Generator'
url='https://getsynth.com/'
arch=('any')
license=('Apache-2.0')
source=("$pkgname::git+https://github.com/shuttle-hq/synth")
sha256sums=('SKIP')
conflicts=('synth')
provides=('synth')
makedepends=('cargo-nightly' 'sqlite' 'git')
depends=('sqlite')

pkgver() {
  cd "synth-git"
  git describe --long --abbrev=7 --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
	cd "synth-git"
	case $CARCH in 
		"pentium4")
			cargo fetch --locked --target "i686-unknown-linux-gnu"
			;;
		*)
			cargo fetch --locked --target "$CARCH-unknown-linux-gnu"
			;;
	esac
}

build() {
	cd "synth-git"
	export CARGO_TARGET_DIR=target
	cargo +nightly build --frozen --release --bin synth
}

package() {
	cd "synth-git"
	install -Dm0755 -t "$pkgdir/usr/bin/" "target/release/synth"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/synth/LICENSE"
}
