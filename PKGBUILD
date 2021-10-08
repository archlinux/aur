# Maintainer: fenrig <fenrig.linux at outlook.com>
pkgname=libsahtrace-git
pkgver=1.7.3.r0.g9c5b628
pkgrel=1
pkgdesc="Small and flexible library to enable tracing and logging"
arch=("x86_64" "i686" "i486" "pentium4" "arm" "armv6h" "armv7h" "aarch64")
url="https://gitlab.com/soft.at.home/logging/libsahtrace.git"
license=('custom:sah')

depends=(
)
makedepends=(
	'm4'
	'git'
)
provides=(
	'libsahtrace'
)
conflicts=(
	'libsahtrace'
)

gitbranch="main"

source=("${pkgname}::git+https://gitlab.com/soft.at.home/logging/libsahtrace.git#branch=${gitbranch}")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	# STAGINGDIR
	export STAGINGDIR=$(pwd)
	# Disable some warnings
	export CFLAGS="${CFLAGS} -Wstringop-overflow=0 -Wno-stringop-truncation"
	cd "${pkgname}"
	make clean
	make
}

package() {
	cd "${pkgname}"
	make D="${pkgdir}/" install
	mkdir ${pkgdir}/usr/lib/
	mv ${pkgdir}/lib/libsahtrace* ${pkgdir}/usr/lib/
	rm -Rf ${pkgdir}/lib/
	install -D LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
