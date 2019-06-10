# Maintainer: Versus Void <chaoskeeper somwhere_at m a i l ru>
pkgname=intel-mkl-slim
pkgver_hyphen=2019.4-243
pkgver=${pkgver_hyphen/-/.}
pkgrel=3
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
_url="http://registrationcenter-download.intel.com/akdlm/irc_nas/15540/onlinedata/rpm"
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
sha256sums=('8558a841419e4ce6b8cc6a0eb7b748019fa411fc2796872628796c88f7b7519d'
            'f159279b4f2dc945781e937466621d2768d85c1c4d99d2a481501cbd8106d864'
            'db4b6f14a3097d4026191bb2936b33a807cc2d66b996de57be3a8a9e135671cf'
            '865a94d170860d976507b2d48a6781672f9f4c046b9923729132ab7ce1d19d7f'
            '8ab7be6454e821cf9d3d37e7953bf717152e15cc32e8716cd7cede993121d7c3'
            '3cbd775296c3d7bb3d04a7c69e091b95680a8f6a5872ea67ecdd82b47e487c6a'
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
