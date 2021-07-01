# Maintainer : Ista Zahn <istazahn@gmail.com>
## Based on miniconda3 aur package by Ashwin Vishn Immae, Martin Wimpress and Jingbei Li
pkgname=mambaforge
pkgver=4.10.2
pkgrel=1
pkgdesc="Conda and Mamba package managers configured to use conda-forge."
arch=('x86_64')
url="https://github.com/conda-forge/miniforge"
license=("BSD-3-Clause")
source=("Mambaforge-${pkgver}.sh::https://github.com/conda-forge/miniforge/releases/download/${pkgver}-0/Mambaforge-${pkgver}-0-Linux-x86_64.sh"
        "$pkgname.install")
options=(!strip libtool staticlibs)
sha256sums=('1e89ee86afa06e23b2478579be16a33fff6cff346314f6a6382fd20b1f83e669'
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
