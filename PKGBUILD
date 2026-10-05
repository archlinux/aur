# Maintainer: Harsh Sharma <harsh@codelif.in>
pkgname=whatevr
pkgver=0.9.1
pkgrel=1
pkgdesc="Native WhatsApp client for Linux (whatevrd daemon + whattui terminal frontend)"
arch=('x86_64' 'aarch64')
url="https://github.com/codelif/whatevr"
license=('BSD-3-Clause')
depends=('glibc' 'libjpeg-turbo')
optdepends=('ffmpeg: video posters and voice note waveforms')
makedepends=('go' 'gcc' 'just' 'python')
provides=('whatevrd' 'whattui')
conflicts=('whatevr-git' 'whatevr-bin')
install="$pkgname.install"
source=("$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('474c68807e30ea4fc72d832e13357124a69ac13d31f19cbccc075f9dfee737df')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	just build-release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	just install /usr "$pkgdir"
	install -Dm644 "$srcdir/$pkgname-$pkgver/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	local completions="$pkgdir/usr/share"
	install -d "$completions/bash-completion/completions" "$completions/zsh/site-functions" "$completions/fish/vendor_completions.d"
	"$pkgdir/usr/bin/whatevrd" completion bash >"$completions/bash-completion/completions/whatevrd"
	"$pkgdir/usr/bin/whatevrd" completion zsh >"$completions/zsh/site-functions/_whatevrd"
	"$pkgdir/usr/bin/whatevrd" completion fish >"$completions/fish/vendor_completions.d/whatevrd.fish"
}
