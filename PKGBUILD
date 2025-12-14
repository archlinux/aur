# Maintainer: JOLIMAITRE Matthieu <matthieu@imagevo.fr>
pkgname="lustre-tools-4"
pkgver=1.54
pkgrel=1
pkgdesc="The Lustre developpment tools free distribution version 4."
url="https://www-verimag.imag.fr/DIST-TOOLS/SYNCHRONE/lustre-v4/distrib/"
arch=("x86_64")
license=("Free Distribution of the Lustre/Lesar Software")
makedepends=()
optdepends=()
depends=('findutils')
source=("https://www-verimag.imag.fr/DIST-TOOLS/SYNCHRONE/lustre-v4/distrib/archives/lustre-v4-III-e-linux64.tgz")
sha256sums=("1fe7dad0731f13bc9151d0d5e0efe7d6a46b963da485c87595df0e14d51927f7")

build() {
	cd "$srcdir/lustre-v4-III-e0-linux64"

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
export LUSTRE_INSTALL=/usr/share/lustre-tools-4
/usr/share/lustre-tools-4/bin_/'$exec' $@
' > "bin/$exec"
		chmod a+x "bin/$exec"
	done
}

package() {
	mkdir -p "$pkgdir/usr/share" "$pkgdir/etc/profile.d"
	cp -r "$srcdir/lustre-v4-III-e0-linux64" "$pkgdir/usr/share/lustre-tools-4"
	echo "append_path '/usr/share/lustre-tools-4/bin'
export PATH" > "$pkgdir/etc/profile.d/lustre-tools-4.sh"
}

pkgver() {
    $srcdir/lustre-v4-III-e0-linux64/bin/lesar -help 2>&1 | head -n 1 | cut -d ' ' -f 3 | rev | cut -d '-' -f 1 | rev
}
