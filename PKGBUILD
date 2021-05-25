# Maintainer : Ashwin Vishnu <ashwinvis+arch At protonmail DoT cOm>
# Contributor : Immae <ismael.bouya@normalesup.org>
# Contributor : Martin Wimpress <code@flexion.org>
# Contributor : Jingbei Li <i@jingbei.li>
pkgname=miniconda3
pkgver=4.9.2
pkgrel=2
pkgdesc="Mini version of Anaconda Python distribution."
arch=('x86_64')
url="https://conda.io/en/latest/miniconda.html"
license=("custom")
source=("miniconda3-${pkgver}.sh::https://repo.continuum.io/miniconda/Miniconda3-py39_${pkgver}-Linux-x86_64.sh"
        "$pkgname.install")
options=(!strip libtool staticlibs)
sha256sums=('536817d1b14cb1ada88900f5be51ce0a5e042bae178b5550e62f61e223deae7c'
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
