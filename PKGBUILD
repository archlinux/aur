# Maintainer: lantw44 (at) gmail (dot) com

pkgname=guile-git-lib
_pkgname=guile-git
pkgver=0.5.2
pkgrel=2
pkgdesc='Guile bindings for libgit2'
arch=('x86_64' 'i686' 'armv7h')
url="https://gitlab.com/guile-git/guile-git"
license=('GPL3')
depends=('guile' 'guile-bytestructures' 'libgit2>=0.28.0')
makedepends=('git')
source=(
	"${pkgname}-${pkgver}.tar.gz::https://gitlab.com/${_pkgname}/${_pkgname}/uploads/6450f3991aa524484038cdcea3fb248d/${_pkgname}-${pkgver}.tar.gz"
	"${pkgname}-merge-31-fix-clone-tests.patch"
	"${pkgname}-merge-32-libgit2-1.2.0.patch")
sha256sums=(
	'949755a211ad6e905ecdebe66ca35bfaab638d985b9fadc928ad2538d8f5cc95'
	'15633944c4177fe5f79b97124d3b2c35739ecbe4246305fc2f8271be95b6e3c9'
	'f353c23e2dae27a715d9dae04bfd269c9262e221082b959e0721e2c4471a7eeb')

prepare() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	local source_file
	for source_file in "${source[@]}"; do
		case "${source_file}" in
			*.patch)
				patch -p1 < "${srcdir}/${source_file}"
				;;
		esac
	done
}

build() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	autoreconf -fi
	./configure --prefix=/usr
	make
}

check() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make check
}

package() {
	cd "${srcdir}/${_pkgname}-${pkgver}"
	make DESTDIR="${pkgdir}" install
}
