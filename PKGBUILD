# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor: Ista Zahn <istazahn@gmail.com>
## Based on miniconda3 aur package by Ashwin Vishn Immae, Martin Wimpress and Jingbei Li
pkgname=mambaforge
_pkgrel=1
pkgver=23.3.1.${_pkgrel}
pkgrel=1
pkgdesc="Conda and Mamba package managers configured to use conda-forge"
arch=('x86_64' 'aarch64')
url="https://github.com/conda-forge/miniforge"
license=('custom:BSD-3-clause')
provides=('conda' 'mamba')
source_x86_64=("${pkgname}-${pkgver::-2}-${_pkgrel}-x86_64.sh::${url}/releases/download/${pkgver::-2}-${_pkgrel}/Mambaforge-${pkgver::-2}-${_pkgrel}-Linux-x86_64.sh")
source_aarch64=("${pkgname}-${pkgver::-2}-${_pkgrel}-aarch64.sh::${url}/releases/download/${pkgver::-2}-${_pkgrel}/Mambaforge-${pkgver::-2}-${_pkgrel}-Linux-aarch64.sh")
options=(!strip libtool staticlibs)
sha256sums_x86_64=('dbe92c011a1315b9626e2f93a165892f4b89177145bc350b3859a483a3642a24')
sha256sums_aarch64=('32dcc92b4f0b0108ac0734721fb65172395f6c39ecdcaf5bf63edc01f0932020')
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
