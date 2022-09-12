# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Ista Zahn <istazahn@gmail.com>
## Based on miniconda3 aur package by Ashwin Vishn Immae, Martin Wimpress and Jingbei Li
pkgname=mambaforge
_pkgrel=0
pkgver=4.14.0.${_pkgrel}
pkgrel=1
pkgdesc="Conda and Mamba package managers configured to use conda-forge"
arch=('x86_64')
url="https://github.com/conda-forge/miniforge"
license=('custom:BSD-3-clause')
provides=('conda' 'mamba')
source=("${pkgname}-${pkgver::-2}-${_pkgrel}.sh::${url}/releases/download/${pkgver::-2}-${_pkgrel}/Mambaforge-${pkgver::-2}-${_pkgrel}-Linux-x86_64.sh")
options=(!strip libtool staticlibs)
sha512sums=('11bd4aed939f90598715ee71b695b7ab9a8eaed308645d3285e73c9f4f869cec997ed303d7c9485732f15d3d8c4f25a0b1868252e751fd2d8a068f0c5fd8cec1')
install="${pkgname}.install"

package() {
	prefix="${pkgdir}/opt/${pkgname}"
	LD_PRELOAD="/usr/lib/libfakeroot/libfakeroot.so"

	# Packaging mambaforge for installation to /opt/mambaforge
	bash "${srcdir}/${pkgname}-${pkgver::-2}-${_pkgrel}.sh" -b -p $prefix -f
	[ "$BREAK_EARLY" = 1 ] && exit 1
	cd "${prefix}"

	# Correcting permissions
	chmod a+r -R pkgs

	# Stripping $pkgdir
	sed "s|${pkgdir}||g" -i $(grep "$pkgdir" . -rIl)

	# Installing license
	install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
