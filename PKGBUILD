# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Ista Zahn <istazahn@gmail.com>
## Based on miniconda3 aur package by Ashwin Vishn Immae, Martin Wimpress and Jingbei Li
pkgname=mambaforge
pkgver=24.9.0.0
_pkgver=${pkgver%.*}-${pkgver##*.}
pkgrel=1
pkgdesc="Conda and Mamba package managers configured to use conda-forge"
arch=(x86_64 aarch64 powerpc64le)
url="https://github.com/conda-forge/miniforge"
license=(BSD-3-Clause)
provides=(conda mamba)
source_x86_64=(${url}/releases/download/${_pkgver}/Mambaforge-${_pkgver}-Linux-x86_64.sh)
source_aarch64=(${url}/releases/download/${_pkgver}/Mambaforge-${_pkgver}-Linux-aarch64.sh)
source_powerpc64le=(${url}/releases/download/${_pkgver}/Mambaforge-${_pkgver}-Linux-ppc64le.sh)
options=(!strip libtool staticlibs)
sha256sums_x86_64=('77fb505f6266ffa1b5d59604cf6ba25948627e908928cbff148813957b1c28af')
sha256sums_aarch64=('2d83f58793e9e303746747a683833aec5b9178fb1a313a3f9a56df2d319e23a5')
sha256sums_powerpc64le=('cc083e40b1891611b26b0f63b5df3422cb4f8e1a29204f55caea514ead528eb2')
install="${pkgname}.install"

package() {
	prefix="${pkgdir}/opt/${pkgname}"
	LD_PRELOAD="/usr/lib/libfakeroot/libfakeroot.so"

	# Packaging mambaforge for installation to /opt/mambaforge
	bash "${srcdir}/Mambaforge-${_pkgver}-Linux-${CARCH}.sh" -b -p $prefix -f
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
