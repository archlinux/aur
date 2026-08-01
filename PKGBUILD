# Maintainer: gilcu3
# Previous Maintainer: KUMAX <kumax2048@pm.me>
# Contributor: KUMAX

_pkgbase=yafu
pkgname=yafu-git
pkgrel=1
pkgver=r950.63df210
pkgdesc="Automated integer factorization."
url=https://github.com/bbuhrow/yafu
license=('custom:unknown')
arch=('x86_64')
conflicts=(${_pkgbase})
provides=('yafu')
makedepends=('git')
depends=('gmp' 'gmp-ecm')
optdepends=('ggnfs: NFS factorization for large numbers')
# upstream bundles ytools, ysieve and msieve, so no extra sources are needed
source=("git+https://github.com/bbuhrow/yafu.git")
sha256sums=('SKIP')

prepare() {
	cd "${srcdir}/yafu"
	cp Makefile.gcc Makefile
}

pkgver() {
	cd "${_pkgbase}"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	# yafu compiles its bundled ytools/ysieve/msieve sources itself, so the
	# include paths must point at the bundled copies
	cd "${srcdir}/yafu"
	make yafu CC=gcc NFS=1 CFLAGS="$CFLAGS -g -std=c11 -DUSE_SSE2 -fno-common -DUSE_NFS -O2 -fomit-frame-pointer -Wall  -I. -Iinclude -Itop/aprcl -Itop/cmdParser -Itop/ -Ims_include/ -Ifactor/gmp-ecm   -Iytools -Iysieve -Wno-error=implicit-function-declaration -Wno-error=incompatible-pointer-types -Wno-error=return-mismatch -Wno-error=int-conversion -DVBITS=64 -Iaprcl -Ignfs/poly/stage1 -Ignfs/poly"
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
}
