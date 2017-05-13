# Maintainer: David Manouchehri
# Contributor: Tony Lambiris <tony@criticalstack.com>

_gitname=PF_RING
pkgname="${_gitname,,}-kernel-git"
_gitbranch=dev
_gitauthor=ntop
pkgdesc="High-speed packet processing framework (dev branch) - kernel module"
url="https://github.com/${_gitauthor}/${_gitname}"
license=('LGPL')
source=("git://github.com/${_gitauthor}/${_gitname}#branch=${_gitbranch}")
depends=('linux-lts' 'numactl')
makedepends=('linux-lts-headers' 'make' 'binutils' 'flex' 'bison' 'git')
conflicts=("pfring-kmod-dev-git" "pfring-kmod-git" "pfring-kmod")
provides=("pfring-kmod-dev-git" "pfring-kmod-git" "pfring-kmod")
optdepends=("pf_ring-userland-git: userland tools")
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
	cd "${srcdir}/${_gitname}/kernel"
	./configure --prefix=/usr
	sed -i "s/INSTDIR\ \:=\ \$(DESTDIR)/INSTDIR := \$(DESTDIR)\/usr/g" Makefile
	make
}

package() {
	cd "${srcdir}/${_gitname}/kernel"
	mkdir -p "${pkgdir}/usr/include/linux"
	make DESTDIR="${pkgdir}" install
}

# vim:set et sw=2 sts=2 tw=80:
