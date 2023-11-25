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
arch=(x86_64)
url="https://conda.io/en/latest/miniconda"
license=('custom')
provides=('conda')
source=(${pkgname}-${pkgver}.sh::https://repo.continuum.io/miniconda/Miniconda3-py311_${pkgver}-1-Linux-x86_64.sh)
options=(!strip libtool staticlibs)
sha512sums=('91bf4689bf8dc69e56a7779926890ad648c1da50ac8a45dea6e65d1bda472c3727474125b087c73b1193da244d79bb29d934199e8c5114e3662f809c4cca6b47')
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
