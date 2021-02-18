# Maintainer: David Londoño <davidlo176@gmail.com>
pkgbase=skr
pkgname=skr-git
_gitname='skr'
pkgver=r129.6116d5b
pkgrel=1
pkgdesc="Low level key remapping"
arch=('x86_64' 'arm' 'aarch64')
url="https://github.com/DavRack/skr"
license=('GPL')
groups=()
depends=('interception-tools' 'sudo' 'python')
makedepends=('git' 'gcc')
provides=('skr')
source=(
	'skr::git://github.com/DavRack/skr'
	'skr@.service'
)
sha256sums=(
	'SKIP'
        '9faffc3a0806ebb69ec7d894bc5f8bc772da7a3d6da019e72f4fba46c439a957'
)

pkgver() {
	cd "$srcdir/${_gitname}"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${_gitname}"
	./install.sh -b
}

package() {
	cd "${srcdir}/${_gitname}"
	mkdir -p "$pkgdir/usr/share/skr/" "$pkgdir/usr/lib/systemd/system/"
	cp -r ./src/parser "$pkgdir/usr/share/skr/"
	install -Dm755 skrkid "$pkgdir/usr/share/skr/"
	install -Dm755 skrcore "$pkgdir/usr/share/skr/"
	install -Dm755 skr "$pkgdir/usr/bin/${_gitname}"
	install -Dm644 "${srcdir}/skr@.service" "$pkgdir/usr/lib/systemd/system/"
}
