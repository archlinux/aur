# Maintainer: Alastair Feille <me@alastair.se>
# Submitter: Alastair Feille <me@alastair.se>

pkgname=ack-git
pkgver=6.0pre5.r9.gd0bfee1
pkgrel=1
pkgdesc="The Amsterdam Compiler Kit"
arch=('i686' 'x86_64')
url="http://tack.sourceforge.net/"
license=('BSD')
depends=('glibc')
makedepends=('git' 'flex' 'bison' 'ed')
source=("git+https://github.com/davidgiven/ack")
md5sums=('SKIP')

_gitrepo=${pkgname%-git}

pkgver() {
  cd "${_gitrepo}"
  ( set -o pipefail
    git describe --tags --long | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/release.//g' | sed 's/.pre./pre/g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
	cd "${srcdir}/${_gitrepo}"

	make DEFAULT_PLATFORM="linux386" ACK_TEMP_DIR="${srcdir}"
}

package(){
    cd "${pkgdir}"
    mkdir usr

	cd "${srcdir}/${_gitrepo}"

	make PREFIX="${pkgdir}"/usr ACK_TEMP_DIR="${srcdir}" install

	install -D -m0644 "${srcdir}/${_gitrepo}"/Copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

