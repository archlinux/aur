# Maintainer: gilcu3
# Previous Maintainer: KUMAX <kumax2048@pm.me>
# Contributor: KUMAX

_pkgbase=yafu
pkgname=yafu-git
pkgrel=1
pkgver=r981.963dbe9
pkgdesc="Automated integer factorization."
url=https://github.com/bbuhrow/yafu
license=('GPL-3.0-or-later' 'LGPL-3.0-or-later' 'MIT')
arch=('x86_64')
conflicts=(${_pkgbase})
provides=('yafu')
makedepends=('git')
depends=('gmp' 'gmp-ecm')
optdepends=('ggnfs: NFS factorization for large numbers')
# upstream bundles ytools, ysieve and msieve, so no extra sources are needed
source=("git+https://github.com/bbuhrow/yafu.git")
sha256sums=('SKIP')

pkgver() {
	cd "${_pkgbase}"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	# upstream ships a unified Makefile that auto-detects GMP and GMP-ECM.
	# CUDA_PREFIX= disables the CUDA toolkit auto-detection so the build does
	# not depend on whatever happens to be installed on the build host.
	# USER_CFLAGS/USER_LDFLAGS are appended after the Makefile's own flags.
	cd "${srcdir}/yafu"
	make yafu CC=gcc ECM=1 CUDA_PREFIX= \
		USER_CFLAGS="$CFLAGS -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types -Wno-error=return-mismatch -Wno-error=int-conversion" \
		USER_LDFLAGS="$LDFLAGS"
}

check() {
	cd "${srcdir}/yafu"
	echo "factor(1234567891234567891)" | ./yafu | \
		grep -qF '1234567891234567891=31*241*1019*162166841159'
}

package() {
	cd "${srcdir}/yafu"
	install -Dm755 yafu "${pkgdir}/usr/bin/yafu"
	install -Dm644 yafu.ini -t "${pkgdir}/etc/yafu"
	install -Dm644 README.md -t "${pkgdir}/usr/share/doc/yafu"
	install -Dm644 CHANGES -t "${pkgdir}/usr/share/doc/yafu"
	install -Dm644 docfile.txt -t "${pkgdir}/usr/share/doc/yafu"
	# ytools and ysieve share an identical MIT license file
	install -Dm644 ytools/LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.MIT"
}
