# Maintainer: Versus Void <chaoskeeper somwhere_at m a i l ru>
pkgname=intel-mkl-slim
pkgver_hyphen=2019.2-187
pkgver=${pkgver_hyphen/-/.}
pkgrel=1
pkgdesc="Intel Math Kernel Library (x86_64 shared libraries and headers only)"
arch=(x86_64)
url="https://software.intel.com/en-us/mkl"
license=("custom:ISSL")
depends=()
makedepends=(cpio)
optdepends=('intel-tbb: Intel® threading implementation')
provides=(intel-mkl)
conflicts=(intel-mkl)
replaces=(intel-mkl)
_url="http://registrationcenter-download.intel.com/akdlm/irc_nas/15095/onlinedata/rpm"
openmp_version=19.0.2-187
source=(
	"$_url/intel-mkl-common-$pkgver_hyphen-$pkgver_hyphen.noarch.rpm"
	"$_url/intel-mkl-common-c-$pkgver_hyphen-$pkgver_hyphen.noarch.rpm"
	"$_url/intel-mkl-core-rt-$pkgver_hyphen-$pkgver_hyphen.x86_64.rpm"
	"$_url/intel-mkl-gnu-rt-$pkgver_hyphen-$pkgver_hyphen.x86_64.rpm"
	"$_url/intel-mkl-tbb-rt-$pkgver_hyphen-$pkgver_hyphen.x86_64.rpm"
	"$_url/intel-openmp-$openmp_version-$openmp_version.x86_64.rpm"
)
noextract=("${source[@]##*/}")
sha256sums=('c44be9800e2f129ffb0fce018df3457ee78df686bf37c7a6632d59ce5c17f6e6'
            '065153f14d81892681bfd743e162ce545209ed624e8a53a85f402935e676eddc'
            'f8a9d89c78a2ea8d698f37fde9532277db054f2c636bfecb2116cc44869494c9'
            '44f30d95905ec7f24d874cd59ad37012d39ba98f9dd858f4424a6eb36cc570c4'
            'c477c1dd925678a3826e8163416c16aa5e0069cd633bec0c36282fba0c30694d'
            'bc0dc99755cd5b122c394f2614e44b307bd2c595979c0e1b35deef1693d1a144')
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

	mkdir -p "$pkgdir"/usr/lib
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

	bsdtar --strip-components 8 -C "$pkgdir"/usr/lib \
		-xf intel-openmp-$openmp_version-$openmp_version.x86_64.rpm \
		./opt/intel/compilers_and_libraries_$pkgver/linux/compiler/lib/intel64_lin/libiomp5.so
}
