# Maintainer : Ashwin Vishnu <ashwinvis+arch At protonmail DoT cOm>
# Contributor : Immae <ismael.bouya@normalesup.org>
# Contributor : Martin Wimpress <code@flexion.org>
# Contributor : Jingbei Li <i@jingbei.li>
pkgname=miniconda3
pkgver=4.5.4
pkgrel=2
pkgdesc="Mini version of Anaconda Python distribution."
arch=('x86_64')
url="https://conda.io/miniconda"
license=("custom")
source=("http://repo.continuum.io/miniconda/Miniconda3-${pkgver}-Linux-x86_64.sh"
        "$pkgname.install")
options=(!strip libtool staticlibs)
sha256sums=('80ecc86f8c2f131c5170e43df489514f80e3971dd105c075935470bbf2476dea'
            '6d6d8b5f4d2e9ca3c69464e903e292fa020c10ea6920aff5c32ebb021b84d865')
install="$pkgname.install"

prepare() {
       cd "${srcdir}"
       msg2 "Patching Miniconda3-${pkgver}-Linux-x86_64.sh"
       sed \
       	-e '/wc -c "\$THIS_PATH" | grep/s/!//' \
       	-e "/export FORCE/s|$|;sed \"/^def update_prefix/a\\\    new_prefix='/opt/$pkgname'\" -i pkgs/.install.py|" \
       	-i Miniconda3-${pkgver}-Linux-x86_64.sh
}

package() {
	prefix="${pkgdir}/opt/${pkgname}"
	LD_PRELOAD="/usr/lib/libfakeroot/libfakeroot.so"

	msg2 "Packaging ${pkgname} for installation to /opt/${pkgname}"
	bash "${srcdir}/Miniconda3-${pkgver}-Linux-${CARCH}.sh" -b -p $prefix -f
	[ "$BREAK_EARLY" = 1 ] && exit 1
	cd "${prefix}"

	msg2 "Correcting permissions"
	chmod a+r -R pkgs

	msg2 "Stripping \$pkgdir from default meta"
	find conda-meta -name '*.json' -exec sed -e "s/${pkgdir//\//\\\/}//g" -i {} \;

	msg2 "Installing license"
	install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
