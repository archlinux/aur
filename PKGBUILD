# Maintainer: Hoang Nguyen <toi at doclai dot com>

_pkgname=libzim
pkgname=$(echo "${_pkgname}8")
pkgver=8.2.1
pkgrel=1
pkgdesc="Reference implementation of the ZIM specification by the openZIM project."
_testing_suite_commit=31ffbefd6699384d80e1f584b69b4321c843bc0c 
arch=('x86_64')
license=('GPL2')
depends=('xapian-core' 'zlib' 'xz' 'icu' 'zstd')
makedepends=('meson' 'gtest' 'git')
url='https://github.com/openzim/libzim'
source=("${_pkgname}-${pkgver}.tar.gz::${url}/archive/${pkgver}.tar.gz"
        "git+https://github.com/openzim/zim-testing-suite#commit=${_testing_suite_commit}")
sha256sums=('b8296644b04b02c04d2ff1458fed829df39b54e8fd1bcd23c10440e160819f13'
            'SKIP')


build() {
	cd "${_pkgname}-${pkgver}"
	# https://github.com/openzim/libzim/issues/757
	arch-meson build \
		-Dtest_data_dir="${srcdir}/zim-testing-suite/data" \
		-Dcpp_std=c++14
	ninja -C build
}

check() {
	cd "${_pkgname}-${pkgver}/build"
	SKIP_BIG_MEMORY_TEST=1 meson test
}

package() {
	install -Dm644 "${_pkgname}-${pkgver}/COPYING" "$pkgdir/usr/share/licenses/$_pkgname/COPYING"
	cd "${_pkgname}-${pkgver}/build"
	DESTDIR="${pkgdir}" ninja install
	cd ${pkgdir}
	rm -r "$pkgdir/usr/share"
	rm -r "$pkgdir/usr/include"
	rm -r "$pkgdir/usr/lib/libzim.so"
	rm -r "$pkgdir/usr/lib/pkgconfig"
}

