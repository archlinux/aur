# Maintainer: Alastair Feille <me@alastair.se>
# Submitter: Alastair Feille <me@alastair.se>

pkgname=pcc-libs-git
pkgver=1.1.0
pkgrel=1
pkgdesc="Libraries for the Portable C Compiler"
arch=('i686' 'x86_64')
url="http://pcc.ludd.ltu.se/"
license=('BSD')
makedepends=('git')
conflicts=('pcc-libs')
provides=('pcc-libs')
source=("git://github.com/mutoso/pcc-libs")
md5sums=('SKIP')

_gitrepo=${pkgname%-git}

pkgver() {
  cd "${_gitrepo}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
	cd "${srcdir}/${_gitrepo}"

	./configure \
		--prefix=/usr

	make
}

package(){
	cd "${srcdir}/${_gitrepo}"

	make DESTDIR="${pkgdir}" install

	install -D -m0644 "${srcdir}/${_gitrepo}"/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
