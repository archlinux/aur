# Maintainer: Alastair Feille <me@alastair.se>
# Submitter: Alastair Feille <me@alastair.se>

pkgname=ack-git
pkgver=dev.r0.gd43c7bd00
pkgrel=3
pkgdesc="The Amsterdam Compiler Kit"
arch=('i686' 'x86_64')
url="http://tack.sourceforge.net/"
license=('BSD')
depends=('glibc')
makedepends=('git' 'flex' 'bison' 'ed' 'lua')
source=("git+https://github.com/davidgiven/ack"
        'ack-cpm-aslod.patch'
        )
md5sums=('SKIP'
         'def54bc99c19c95bbfa134ef4d3be9cf')

_gitrepo=${pkgname%-git}

pkgver() {
  cd "${_gitrepo}"
  ( set -o pipefail
    git describe --tags --long | sed 's/^foo-//;s/\([^-]*-g\)/r\1/;s/-/./g' | sed 's/release.//g' | sed 's/.pre./pre/g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
	cd "${srcdir}/${_gitrepo}"
	patch -Np1 < "$srcdir/ack-cpm-aslod.patch"
}

build() {
	cd "${srcdir}/${_gitrepo}"

	make -r CFLAGS="" DEFAULT_PLATFORM="linux386" ACK_TEMP_DIR="${srcdir}" PREFIX=/usr
}

package(){
    cd "${pkgdir}"
    mkdir usr

	cd "${srcdir}/${_gitrepo}"

	make -r PREFIX="${pkgdir}"/usr ACK_TEMP_DIR="${srcdir}" install

	install -D -m0644 "${srcdir}/${_gitrepo}"/Copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

