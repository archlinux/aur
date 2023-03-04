# Maintainer: Nikos Toutountzoglou <nikos.toutou@gmail.com>

pkgname=tsduck-git
_reponame=tsduck
pkgver=3.33.3139.r12.gc4243cf22
pkgrel=1
pkgdesc="TSDuck is an extensible toolkit for MPEG transport streams"
arch=('x86_64')
url="https://tsduck.io/"
license=('BSD')
depends=('pcsclite' 'srt' 'jdk-openjdk')
makedepends=('git' 'git-lfs' 'cmake' 'zip' 'doxygen' 'dos2unix' 'graphviz')
provides=("tsduck-git=${pkgver}")
conflicts=('tsduck-git' 'tsduck')
source=("git+https://github.com/tsduck/tsduck.git")
sha256sums=('SKIP')

pkgver() {
	git -C "${srcdir}/${_reponame}" describe --tags --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${srcdir}/${_reponame}"
	make NOTEST=1 #NOGITHUB=1
}

package() {
	cd "${srcdir}/${_reponame}"
	make SYSROOT="${pkgdir}" install
	install -D -m644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${_reponame}/LICENSE"

	# If pacman sees a /lib directory in a package, it will detect a conflict 
	# with the symlink on the filesystem. This uses /usr/lib directly.
	mv "${pkgdir}/lib" "${pkgdir}/usr/lib"
	mv "${pkgdir}/usr/lib64"/* "${pkgdir}/usr/lib"
	rm -rf "${pkgdir}/usr/lib64"
}
