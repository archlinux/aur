# Maintainer: Carlos Aznarán <caznaranl@uni.pe>
# Contributor : Anthony Wang <ta180m@pm.me>
# Contributor : Ashwin Vishnu <ashwinvis+arch At protonmail DoT cOm>
# Contributor : Immae <ismael.bouya@normalesup.org>
# Contributor : Martin Wimpress <code@flexion.org>
# Contributor : Jingbei Li <i@jingbei.li>
pkgname=miniconda3
pkgver=22.11.1
pkgrel=1
pkgdesc="Mini version of Anaconda Python distribution"
arch=(x86_64)
url="https://conda.io/en/latest/miniconda"
license=('custom')
provides=('conda')
source=(${pkgname}-${pkgver}.sh::https://repo.continuum.io/miniconda/Miniconda3-py310_${pkgver}-1-Linux-x86_64.sh)
options=(!strip libtool staticlibs)
sha512sums=('df8450b5fffcb354d2d7057f76d2686d7c893f72414df69472a6ee461500a9906d4ba0bb215cc2df5a67579f582f5cbbf00c8e80f9ad66ea285607289e1bd80e')
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
