# Maintainer : Ashwin Vishnu <ashwinvis+arch At protonmail DoT cOm>
# Contributor : Immae <ismael.bouya@normalesup.org>
# Contributor : Martin Wimpress <code@flexion.org>
# Contributor : Jingbei Li <i@jingbei.li>
pkgname=miniconda3
pkgver=4.5.1
pkgrel=1
pkgdesc="Mini version of Anaconda Python distribution."
arch=('x86_64')
url="https://conda.io/miniconda"
license=("custom")
source=("http://repo.continuum.io/miniconda/Miniconda3-${pkgver}-Linux-x86_64.sh"
        "$pkgname.install")
options=(!strip libtool staticlibs)
sha256sums=('4b857c96d7aad4b09063224e88f4f62e778a5f1f2a1b211340ba765ce6aa21e5'
            '9e0d1b0226a08e8cd220e4dbe42ecfa7636893e023e61123f70fd2bed3c3f066')
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
