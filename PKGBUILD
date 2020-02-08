# Maintainer: Julian Hurst <julian.hurst@pm.me>
pkgname=imp-git
pkgver=r35.0f2d29f
pkgrel=1
pkgdesc="Helps you manage your accounts using an ini format"
arch=('any')
url="https://git.sr.ht/~ark/imp"
license=('MIT')
conflicts=(imp)
optdepends=('gpgme: gpg file decryption support')
makedepends=(git meson scdoc)
source=("${pkgname%-git}::git+$url")
md5sums=('SKIP')

pkgver() {
	cd "${pkgname%-git}"
	(   set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	mkdir -p build
	arch-meson build ${pkgname%-git}
	ninja -C build
}

package() {
	DESTDIR="$pkgdir" ninja -C build install
	cd "${pkgname%-git}"
	install -m755 scripts/imp-fill_dmenu.sh "$pkgdir"/usr/bin/imp-fill
}
