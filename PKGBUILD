# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor : Anthony Wang <ta180m@pm.me>
# Contributor : Ashwin Vishnu <ashwinvis+arch At protonmail DoT cOm>
# Contributor : Immae <ismael.bouya@normalesup.org>
# Contributor : Martin Wimpress <code@flexion.org>
# Contributor : Jingbei Li <i@jingbei.li>
pkgname=miniconda3
pkgver=23.10.0
pkgrel=1
pkgdesc="Mini version of Anaconda Python distribution"
arch=(x86_64 aarch64)
url="https://conda.io/en/latest/miniconda"
license=('custom')
provides=('conda')
source_x86_64=(${pkgname}-${pkgver}-x86_64.sh::https://repo.continuum.io/miniconda/Miniconda3-py311_${pkgver}-1-Linux-x86_64.sh)
source_aarch64=(${pkgname}-${pkgver}-aarch64.sh::https://repo.continuum.io/miniconda/Miniconda3-py311_${pkgver}-1-Linux-aarch64.sh)
options=(!strip libtool staticlibs)
sha512sums_x86_64=('91bf4689bf8dc69e56a7779926890ad648c1da50ac8a45dea6e65d1bda472c3727474125b087c73b1193da244d79bb29d934199e8c5114e3662f809c4cca6b47')
sha512sums_aarch64=('e8e1ec87840018ebe8ef364cfde63d9264d4ce5d2f99e8971bec762dd840b4a6bb848acbe52b9decdde03f936b9bc490663cfb2409542103a3b09b2c6918a410')
install="${pkgname}.install"

package() {
	prefix="${pkgdir}"/opt/"${pkgname}"
	LD_PRELOAD="/usr/lib/libfakeroot/libfakeroot.so"

	# Packaging miniconda3 for installation to /opt/miniconda3
	bash "${srcdir}/${pkgname}-${pkgver}-${CARCH}.sh" -b -p ${prefix} -f
	[ "$BREAK_EARLY" = 1 ] && exit 1
	cd "${prefix}"

	# Correcting permissions
	chmod a+r -R pkgs

	# Stripping $pkgdir
	sed -e "s|${pkgdir}||g" -i $(grep "${pkgdir}" . -rIl 2>/dev/null)

	# Installing license
	install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
