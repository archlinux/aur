# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: Spike29 <leguen.yannick@gmail.com>
# Contributor: J0k3r <moebius282 at gmail dot com>

pkgname=netradiant-git
pkgver=r1760.20576900
pkgrel=1
epoch=1
pkgdesc='The open source, cross platform level editor for idtech games (GTKRadiant fork) - git version'
url='https://gitlab.com/xonotic/netradiant'
license=('GPL' 'BSD' 'LGPL')
arch=('i686' 'x86_64')
depends=('gtkglext' 'minizip' 'libjpeg-turbo' 'libwebp')
makedepends=('git' 'svn' 'wget' 'unzip' 'cmake')
provides=('netradiant')
source=("${pkgname}::git://git.xonotic.org/xonotic/netradiant.git"
        'netradiant.desktop')
sha256sums=('SKIP'
            '7a41dab07952937ebea518df991858c76612de43941875d7db0943a34e7724c5')

pkgver() {
	cd "${srcdir}/${pkgname}/"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}/"

	## Needs Internet; Downloads gamepacks
	## Possible values for the GAMEPACKS_LICENSE_LIST filter are "free", "all" (free + proprietary) and "none"
	## To only fetch Xonotic and Unvanquished gamepacks for example, use -DGAMEPACKS_LICENSE_LIST=none with -DGAMEPACKS_NAME_LIST="Xonotic Unvanquished"
	cmake -G 'Unix Makefiles' -H. -Bbuild -DCMAKE_BUILD_TYPE=Release \
	-DDOWNLOAD_GAMEPACKS=ON \
	-DGAMEPACKS_LICENSE_LIST=free \
	-DGAMEPACKS_NAME_LIST=none

	cmake --build build --target install -- -j$(nproc)
}

package() {
	cd "${srcdir}/${pkgname}/"

	## We name the folder just netradiant, so the different gamepacks packages in the AUR still work
	install -d "${pkgdir}/opt/netradiant/"
	install -d "${pkgdir}/usr/bin/"

	## We use 'cp' for -R(epackage) support
	cp -r install/* "${pkgdir}/opt/netradiant/"

	ln -s '/opt/netradiant/radiant' "${pkgdir}/usr/bin/netradiant"

	## You can probably also link q3map2 for convenience to /usr/bin, but I did not test that it works correctly.
	## The old PKGBUILD had a script that switches to the directory first, because of 'weird behaviour'. Keep that in mind.
	## Also this would make us conflict with other *Radiant packages like GtkRadiant if they would do the same.

	## Fix (some of) the included gamepacks so they work with the official archlinux packages
	## Normally we would do this in prepare(), but this is not an viable option, as the Makefile initiates the download and update of the gamepacks.
	## So we would need to call the referenced download script ourselves in prepare() and modify the Makefile so it doesn't try to do it in build() too.
	## Not worth it.

	sed -i -e '/enginepath_linux/c\  enginepath_linux="/usr/share/nexuiz/"' "${pkgdir}/opt/netradiant/games/nexuiz.game"
	sed -i -e '/enginepath_linux/c\  enginepath_linux="/opt/warsow/"' "${pkgdir}/opt/netradiant/games/warsow.game"
	sed -i -e '/enginepath_linux/c\  enginepath_linux="/usr/share/xonotic/"' "${pkgdir}/opt/netradiant/games/xonotic.game"

	install -Dm644 icons/radiant-src.png "$pkgdir/usr/share/pixmaps/netradiant.png"
	install -Dm644 "${srcdir}/netradiant.desktop" "${pkgdir}/usr/share/applications/netradiant.desktop"
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/netradiant/LICENSE"
}
