# Maintainer : Anthony Wang <ta180m@pm.me>
# Contributor : Ashwin Vishnu <ashwinvis+arch At protonmail DoT cOm>
# Contributor : Immae <ismael.bouya@normalesup.org>
# Contributor : Martin Wimpress <code@flexion.org>
# Contributor : Jingbei Li <i@jingbei.li>
pkgname=miniconda3
pkgver=4.10.3
pkgrel=1
pkgdesc="Mini version of Anaconda Python distribution."
arch=('x86_64')
url="https://conda.io/en/latest/miniconda.html"
license=("custom")
source=("miniconda3-${pkgver}.sh::https://repo.continuum.io/miniconda/Miniconda3-py39_${pkgver}-Linux-x86_64.sh"
        "$pkgname.install")
options=(!strip libtool staticlibs)
sha256sums=('1ea2f885b4dbc3098662845560bc64271eb17085387a70c2ba3f29fff6f8d52f'
            '6d6d8b5f4d2e9ca3c69464e903e292fa020c10ea6920aff5c32ebb021b84d865')
install="$pkgname.install"


package() {
	prefix="${pkgdir}/opt/${pkgname}"
	LD_PRELOAD="/usr/lib/libfakeroot/libfakeroot.so"

	# Packaging miniconda3 for installation to /opt/miniconda3
	bash "${srcdir}/miniconda3-${pkgver}.sh" -b -p $prefix -f
	[ "$BREAK_EARLY" = 1 ] && exit 1
	cd "${prefix}"

	# Correcting permissions
	chmod a+r -R pkgs

	# Stripping $pkgdir
	sed "s|${pkgdir}||g" -i $(grep "$pkgdir" . -rIl)

	# Installing license
	install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
