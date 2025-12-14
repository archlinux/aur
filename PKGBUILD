# Maintainer: JOLIMAITRE Matthieu <matthieu@imagevo.fr>
pkgname="lustre-tools-6"
pkgver=6.112.5
pkgrel=1
pkgdesc="The Lustre developpment tools free distribution version 6."
url="https://www-verimag.imag.fr/DIST-TOOLS/SYNCHRONE/lustre-v4/distrib/"
arch=("x86_64")
license=("Free Distribution of the Lustre/Lesar Software")
makedepends=()
optdepends=()
depends=('findutils')
source=("https://www-verimag.imag.fr/DIST-TOOLS/SYNCHRONE/lustre-v6/pre-compiled/x86_64-Linux-lv6-bin-dist.tgz")
sha256sums=("04f307a18769ba34a3ce2628faa08e8e3f80456c0c37de30de197e3b092cb464")


build() {
	cd "$srcdir/lv6-bin-dist"

    # Variable LUSTRE_INSTALL is required for some binaries in this package
    # proxying each of them with a script that sets it ensures it is set
    # properly. Even in situations where both lustre-tools-4 and
    # lustre-tools-6 are in use.

	mv bin bin_
	mkdir bin
	for exec in $(cd bin_ ; ls)
	do
		echo '#!/bin/sh
set -e
export LUSTRE_INSTALL=/usr/share/lustre-tools-6
/usr/share/lustre-tools-6/bin_/'$exec' $@
' > "bin/$exec"
		chmod a+x "bin/$exec"
	done
}

package() {
	mkdir -p "$pkgdir/usr/share" "$pkgdir/etc/profile.d"
	cp -r "$srcdir/lv6-bin-dist" "$pkgdir/usr/share/lustre-tools-6"
	echo "append_path '/usr/share/lustre-tools-6/bin'
export PATH" > "$pkgdir/etc/profile.d/lustre-tools-6.sh"
}

pkgver() {
    $srcdir/lv6-bin-dist/bin/lv6 --version
}
