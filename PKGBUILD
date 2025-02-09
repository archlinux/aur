# Maintainer: John Sanpe <sanpeqf@gmail.com>
pkgname=sdbd-git
_gitname=sdbd
pkgver=r17.905a1ab
pkgrel=1.6
pkgdesc="Simple Debug Bridge Daemon"
arch=(any)
url="https://github.com/openbfdev/sdbd.git"
branch="devel"
license=('GPL')
depends=('bfenv-devel-git' 'bfdev-devel-git')
makedepends=('git' 'make' 'gcc' 'fakeroot' 'bfenv-devel-git' 'bfdev-devel-git')
source=("${_gitname}::git+${url}#branch=${branch}" "adbd" "sdbd.service")
md5sums=('SKIP' 'SKIP' 'SKIP')

pkgver() {
	cd "${srcdir}/${_gitname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd ${_gitname%-git}
	make
}

package() {
	install -Dm755 "${_gitname%-git}/sdbd" "$pkgdir/usr/bin/sdbd"
  	install -Dm755 "$srcdir/adbd" "$pkgdir/usr/bin/adbd"
  	install -Dm644 "$srcdir/sdbd.service" "$pkgdir/usr/lib/systemd/system/sdbd.service"
}
