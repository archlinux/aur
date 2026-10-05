# Maintainer: Harsh Sharma <harsh@codelif.in>
pkgname=whatevr-git
_pkgname=whatevr
pkgver=0.1.0.r0.g0000000
pkgrel=1
pkgdesc="Native WhatsApp client for Linux (whatevrd daemon + whattui terminal frontend)"
arch=('x86_64' 'aarch64')
url="https://github.com/codelif/whatevr"
license=('BSD-3-Clause')
depends=('glibc' 'libjpeg-turbo')
optdepends=('ffmpeg: video posters and voice note waveforms')
makedepends=('git' 'go' 'gcc' 'just' 'python')
provides=('whatevr' 'whatevrd' 'whattui')
conflicts=('whatevr' 'whatevr-bin')
install="$_pkgname.install"
source=("$_pkgname::git+https://github.com/codelif/whatevr.git"
        "vaxis::git+https://git.sr.ht/~codelif/vaxis"
        "whatsmeow::git+https://git.sr.ht/~codelif/whatsmeow")
sha256sums=('SKIP' 'SKIP' 'SKIP')

prepare() {
	cd "$srcdir/$_pkgname"
	git submodule init
	git config submodule.whattui/vaxis.url "$srcdir/vaxis"
	git config submodule.whatevrd/whatsmeow.url "$srcdir/whatsmeow"
	git -c protocol.file.allow=always submodule update
}

pkgver() {
	cd "$srcdir/$_pkgname"
	# 0.1.0.r5.gabc1234  — from the most recent v* tag, or 0.0.0 if untagged.
	git describe --long --tags --abbrev=7 2>/dev/null \
		| sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
		|| printf "0.0.0.r%s.g%s" \
			"$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
	cd "$srcdir/$_pkgname"
	just build-release
}

package() {
	cd "$srcdir/$_pkgname"
	just install /usr "$pkgdir"
	install -Dm644 "$srcdir/$_pkgname/LICENSE" \
		"$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	local completions="$pkgdir/usr/share"
	install -d "$completions/bash-completion/completions" "$completions/zsh/site-functions" "$completions/fish/vendor_completions.d"
	"$pkgdir/usr/bin/whatevrd" completion bash >"$completions/bash-completion/completions/whatevrd"
	"$pkgdir/usr/bin/whatevrd" completion zsh >"$completions/zsh/site-functions/_whatevrd"
	"$pkgdir/usr/bin/whatevrd" completion fish >"$completions/fish/vendor_completions.d/whatevrd.fish"
}
