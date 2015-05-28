# Maintainer: Justin Dray <justin@dray.be>
# Previous maintainer: bobpaul (bobpaul on archlinux forumsBoohbah <boohbah at gmail.com>)
# Contributor: Mikeserv

_gitname=bcache-tools
pkgname=${_gitname}-git
pkgver=1.0.8.r0.ga73679b
pkgrel=1
pkgdesc="Userspace tools for bcache until bcache merges with either dm or md"
changelog=bcache-tools-git.changelog
arch=('i686' 'x86_64')
url="http://bcache.evilpiepirate.org/"
license=('GPL')
depends=('util-linux')
makedepends=('git')
provides=('bcache-tools')
conflicts=('bcache-tools')
install="${pkgname}.install"
source=("git+https://github.com/g2p/${_gitname}.git"
        'initcpio-arch.patch')
md5sums=('SKIP'
         '208d7024340b8db3cf21325df40b6267')

# set _gitrev to a git revision (man gitrevisions) like a tag, a commit sha1
# hash or a branch name to build from this tree instead of master

# _gitrev=""
#_gitrev="89f11b135d1"

pkgver() {
	cd "${srcdir}/${_gitname}"
	[[ -n $_gitrev ]] && git reset --hard "$_gitrev"
	git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/^v//'
}

prepare() {
	cd "${srcdir}/${_gitname}"
	patch -Np1 -i "${srcdir}/initcpio-arch.patch"
}

build() {
	cd "${srcdir}/${_gitname}"
	make
}

package() {
	cd "${srcdir}/${_gitname}"
	mkdir -p "${pkgdir}/usr/bin"
	mkdir -p "${pkgdir}/usr/lib/udev/rules.d"
	mkdir -p "${pkgdir}/usr/share/man/man8"
	mkdir -p "${pkgdir}/usr/lib/initcpio/install"

	make DESTDIR="${pkgdir}" install
}
