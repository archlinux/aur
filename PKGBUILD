# Maintainer: J0k3r <moebius282 at gmail dot com>

pkgname=netradiant-git
pkgver=r1355.e38c7bf
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

	## Needs Internet; Downloads gamepacks
	make
}

package()
{
	cd "${srcdir}/${pkgname}/"

	## We name the folder just netradiant, so the different gamepacks packages in the AUR still work
	install -d "${pkgdir}/opt/netradiant/"
	install -d "${pkgdir}/usr/bin/"

	## We use 'cp' for -R(epackage) support
	cp -r install/* "${pkgdir}/opt/netradiant/"

	ln -s "/opt/netradiant/radiant" "${pkgdir}/usr/bin/netradiant"
	
	## You can probably also link q3map2 for convenience to /usr/bin, but I did not test that it works correctly.
	## The old PKGBUILD had a script that switches to the directory first, because of 'weird behaviour'. Keep that in mind.
	## Also this would make us conflict with other *Radiant packages like GtkRadiant if they would do the same.

	## Fix (some of) the included gamepacks so they work with the official archlinux packages
	## Normally we would do this in prepare(), but this is not an viable option, as the Makefile initiates the download and update of the gamepacks.
	## So we would need to call the referenced download script ourselves in prepare() and modify the Makefile so it doesn't try to do it in build() too.
	## Not worth it.
	
	## 'nexuiz' AUR package resides in /usr/share/, 'nexuiz-data' in saner /opt/
	#sed -i -e '/enginepath_linux/c\  enginepath_linux="/usr/share/nexuiz/"' "${pkgdir}/opt/netradiant/games/nexuiz.game"
	sed -i -e '/enginepath_linux/c\  enginepath_linux="/opt/nexuiz/"' "${pkgdir}/opt/netradiant/games/nexuiz.game"

	sed -i -e '/enginepath_linux/c\  enginepath_linux="/opt/warsow/"'  "${pkgdir}/opt/netradiant/games/warsow.game"
	sed -i -e '/enginepath_linux/c\  enginepath_linux="/usr/share/xonotic/"' "${pkgdir}/opt/netradiant/games/xonotic.game"

	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 "${srcdir}/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
