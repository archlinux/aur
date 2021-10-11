# Maintainer: tectonic-deploy <sasha+tectonic@hackafe.net>
# Maintainer: Daniel M. Capella <polyzen@archlinux.org>
# Contributor: Jan Tojnar <jtojnar@gmail.com>

# The master version of this file is maintained here:
#
#   https://github.com/tectonic-typesetting/tectonic/blob/master/dist/arch/PKGBUILD.src.in
#
# The version on aur.archlinux.org is updated automatically by the Tectonic
# CI/CD system when new versions are released. Pull requests should be filed
# against Tectonic if the settings in this file need changing.

pkgname=tectonic
pkgver=0.8.0
pkgrel=1
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
pkgdesc='Modernized, complete, self-contained TeX/LaTeX engine, powered by XeTeX and TeXLive'
url=https://tectonic-typesetting.github.io/
license=('MIT')
depends=('fontconfig' 'harfbuzz-icu' 'openssl')
makedepends=('cargo' 'pkg-config')
source=("$pkgname-$pkgver.tar.gz::https://crates.io/api/v1/crates/$pkgname/$pkgver/download")
sha512sums=('4750b32621f5557bd4ef885445898b1b555461bc30cf8476a9fb2a76b008d7378664465f4cd6b1b8ddc7305cd24bda4a6d865ec925fad64edcd9e4a302d70b21')

build() {
	cd $pkgname-$pkgver
	cargo build --release --locked --features external-harfbuzz
}

check() {
	cd $pkgname-$pkgver
	cargo test --release --locked --features external-harfbuzz
}

package() {
	cd $pkgname-$pkgver
	install -Dm755 ${CARGO_TARGET_DIR:-target}/release/tectonic "$pkgdir"/usr/bin/tectonic
	install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
