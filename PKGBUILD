# Maintainer: brent s. <bts[at]square-r00t[dot]net>
# thanks to Slash <demodevil5[at]yahoo[dot]com> for the original no-git package

pkgname=ezquake-git
pkgver=r4621.4bf8793
pkgrel=2
pkgdesc="One of the most Popular QuakeWorld clients for Linux/BSD/OSX/Win32. You need the retail pak files to play. (Git version)"
url="http://ezquake.sourceforge.net/"
license=('GPL')
# TODO[0]: find out what's needed at runtime and what's needed at compile time. http://ezquake.svn.sourceforge.net/viewvc/ezquake/trunk/ezquake/compiling_on_unix.txt seems to be outdated...
# Note that if a package is required at both build and runtime, it can be just included in depends array.
# NOTE: "libgl" is a virtual provides, of sorts. can be either mesa-libgl, nvidia-libgl, etc...
depends=('libgl' 'libxxf86dga' 'zlib' 'libpng' 'minizip' 'libircclient' 'expat' 'pcre' 'sdl2' 'tcl' 'glew')
makedepends=('glu' 'xf86vidmodeproto' 'libxxf86vm' 'libxext' 'jansson' 'libxpm')
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
	'ezquake.ico')
sha256sums=("SKIP"
	    "SKIP" ## TODO[4]: split this into another package/split package. there's some... licensing issues.
	    #"SKIP" ## not needed; we use makepkg's depedency system for this, foo's.
	    "SKIP" ## TODO[3]
	    #"SKIP" ## TODO[2]
	    #'SKIP' ## TODO[1]
            'f6c71961b06a38d11fc9ead5231f070484bd248bbcb70266c8c1bfff9b9e2b45'
            'e92b9cdeac5eadced50a6167eb53b1343b0772d3bf8afa310eb281b88bf7e677'
            '2a6a5484ddb4cfaf8518b51df39ffd1fa8ce768402eab6401415bececb8e8ab2')
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

