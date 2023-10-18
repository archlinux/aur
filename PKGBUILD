# Maintainer: Aiden Langley <aiden at nedia.dev>

pkgname=nedots
pkgdesc="A dotfile management tool."
url="https://github.com/aidenlangley/nedots.go"
arch=("any")
license=("MIT")
pkgver=0.1.0
pkgrel=1
source=("nedots.go-v$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
makedepends=("go")
provides=("nedots")
sha256sums=('0ab5ed49e28cebc18b68255ba2565e348f5df826d726b16ae937474c84b889a4')

build() {
	cd "$pkgname".go-"$pkgver" || return
	go -C src build -buildvcs=false -o ../nedots .

	for shell in bash zsh fish; do
		./nedots completion "$shell" >nedots-completions."$shell"
	done
}

package() {
	cd "$pkgname".go-"$pkgver" || return
	install -Dm 755 nedots -t "$pkgdir"/usr/bin
	install -Dm 644 nedots-completions.bash "$pkgdir/usr/share/bash-completion/completions/nedots"
	install -Dm 644 nedots-completions.zsh "$pkgdir/usr/share/zsh/site-functions/_nedots"
	install -Dm 644 nedots-completions.fish "$pkgdir/usr/share/fish/vendor_completions.d/nedots.fish"
}
