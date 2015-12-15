pkgname=xsettingsd
pkgver=20120522
pkgrel=1
pkgdesc="xsettingsd is a daemon that implements the XSETTINGS specification."
arch=('i686' 'x86_64')
url="http://code.google.com/p/xsettingsd/"
license=('custom:BSD')
depends=('libx11')
makedepends=('git' 'scons')
source=()
_gitroot="git://github.com/derat/xsettingsd.git"
_gitname="xsettingsd"

# trick re-determining the build revision and, or entertain the hidden
# makepkg option --forcever, huh
if [ -z "$FORCE_VER" ]; then
	msg "Determining latest build revision..."
	FORCE_VER=$(wget -q -O- http://github.com/derat/xsettingsd/commits/master  \
	               | grep '<abbr class="relatize" title='                      \
	               | head -n1                                                  \
	               | awk '{print $3;}'                                         \
	               | sed -e 's/.*"//' -e "s/-//g")
fi

build() {
	cd "$srcdir"
	msg "Connecting to GIT server...."

	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot
		cd $_gitname
	fi

	msg "GIT checkout done or server timeout"
	msg "Starting make..."

	env CPPFLAGS="$CXXFLAGS" scons xsettingsd dump_xsettings
}
package() {
	cd "$srcdir/$_gitname"
	install -d ${pkgdir}/usr/bin || return 1
	install -d ${pkgdir}/usr/share/licenses/${pkgname} || return 1
	install -d ${pkgdir}/usr/share/man/man1 || return 1
	install -m 755 ${pkgname} ${pkgdir}/usr/bin/ || return 1
	install -m 755 dump_xsettings ${pkgdir}/usr/bin/ || return 1
	install -m 644 xsettingsd.1 ${pkgdir}/usr/share/man/man1/ || return 1
	install -m 644 dump_xsettings.1 ${pkgdir}/usr/share/man/man1/ || return 1
	install -m 644 COPYING ${pkgdir}/usr/share/licenses/${pkgname}/ || return 1
}
