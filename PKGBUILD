# Maintainer: SelfRef <arch@selfref.dev>

_pkgbase=mrpack-install
pkgname="$_pkgbase-git"
pkgver=r388.f9b20d3
pkgrel=1
pkgdesc="Modrinth Modpack server deployment"
arch=('any')
url="https://github.com/nothub/mrpack-install"
license=('MIT')
provides=('mrpack-install')
conflicts=('mrpack-install')
source=("$_pkgbase::git+https://github.com/nothub/mrpack-install.git")
sha256sums=('SKIP')
makedepends=('git' 'go' 'goreleaser')

pkgver() {
	cd "$_pkgbase"
	( set -o pipefail
		git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
	)
}

build() {
	cd "$_pkgbase"
	goreleaser build --clean --snapshot --single-target
}

package() {
	install -Dm755 "$_pkgbase"/dist/mrpack-install*/mrpack-install "$pkgdir"/usr/bin/mrpack-install
	install -Dm644 "$_pkgbase"/LICENSE.txt "$pkgdir"/usr/share/licenses/"$_pkgbase"/LICENSE.txt
}
