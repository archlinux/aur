# Maintainer: capezotte (carana2099 ob gmail at com)
# Contributor: Seto (Github: huresche)
# Contributor: Koichi Murase (Github: akinomyoga)

pkgname=blesh-git
_pkgname=ble.sh
pkgdesc="Custom bash line editor with enhanced features"
pkgver=0.4.0_devel3.r1508.0bc2660
pkgrel=1
license=(BSD)
url='https://github.com/akinomyoga/ble.sh'
depends=(bash awk sed)
makedepends=(bash awk sed make git)
arch=(any)
source=("git+$url" "git+${url/%.sh/sh-contrib}" 'blesh-update.sh')
md5sums=('SKIP'
         'SKIP'
         '3cf758a103b08cc3f95278cc6954d83b')
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
