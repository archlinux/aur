# Maintainer : Ista Zahn <istazahn@gmail.com>
## Based on miniconda3 aur package by Ashwin Vishn Immae, Martin Wimpress and Jingbei Li
pkgname=mambaforge
pkgver=4.10.1
pkgrel=1
pkgdesc="Conda and Mamba package managers configured to use conda-forge."
arch=('x86_64')
url="https://github.com/conda-forge/miniforge"
license=("BSD-3-Clause")
source=("Mambaforge-${pkgver}.sh::https://github.com/conda-forge/miniforge/releases/download/${pkgver}-0/Mambaforge-${pkgver}-0-Linux-x86_64.sh"
        "$pkgname.install")
options=(!strip libtool staticlibs)
sha256sums=('d4065b376f81b83cfef0c7316f97bb83337e4ae27eb988828363a578226e3a62'
            '1df814280df859c40cd7dd1f7ff2552ca72dfbf9cde083f52e55c557b93d8977')
install="$pkgname.install"

package() {
	prefix="${pkgdir}/opt/${pkgname}"
	LD_PRELOAD="/usr/lib/libfakeroot/libfakeroot.so"

	msg2 "Packaging ${pkgname} for installation to /opt/${pkgname}"
	bash "${srcdir}/Mambaforge-${pkgver}.sh" -b -p $prefix -f
	[ "$BREAK_EARLY" = 1 ] && exit 1
	cd "${prefix}"

	msg2 "Correcting permissions"
	chmod a+r -R pkgs

	msg2 "Stripping \$pkgdir"
	sed "s|${pkgdir}||g" -i $(grep "$pkgdir" . -rIl)

	msg2 "Installing license"
	install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
