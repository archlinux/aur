# Maintainer: David Manouchehri
# Contributor: Tony Lambiris <tony@criticalstack.com>
# Contributor: Thomas Marchsteiner <tommy[0x2e]m86[0x40]gmail[0x2e]com>

_gitname=PF_RING
pkgname="${_gitname,,}-userland-git"
_gitbranch=dev
_gitauthor=ntop
pkgdesc="High-speed packet processing framework (dev branch) - userland tools"
url="https://github.com/${_gitauthor}/${_gitname}"
license=('LGPL')
source=("git://github.com/${_gitauthor}/${_gitname}#branch=${_gitbranch}")
depends=('pf_ring-kernel-git')
makedepends=('git' 'parallel')
conflicts=('libpfring-git')
provides=('libpfring-git')
sha512sums=('SKIP')
arch=('aarch64' 'armv6h' 'armv7h' 'i686' 'x86_64')
pkgver=v6.0.3.r1094.g9e72191
pkgrel=1

pkgver() {
	cd "${srcdir}/${_gitname}"
	(
		set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	cd "${srcdir}/${_gitname}/userland"
	./configure --prefix=/usr
	make
}

package() {
	cd "${srcdir}/${_gitname}/userland"
	make DESTDIR="${pkgdir}" install

	mkdir -p "${pkgdir}/usr/share/man"
	mv "${pkgdir}/usr/local/share/man" "${pkgdir}/usr/share/man"
	
	mkdir -p "${pkgdir}/usr/bin"
	cd "${pkgdir}/usr/bin"
	find "${srcdir}/${_gitname}/userland/examples/" \
		"${srcdir}/${_gitname}/userland/examples_zc/" -executable -type f \
		-print0 | parallel -0 'cp -v {} ./{/}'
}

# vim:set et sw=2 sts=2 tw=80:
