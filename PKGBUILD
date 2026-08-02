# Maintainer: Ivan Nebotov <i.nebotov@gdllc.dev>

pkgname=trc
pkgver=0.3.2
pkgrel=1
pkgdesc='Yandex Tracker CLI'
arch=('x86_64' 'aarch64')
url='https://github.com/GoldenDeals/trc'
license=('MIT')
options=('!strip' '!debug')
source=("configexample-$pkgver.yaml::$url/raw/v$pkgver/config/configexample.yaml")
sha256sums=('90a22d39e9644782cc03a35ea36720dc9602cd49bc8b85255d52f7fa6c7ed99c')
source_x86_64=("$pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/${pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums_x86_64=('9ec39c4dfef30e5c69db136d2514d3ddc523939488679d4aa66eb685ae21c190')
source_aarch64=("$pkgname-$pkgver-aarch64.tar.gz::$url/releases/download/v$pkgver/${pkgname}_${pkgver}_linux_arm64.tar.gz")
sha256sums_aarch64=('8f488db0b932e5276e51aad652366de10abead637f06668fb4ac8f9db060ba43')

build() {
	mkdir -p completions

	local shell
	for shell in bash zsh fish; do
		TRACKER_TOKEN=x X_ORG_ID=x X_CLOUD_ORG_ID=x \
			./$pkgname completion "$shell" >"completions/$shell"
	done
}

package() {
	install -Dm755 $pkgname "$pkgdir/usr/bin/$pkgname"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
	install -Dm644 "configexample-$pkgver.yaml" \
		"$pkgdir/usr/share/doc/$pkgname/configexample.yaml"

	install -Dm644 completions/bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
	install -Dm644 completions/zsh "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
	install -Dm644 completions/fish "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
}
