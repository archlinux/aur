# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Ista Zahn <istazahn@gmail.com>
## Based on miniconda3 aur package by Ashwin Vishn Immae, Martin Wimpress and Jingbei Li
pkgname=mambaforge
_pkgrel=0
pkgver=23.1.0.${_pkgrel}
pkgrel=2
pkgdesc="Conda and Mamba package managers configured to use conda-forge"
arch=('x86_64')
url="https://github.com/conda-forge/miniforge"
license=('custom:BSD-3-clause')
provides=('conda' 'mamba')
source=("${pkgname}-${pkgver::-2}-${_pkgrel}.sh::${url}/releases/download/${pkgver::-2}-${_pkgrel}/Mambaforge-${pkgver::-2}-${_pkgrel}-Linux-x86_64.sh")
options=(!strip libtool staticlibs)
sha256sums=('0598ec82e02233e0e242b12129349416225dd07c2318f0ec1cfce4d7d9c397d8')
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

	# Set string path to a certificate SSL connection
	echo "ssl_verify: /opt/${pkgname}/ssl/cacert.pem" >>"${pkgdir}/opt/${pkgname}/.condarc"

	# Installing license
	install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
