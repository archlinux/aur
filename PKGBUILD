# Maintainer: Ondrej Patrovic <ondrej@patrovic.com>

pkgname=paragon-ufsd-tools
pkgver=9.4
pkgrel=1
pkgdesc='Paragon NTFS & HFS+ tools. Requires purchase of Paragon NTFS & HFS+ for Linux Professional.'
arch=('i686' 'x86_64')
url='https://www.paragon-software.com/home/ntfs-linux-professional/'
license=('custom')
optdepends=('paragon-ufsd-dkms-git: NTFS & HFS+ driver with write support')
conflicts=('ntfs-3g' 'ntfsprogs')
makedepends=('tar')

# Download Paragon NTFS & HFS+ for Linux Professional package into the same directory as this PKGBUILD
_basename="Paragon-147-PRE_NTFS_Linux_${pkgver}_Pro"

source=("${_basename}.tar.gz"
				'no-sized-deallocation.patch')

sha256sums=('d025eb4f5e8e9ee07dbd7a7edda5ea34e5cd51b4e6372f9474bbade11365fefc'
						'f8be10d9723844e716416e322817e8efb0aadf8416fe658272ccde4f6b069f24')

build() {
	cd "${srcdir}/${_basename}"

	# Patch to add -fno-sized-deallocation if needed
	patch -Np1 -i "${srcdir}/no-sized-deallocation.patch"

	cd linutil
	make retail_util
}

package() {
	cd "${srcdir}/${_basename}"

	install -dm 755 "${pkgdir}/usr/bin"
	cp -dRT "linutil/objfre/bin/" "${pkgdir}/usr/bin/"

	install -Dm 644 License.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
