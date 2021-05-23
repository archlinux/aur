# Maintainer: capezotte (carana2099 ob gmail at com)
# Contributor: Seto (huresche at GitHub)
# Contributor: Koichi Murase (akinomyoga at GitHub)

pkgname=blesh-git
_pkgname=ble.sh
pkgdesc="Custom bash line editor with enhanced features"
pkgver=0.4.0_devel3.r1523.9372670
pkgrel=1
license=(BSD)
url='https://github.com/akinomyoga/ble.sh'
depends=(bash awk sed)
makedepends=(bash gawk sed make git)
arch=(any)
source=("git+$url" "git+${url/%.sh/sh-contrib}" 'blesh-update.sh')
md5sums=('SKIP'
         'SKIP'
         'd34e38593c8b79ba8ad7e0edc5935f24')
install=blesh.install

pkgver() {
	cd "$_pkgname"
	printf "%s.r%s.%s" \
		"$(sed -n 's/-/_/g;s/^FULLVER[[:space:]]*:=[[:space:]]*//p' GNUmakefile)" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$_pkgname"
	git submodule update --init --recursive
}

package() {
	# Makes ble-update call an AUR helper
	install -Dm755 blesh-update.sh "$pkgdir"/usr/share/blesh/lib/_package.sh
	cd "$_pkgname"
	make install DESTDIR="$pkgdir" PREFIX=/usr
}
