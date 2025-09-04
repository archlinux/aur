# Maintainer: Alastair Feille <me@alastair.se>
# Submitter: Alastair Feille <me@alastair.se>

pkgname=ack-git
pkgver=dev.r0.g6a55a6f81
pkgrel=3
pkgdesc="The Amsterdam Compiler Kit"
arch=('i686' 'x86_64')
url="http://tack.sourceforge.net/"
license=('BSD')
depends=('glibc')
makedepends=('git' 'flex' 'bison' 'ed' 'lua' 'python')
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

	make -r CFLAGS='-DUNREACHABLE_CODE="__builtin_unreachable()" -DNORETURN="__attribute__((noreturn))"' \
		DEFAULT_PLATFORM="linux386" ACK_TEMP_DIR="${srcdir}" PREFIX=/usr V=1 VERBOSE=1
}

package(){
    cd "${pkgdir}"
    mkdir usr

	cd "${srcdir}/${_gitrepo}"

	make -r CFLAGS='-DUNREACHABLE_CODE="__builtin_unreachable()" -DNORETURN="__attribute__((noreturn))"' \
		PREFIX="${pkgdir}"/usr ACK_TEMP_DIR="${srcdir}" install

	install -D -m0644 "${srcdir}/${_gitrepo}"/Copyright "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

