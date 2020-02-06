# Maintainer: Versus Void <chaoskeeper somwhere_at m a i l ru>
pkgname=intel-mkl-slim
pkgver_hyphen=2020.0-166
pkgver=${pkgver_hyphen/-/.}
pkgrel=1
pkgdesc="Intel Math Kernel Library (x86_64 shared libraries and headers only)"
arch=(x86_64)
url="https://software.intel.com/en-us/mkl"
license=("custom:ISSL")
optdepends=(
	'intel-tbb: Intel® threading implementation'
	'openmp: Clang OpenMP runtime'
	'gcc-libs: GNU OpenMP runtime'
)
provides=(intel-mkl)
conflicts=(intel-mkl)
replaces=(intel-mkl)
openmp_version=${pkgver_hyphen/2020/19.1}
source=(
	"http://registrationcenter-download.intel.com/akdlm/irc_nas/tec/16318/l_mkl_$pkgver.tgz"
	intel-mkl-slim.conf
)
noextract=("${source[@]##*/}")
sha256sums=('f6d92deb3ff10b11ba3df26b2c62bb4f0f7ae43e21905a91d553e58f0f5a8ae0'
            '90586d84ff1a4273921affe669f9af45ab09b2e97f58483282dd11a194cf9d8a')
install=intel-mkl.install

package() {
	mkdir -p "$pkgdir"/usr/share/licenses/intel-mkl
	echo "Installing license"
	from_main_archive="bsdtar -O -xf $srcdir/l_mkl_$pkgver.tgz l_mkl_$pkgver/rpm"
	$from_main_archive/intel-mkl-common-$pkgver_hyphen-$pkgver_hyphen.noarch.rpm | \
		bsdtar -O -xf - ./opt/intel/compilers_and_libraries_$pkgver/licensing/mkl/en/license.txt \
		> "$pkgdir"/usr/share/licenses/intel-mkl/LICENSE

	echo "Installing headers"
	$from_main_archive/intel-mkl-common-c-$pkgver_hyphen-$pkgver_hyphen.noarch.rpm | \
		bsdtar --strip-components 6 -C "$pkgdir"/usr/ \
		-xf - \
		./opt/intel/compilers_and_libraries_$pkgver/linux/mkl/include

	mkdir -p "$pkgdir"/usr/lib/intel
	echo "Installing libraries"
	$from_main_archive/intel-mkl-core-rt-$pkgver_hyphen-$pkgver_hyphen.x86_64.rpm | \
		bsdtar --strip-components 8 -C "$pkgdir"/usr/lib \
		-xf - \
		./opt/intel/compilers_and_libraries_$pkgver/linux/mkl/lib/intel64_lin
	rm -r "$pkgdir"/usr/lib/locale
	$from_main_archive/intel-mkl-gnu-rt-$pkgver_hyphen-$pkgver_hyphen.x86_64.rpm | \
		bsdtar --strip-components 8 -C "$pkgdir"/usr/lib \
		-xf - \
		./opt/intel/compilers_and_libraries_$pkgver/linux/mkl/lib/intel64_lin
	$from_main_archive/intel-mkl-tbb-rt-$pkgver_hyphen-$pkgver_hyphen.x86_64.rpm | \
		bsdtar --strip-components 8 -C "$pkgdir"/usr/lib \
		-xf - \
		./opt/intel/compilers_and_libraries_$pkgver/linux/mkl/lib/intel64_lin

	$from_main_archive/intel-openmp-$openmp_version-$openmp_version.x86_64.rpm | \
		bsdtar --strip-components 8 -C "$pkgdir"/usr/lib/intel \
		-xf - \
		./opt/intel/compilers_and_libraries_$pkgver/linux/compiler/lib/intel64_lin/libiomp5.so

	install -Dm644 "$srcdir"/intel-mkl-slim.conf "$pkgdir"/etc/ld.so.conf.d/intel-mkl-slim.conf
}
