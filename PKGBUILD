# Maintainer: Versus Void <chaoskeeper somwhere_at m a i l ru>
pkgname=intel-mkl-slim
pkgver_hyphen=2019.3-199
pkgver=${pkgver_hyphen/-/.}
pkgrel=2
pkgdesc="Intel Math Kernel Library (x86_64 shared libraries and headers only)"
arch=(x86_64)
url="https://software.intel.com/en-us/mkl"
license=("custom:ISSL")
optdepends=(
	'intel-tbb: Intel® threading implementation'
	'openmp: Clang OpenMP runtime'
	'gcc-lib: GNU OpenMP runtime'
)
provides=(intel-mkl)
conflicts=(intel-mkl)
replaces=(intel-mkl)
_url="http://registrationcenter-download.intel.com/akdlm/irc_nas/15275/onlinedata/rpm"
openmp_version=${pkgver_hyphen/2019/19.0}
source=(
	"$_url/intel-mkl-common-$pkgver_hyphen-$pkgver_hyphen.noarch.rpm"
	"$_url/intel-mkl-common-c-$pkgver_hyphen-$pkgver_hyphen.noarch.rpm"
	"$_url/intel-mkl-core-rt-$pkgver_hyphen-$pkgver_hyphen.x86_64.rpm"
	"$_url/intel-mkl-gnu-rt-$pkgver_hyphen-$pkgver_hyphen.x86_64.rpm"
	"$_url/intel-mkl-tbb-rt-$pkgver_hyphen-$pkgver_hyphen.x86_64.rpm"
	"$_url/intel-openmp-$openmp_version-$openmp_version.x86_64.rpm"
	intel-mkl-slim.conf
)
noextract=("${source[@]##*/}")
sha256sums=('af61ba2e8bd22f15bca3442cabf5c53075aa5fa0f48b8b73ad2fcf62cfe5cf73'
            'c7f4653eec66660e47b28d5b7d7cf2f62fa753ce3406cfead84f14c60e24817b'
            '7ee93ba52bd90f82f16f515bb9e3561fd92765857307b74e38eff26d8988209d'
            '951abd23243034f26d60b9095552fdcae4b8493bb37f39bd54e79f25712729b3'
            'ac1bf128de66c4a37b62df8828ea6f252da72027f58e3962338a6bbfdad93a43'
            'a31d8ed5edb0083f4a78dd202df0635412884afd5edfcb8640d30e8d0679a094'
            '90586d84ff1a4273921affe669f9af45ab09b2e97f58483282dd11a194cf9d8a')
install=intel-mkl.install

package() {
	mkdir -p "$pkgdir"/usr/share/licenses/intel-mkl
	echo "Installing license"
	bsdtar -O -xf "$srcdir"/intel-mkl-common-$pkgver_hyphen-$pkgver_hyphen.noarch.rpm \
		./opt/intel/compilers_and_libraries_$pkgver/licensing/mkl/en/license.txt > "$pkgdir"/usr/share/licenses/intel-mkl/LICENSE

	echo "Installing headers"
	bsdtar --strip-components 6 -C "$pkgdir"/usr/ \
		-xf intel-mkl-common-c-$pkgver_hyphen-$pkgver_hyphen.noarch.rpm \
		./opt/intel/compilers_and_libraries_$pkgver/linux/mkl/include

	mkdir -p "$pkgdir"/usr/lib/intel
	echo "Installing libraries"
	bsdtar --strip-components 8 -C "$pkgdir"/usr/lib \
		-xf intel-mkl-core-rt-$pkgver_hyphen-$pkgver_hyphen.x86_64.rpm \
		./opt/intel/compilers_and_libraries_$pkgver/linux/mkl/lib/intel64_lin
	rm -r "$pkgdir"/usr/lib/locale
	bsdtar --strip-components 8 -C "$pkgdir"/usr/lib \
		-xf intel-mkl-gnu-rt-$pkgver_hyphen-$pkgver_hyphen.x86_64.rpm \
		./opt/intel/compilers_and_libraries_$pkgver/linux/mkl/lib/intel64_lin
	bsdtar --strip-components 8 -C "$pkgdir"/usr/lib \
		-xf intel-mkl-tbb-rt-$pkgver_hyphen-$pkgver_hyphen.x86_64.rpm \
		./opt/intel/compilers_and_libraries_$pkgver/linux/mkl/lib/intel64_lin

	bsdtar --strip-components 8 -C "$pkgdir"/usr/lib/intel \
		-xf intel-openmp-$openmp_version-$openmp_version.x86_64.rpm \
		./opt/intel/compilers_and_libraries_$pkgver/linux/compiler/lib/intel64_lin/libiomp5.so

	install -Dm644 "$srcdir"/intel-mkl-slim.conf "$pkgdir"/etc/ld.so.conf.d/intel-mkl-slim.conf
}
