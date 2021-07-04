# Maintainer: scrouthtv <scrouthtv 0x40 gmail 0x2e com>
pkgname=easy-copy
pkgver=0.4.5
pkgrel=2
pkgdesc="modern alternative to coreutils' file handling"
license=('GPL3')
url="https://github.com/scrouthtv/easy-copy"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=()
makedepends=('go')
optdepends=()
conflicts=('easycopy-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver-beta.tar.gz")
sha512sums=("dfdf6f1827c217aa0bac20b0664a0c9f38fe2f7dd8608a59cc89224a2a312e36a3fe764e9f6bd0eedfed5044af08832832f52ff4ec472b82ef665264c5304f65")

build() {
  cd "$pkgname-$pkgver-beta"

	export CGO_CPPFLAGS="${CPPFLAGS}"
	export CGO_CFLAGS="${CFLAGS}"
	export CGO_CXXFLAGS="${CXXFLAGS}"
	export CGO_LDFLAGS="${LDFLAGS}"
	export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build .

	gzip doc/easycopy.1
	gzip doc/ec.conf.5
}

package() {
	cd "$pkgname-$pkgver-beta"

	# binary:
  install -Dm755 "easy-copy" "$pkgdir/usr/bin/ec"

	# sample config file:
	install -Dm644 "shared/ec.conf" "$pkgdir/usr/share/easycopy/ec.conf"

	# man files:
	install -Dm644 "doc/easycopy.1.gz" "$pkgdir/usr/share/man/man1/easycopy.1.gz"
	install -Dm644 "doc/ec.conf.5.gz" "$pkgdir/usr/share/man/man5/ec.conf.5.gz"

	# completion files:
	install -Dm644 "shared/ec-completion.bash" "$pkgdir/usr/share/bash-completion/completion/ec"
	install -Dm644 "shared/ec-completion.fish" "$pkgdir/usr/share/fish/completions/ec.fish"
	install -Dm644 "shared/ec-completion.zsh" "$pkgdir/usr/share/zsh/site-functions/_ec"
}

post_install() {
	echo "For more configuration, copy the default config"
	echo "file at /usr/share/easycopy/ec.conf to ~/.config/ec.conf"
	echo "and edit it."
}
