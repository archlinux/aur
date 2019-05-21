# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Co-maintainer: Spike29 <leguen.yannick@gmail.com>
# Contributor: J0k3r <moebius282 at gmail dot com>

pkgname=netradiant-git
pkgver=r1793.5c0f69d0
pkgrel=2
epoch=1
pkgdesc='The open source, cross platform level editor for idtech games (GTKRadiant fork) - git version'
url='https://gitlab.com/xonotic/netradiant'
license=('GPL' 'BSD' 'LGPL')
arch=('i686' 'x86_64')
depends=('gtk2' 'gtkglext' 'minizip' 'libjpeg-turbo' 'libwebp')
makedepends=('git' 'svn' 'wget' 'unzip' 'cmake' 'make')
provides=('netradiant' 'q3map2' 'q3data')
source=("${pkgname}::git://git.xonotic.org/xonotic/netradiant.git")
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}/"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "${srcdir}/${pkgname}/"

	## Needs Internet; Downloads gamepacks
	## Possible values for the GAMEPACKS_LICENSE_LIST filter are "free", "all" (free + proprietary) and "none"
	## To only fetch Xonotic and Unvanquished gamepacks for example, use -DGAMEPACKS_LICENSE_LIST=none with -DGAMEPACKS_NAME_LIST="Xonotic Unvanquished"
	cmake -G 'Unix Makefiles' -H. -Bbuild -DCMAKE_BUILD_TYPE=Release -DFHS_INSTALL=ON -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr \
	-DDOWNLOAD_GAMEPACKS=ON \
	-DGAMEPACKS_LICENSE_LIST=free \
	-DGAMEPACKS_NAME_LIST=none
}

package() {
	cd "${srcdir}/${pkgname}/"
	
    cmake --build build --target install -- -j$(nproc)
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/netradiant/LICENSE"
    rm -r ${pkgdir}/usr/share/mime/ # Map mime type doesn't work and shouldn't be handled this way
    
	## Fix (some of) the included gamepacks so they work with the official archlinux packages
	## Normally we would do this in prepare(), but this is not an viable option, as the Makefile initiates the download and update of the gamepacks.
	## So we would need to call the referenced download script ourselves in prepare() and modify the Makefile so it doesn't try to do it in build() too.
	## Not worth it.

	sed -i -e '/enginepath_linux/c\  enginepath_linux="/usr/share/nexuiz/"' "${pkgdir}/usr/share/netradiant/games/nexuiz.game"
	sed -i -e '/enginepath_linux/c\  enginepath_linux="/opt/warsow/"' "${pkgdir}/usr/share/netradiant/games/warsow.game"
	sed -i -e '/enginepath_linux/c\  enginepath_linux="/usr/share/xonotic/"' "${pkgdir}/usr/share/netradiant/games/xonotic.game"
}
