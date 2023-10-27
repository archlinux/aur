# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor : Anthony Wang <ta180m@pm.me>
# Contributor : Ashwin Vishnu <ashwinvis+arch At protonmail DoT cOm>
# Contributor : Immae <ismael.bouya@normalesup.org>
# Contributor : Martin Wimpress <code@flexion.org>
# Contributor : Jingbei Li <i@jingbei.li>
pkgname=miniconda3
pkgver=23.9.0
pkgrel=1
pkgdesc="Mini version of Anaconda Python distribution"
arch=(x86_64)
url="https://conda.io/en/latest/miniconda"
license=('custom')
provides=('conda')
source=(${pkgname}-${pkgver}.sh::https://repo.continuum.io/miniconda/Miniconda3-py311_${pkgver}-0-Linux-x86_64.sh)
options=(!strip libtool staticlibs)
sha512sums=('3fdbd7430679454674dec5c4f975b756ad796bf33e594755d0d6106acc53615ba0b2735b13565937c164bd9d75c12500f65ffeb9b1a9ea5304fad0dffb72c0d6')
install="${pkgname}.install"

package() {
	prefix="${pkgdir}"/opt/"${pkgname}"
	LD_PRELOAD="/usr/lib/libfakeroot/libfakeroot.so"

	# Packaging miniconda3 for installation to /opt/miniconda3
	bash "${srcdir}/${pkgname}-${pkgver}.sh" -b -p ${prefix} -f
	[ "$BREAK_EARLY" = 1 ] && exit 1
	cd "${prefix}"

	# Correcting permissions
	chmod a+r -R pkgs

	# Stripping $pkgdir
	sed -e "s|${pkgdir}||g" -i $(grep "${pkgdir}" . -rIl 2>/dev/null)

	# Installing license
	install -Dm 644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
