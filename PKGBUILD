# Maintainer: Versus Void <chaoskeeper somwhere_at m a i l ru>
pkgname=intel-mkl-slim
pkgver_hyphen=2019.5-281
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
_url="http://registrationcenter-download.intel.com/akdlm/irc_nas/15816/onlinedata/rpm"
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
sha256sums=('323abb51162c0159f29bc139e9a6e8eb57674b550047ed37fbe73bb72432e188'
            '61e36100a9856dfe3a3266a4dbcddf89ea635d3bfc48c85c2e597f1380f70f49'
            '230c038d4bbe8d7660bd60a245134e80f13fab101faae62624c3d60d8aa8c482'
            '4c62e48d188cfba87edf13fd71150f57ecdd22377fb166962c97732d77d33195'
            '9431e77dfadfda1b6535ce45481d7b7d3db2f0de7053aacf666c16362c6fba54'
            'b8ac1a850664d4e780312a569efe410c5d82b3a2bb8d7e33ff4ba48ad5078504'
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
