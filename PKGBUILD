# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Spike29 <leguen.yannick@gmail.com>
# Contributor: J0k3r <moebius282 at gmail dot com>

pkgname=netradiant-git
pkgver=r1620.0311de36
pkgrel=2
epoch=1
pkgdesc="A Stabilized Q3 Map Editor - git version"
url="https://gitlab.com/xonotic/netradiant"
license=('GPL' 'BSD' 'LGPL')
arch=('i686' 'x86_64')
depends=('gtkglext' 'minizip' 'libjpeg-turbo')
makedepends=('git' 'svn' 'wget' 'unzip' 'cmake')
provides=('netradiant')
source=("${pkgname}::git://git.xonotic.org/xonotic/netradiant.git"
        "${pkgname}.desktop")
sha256sums=("SKIP"
            "ff4020c38d2e832081ee440817319d116289c62aaea1881de442d485639ea06d")

pkgver()
{
	cd "${srcdir}/${pkgname}/"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build()
{
	cd "${srcdir}/${pkgname}/"

	## Needs Internet; Downloads gamepacks
	cmake -G "Unix Makefiles" -H. -Bbuild -DCMAKE_BUILD_TYPE=Release
	cmake --build build --target install `DOWNLOAD_GAMEPACKS=ON` -- -j$(nproc)
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

	install -Dm644 icons/radiant-src.png "$pkgdir/usr/share/pixmaps/$pkgname.png"
	install -Dm644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
