# Maintainer: J0k3r <moebius282 at gmail dot com>

pkgname=netradiant-git
pkgver=r1351.e995cc8
pkgrel=1
epoch=1
pkgdesc="A Stabilized Q3 Map Editor - git version"
url="http://dev.xonotic.org/projects/xonotic/wiki/Netradiant"
license=('GPL' 'BSD' 'LGPL')
arch=('i686' 'x86_64')
changelog="${pkgname}.changelog"
depends=('gtkglext')
makedepends=('git' 'svn' 'wget' 'unzip')
provides=('netradiant')
conflicts=('netradiant-bin32' 'netradiant-svn' 'netradiant-latest' 'netradiant-unfree-svn')
source=("${pkgname}::git://git.xonotic.org/xonotic/netradiant.git"
		"${pkgname}.desktop"
		"${pkgname}.changelog")
sha256sums=("SKIP"
			"ec5829cf3a88f3ff63e45b9e412576cb65463932984953f8698162abaea40e09"
			"SKIP")

pkgver()
{
	cd "${srcdir}/${pkgname}/"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
	cd "${srcdir}/${pkgname}/"

	## Needs Internet, downloads gamepacks
	make
}

package()
{
	cd "${srcdir}/${pkgname}/"

	## We name the folder just netradiant, so the different GamePack addon packages still work
	install -d "${pkgdir}/opt/netradiant/"
	install -d "${pkgdir}/usr/bin/"

	## for Repackage support
	cp -r install/* "${pkgdir}/opt/netradiant/"

	ln -s "/opt/netradiant/radiant" "${pkgdir}/usr/bin/netradiant"
	## You can probably also link q3map2 for convenience to /usr/bin, but I did not test that it works correctly.
	## The old PKGBUILD had a script that switches to the directory first, because of 'weird behaviour'. Keep that in mind.
	## Also this would make us conflict with other *Radiant packages like GtkRadiant if they would do the same.

	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
