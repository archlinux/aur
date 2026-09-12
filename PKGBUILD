# Maintainer: Evan Purkhiser <things3-cloud.aur@evanpurkhiser.com>

pkgname=things3-cloud
pkgver=0.10.0
pkgrel=2
pkgdesc="Command-line client for Things 3 using the Things Cloud API"
arch=('x86_64' 'aarch64')
url="https://github.com/evanpurkhiser/things3-cloud"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cargo')
options=('!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/evanpurkhiser/things3-cloud/archive/refs/tags/v${pkgver}.tar.gz"
	'things3-server.service'
	'70-things3-cloud-restart.hook')
sha256sums=('a8746472d594500ed366a233fbea2cc74645ea619ad539be22ef12c44c2dc255'
	'129ebb7615a0d26cb900f511e708910e471ee15af6f3b1735afe11fbc7d9c5e6'
	'b2668bec2eb6dbb39480a699c25b557ff83f0a19e29526bf8879abf3316314da')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	cargo build --release --locked
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}"

	install -Dm755 target/release/things3 "${pkgdir}/usr/bin/things3"
	install -Dm644 <("${pkgdir}/usr/bin/things3" completions bash) \
		"${pkgdir}/usr/share/bash-completion/completions/things3"
	install -Dm644 <("${pkgdir}/usr/bin/things3" completions zsh) \
		"${pkgdir}/usr/share/zsh/site-functions/_things3"
	install -Dm644 <("${pkgdir}/usr/bin/things3" completions fish) \
		"${pkgdir}/usr/share/fish/vendor_completions.d/things3.fish"
	install -Dm644 "${srcdir}/things3-server.service" \
		"${pkgdir}/usr/lib/systemd/system/things3-server.service"
	install -Dm644 "${srcdir}/70-things3-cloud-restart.hook" \
		"${pkgdir}/usr/share/libalpm/hooks/70-things3-cloud-restart.hook"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
