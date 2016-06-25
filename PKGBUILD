# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# Bug reports can be filed at https://bugs.square-r00t.net/index.php?project=3
# News updates for packages can be followed at https://devblog.square-r00t.net
validpgpkeys=('748231EBCBD808A14F5E85D28C004C2F93481F6B')
# thanks to Slash <demodevil5[at]yahoo[dot]com> for the original no-git package

pkgname=ezquake-git
pkgver=r4858.62be229
pkgrel=2
pkgdesc="One of the most Popular QuakeWorld clients for Linux/BSD/OSX/Win32. You need the retail pak files to play. (Git version)"
url="http://ezquake.sourceforge.net/"
license=('GPL')
# TODO[0]: find out what's needed at runtime and what's needed at compile time. http://ezquake.svn.sourceforge.net/viewvc/ezquake/trunk/ezquake/compiling_on_unix.txt seems to be outdated...
# Note that if a package is required at both build and runtime, it can be just included in depends array.
# NOTE: "libgl" is a virtual provides, of sorts. can be either mesa-libgl, nvidia-libgl, etc...
depends=('libgl' 'libxxf86dga' 'zlib' 'libpng' 'minizip' 'libircclient' 'expat' 'pcre' 'sdl2' 'tcl' 'glew')
makedepends=('glu' 'xf86vidmodeproto' 'libxxf86vm' 'libxext' 'jansson' 'libxpm' 'xxd')
conflicts=('fuhquake')
provides=('ezquake' 'quake' 'fuhquake')
arch=('any')
install=ezquake.install
# We have so many dang things to build because we want to match the ezquake AUR package as closely as possible
source=("git+https://github.com/ezQuake/ezquake-source.git"
	"git+https://github.com/ezQuake/ezquake-media.git" ## TODO[4]: split this into another package/split package. there's some... licensing issues.
	#"git+https://github.com/ezQuake/ezquake-libs.git" ## pretty sure we don't need this since we use makepkg's dependency system for this.
	"git+https://github.com/ezQuake/ezquake-documentation.git" ## TODO[3]: last updated 2011? is this used at all? closest i could find is http://ezquake.sourceforge.net/docs/about
	#"git+https://github.com/ezQuake/ezquake-plugins.git" ## TODO[2]: is this actually anything we need? wtf is "namemaker" plugin?
	#"git+https://github.com/ezQuake/fbca.git" ## TODO[1]: enable FBCA? https://github.com/ezQuake/fbca
	'ezquake.launcher'
	'ezquake.desktop'
	'ezquake.ico'
	'ezquake.launcher.sig'
	'ezquake.desktop.sig'
	'ezquake.ico.sig')
sha512sums=('SKIP'
            'SKIP'
            'SKIP'
            '658d36e36acd808ef6e5ad082b2c9c75614bc6861e8c425356c9e45c88b693b9048cf27f974cb1bdeb044345eb245f352a0c4fd462807b6a994348646c2c4b7d'
            '32b76abde8b93a64bdf42af7dd72288eb2baa7fc07ff45e18d38a9ad0ccbc0f3617d38ae0ccf4a04a1d4d2dd4536e1d1cdd51a5560274efb347f5a17ecf4919d'
            '1d9ea83c95fb324ef87bf22a767e3a41429f5c35a456111adbc9a56d70691d587bdda6ec9ff5a9025436f5fcdad40e4959e6244425a474be2f4286bb00cd130e'
            'SKIP'
            'SKIP'
            'SKIP')
pkgver() {
  cd "$srcdir/ezquake-source"
  (
     printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  #( set -o pipefail
  #  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
  #  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  #)
  )
}

build() {

	cd "${srcdir}/ezquake-source"
	make all
}
package() {

    # Create Destination Directories
    install -d "${pkgdir}/opt/quake"

    # Make id1 Directory for pak0.pak and pak1.pak files
    install -d "${pkgdir}/opt/quake/id1/"

    # Make save game Directory with user group permissions
    install -d -m775 -g users "${pkgdir}/opt/quake/qw/save/"

    # Install Icon
    install -D -m644 "${srcdir}/ezquake.ico" \
        "${pkgdir}/usr/share/pixmaps/ezquake.ico"

    # Install Launcher
    install -D -m755 "${srcdir}/ezquake.launcher" \
        "${pkgdir}/usr/bin/ezquake"

    # Install Desktop
    install -D -m644 "${srcdir}/ezquake.desktop" \
        "${pkgdir}/usr/share/applications/ezquake.desktop"

    # Install Binary
    install -D -m755 "${srcdir}/ezquake-source/ezquake-linux-$(uname -m)" \
        "${pkgdir}/opt/quake/ezquake-linux"
}

