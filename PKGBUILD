# Maintainer : Ashwin Vishnu <ashwinvis+arch At protonmail DoT cOm>
# Contributor : Immae <ismael.bouya@normalesup.org>
# Contributor : Martin Wimpress <code@flexion.org>
# Contributor : Jingbei Li <i@jingbei.li>
pkgname=miniconda3
pkgver=4.6.14
pkgrel=1
pkgdesc="Mini version of Anaconda Python distribution."
arch=('x86_64')
url="https://conda.io/en/latest/miniconda.html"
license=("custom")
source=("https://repo.continuum.io/miniconda/Miniconda3-${pkgver}-Linux-x86_64.sh"
        "$pkgname.install")
options=(!strip libtool staticlibs)
sha256sums=('0d6b23895a91294a4924bd685a3a1f48e35a17970a073cd2f684ffe2c31fc4be'
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

	msg2 "Stripping \$pkgdir"
	sed "s|${pkgdir}||g" -i $(grep "$pkgdir" . -rIl)

	msg2 "Installing license"
	install -D -m644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
