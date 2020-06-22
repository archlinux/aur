# Maintainer : Ashwin Vishnu <ashwinvis+arch At protonmail DoT cOm>
# Contributor : Immae <ismael.bouya@normalesup.org>
# Contributor : Martin Wimpress <code@flexion.org>
# Contributor : Jingbei Li <i@jingbei.li>
pkgname=miniconda3
pkgver=4.8.3
pkgrel=2
pkgdesc="Mini version of Anaconda Python distribution."
arch=('x86_64')
url="https://conda.io/en/latest/miniconda.html"
license=("custom")
source=("miniconda3-${pkgver}.sh::https://repo.continuum.io/miniconda/Miniconda3-py38_${pkgver}-Linux-x86_64.sh"
        "$pkgname.install")
options=(!strip libtool staticlibs)
sha256sums=('879457af6a0bf5b34b48c12de31d4df0ee2f06a8e68768e5758c3293b2daf688'
            '6d6d8b5f4d2e9ca3c69464e903e292fa020c10ea6920aff5c32ebb021b84d865')
install="$pkgname.install"


package() {
	prefix="${pkgdir}/opt/${pkgname}"
	LD_PRELOAD="/usr/lib/libfakeroot/libfakeroot.so"

	msg2 "Packaging ${pkgname} for installation to /opt/${pkgname}"
	bash "${srcdir}/miniconda3-${pkgver}.sh" -b -p $prefix -f
	[ "$BREAK_EARLY" = 1 ] && exit 1
	cd "${prefix}"

	msg2 "Correcting permissions"
	chmod a+r -R pkgs

	msg2 "Stripping \$pkgdir"
	sed "s|${pkgdir}||g" -i $(grep "$pkgdir" . -rIl)

	msg2 "Installing license"
	install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
