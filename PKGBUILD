# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Ista Zahn <istazahn@gmail.com>
## Based on miniconda3 aur package by Ashwin Vishn Immae, Martin Wimpress and Jingbei Li
pkgname=mambaforge
_pkgrel=3
pkgver=23.1.0.${_pkgrel}
pkgrel=1
pkgdesc="Conda and Mamba package managers configured to use conda-forge"
arch=('x86_64' 'aarch64')
url="https://github.com/conda-forge/miniforge"
license=('custom:BSD-3-clause')
provides=('conda' 'mamba')
source_x86_64=("${pkgname}-${pkgver::-2}-${_pkgrel}-x86_64.sh::${url}/releases/download/${pkgver::-2}-${_pkgrel}/Mambaforge-${pkgver::-2}-${_pkgrel}-Linux-x86_64.sh")
source_aarch64=("${pkgname}-${pkgver::-2}-${_pkgrel}-aarch64.sh::${url}/releases/download/${pkgver::-2}-${_pkgrel}/Mambaforge-${pkgver::-2}-${_pkgrel}-Linux-aarch64.sh")
options=(!strip libtool staticlibs)
sha256sums_x86_64=('7a6a07de6063245163a87972fb15be3a226045166eb7ee526344f82da1f3b694')
sha256sums_aarch64=('b7038f4f4d972fa2589dd9edd014940b94600589f924cc6d35a9b11d37506c25')
install="${pkgname}.install"

package() {
	prefix="${pkgdir}/opt/${pkgname}"
	LD_PRELOAD="/usr/lib/libfakeroot/libfakeroot.so"

	# Packaging mambaforge for installation to /opt/mambaforge
	bash "${srcdir}/${pkgname}-${pkgver::-2}-${_pkgrel}-${CARCH}.sh" -b -p $prefix -f
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
