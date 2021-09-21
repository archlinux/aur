# Maintainer: scrouthtv <scrouthtv 0x40 gmail 0x2e com>
pkgname=easy-copy
pkgver=1.0.0
pkgrel=2
pkgdesc="modern alternative to coreutils' file handling - beta version"
license=('GPL3')
url="https://github.com/scrouthtv/easy-copy"
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
depends=()
makedepends=('go')
optdepends=()
conflicts=('easycopy-git')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver-rc1.tar.gz")
sha512sums=("2cfc611904f99b22eb6fea0f1e9daa45469811073085702e9858bd3a48fe3c53f3e6a0aeef3ec517f3e0b74ad9b5c18fb28e46cd230f4a9a7b7793c0b2c90d35")

build() {
  cd "$pkgname-$pkgver-rc1"

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
	cd "$pkgname-$pkgver-rc1"

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
	echo "WARNING: easy-copy is still in development"
	echo "Be sure to back up any important files before copying them"
	echo "with easy-copy."
	echo "For more configuration, copy the default config"
	echo "file at /usr/share/easycopy/ec.conf to ~/.config/ec.conf"
	echo "and edit it."
}
