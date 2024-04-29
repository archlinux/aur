# Maintainer: BrainDamage

pkgname=pyambientmixer-git
pkgver=r7.b188d8f
pkgrel=4
pkgdesc="Python player with Pygame to play ambient-mixer.com mixes locally"
arch=('any')
url="https://github.com/Philooz/pyambientmixer"
license=('GPL3')
depends=('python' 'python-pygame' 'python-untangle' 'python-docopt')
source=("git+${url}.git")
sha256sums=('SKIP')

# template start; name=git; version=1;
makedepends+=('git')

# strip the -git suffix from name
_dirname="${pkgname%-git}"
_basename="${pkgname%-git}"

# conflict/provide the same package as the non -git version
provides=("${_basename}")
conflicts=("${_basename}")

pkgver() {
	cd "${srcdir}/${_dirname}"
	( set -o pipefail
		git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
		printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
	# 0.9.9.r27.g2b039da # if tags exist
	# r1581.2b039da      # else fallback
}
# template end;


prepare() {
	cd "${srcdir}/${_dirname}"
	sed -i '1i #!/bin/env python' ambient.py
	sed -i '1i #!/bin/env python' ambient_downloader.py
}


package() {
	cd "${srcdir}/${_dirname}"
	install -Dvm 755 ambient.py "${pkgdir}/usr/bin/ambient"
	install -Dvm 755 ambient_downloader.py "${pkgdir}/usr/bin/ambient_downloader"
}
