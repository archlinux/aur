pkgname="mate-window-applets"
url="https://github.com/IKRadulov/mate-window-applets"
license=('GPL3')
arch=('i686' 'x86_64')
pkgver=1.5.1

_disable_buttons=0
_disable_menu=0
_disable_title=0

_opts=()

if (("${_disable_buttons}" == 0));then
	_opts+=(-D build-window-buttons=true)
	msg "Building with buttons"
else
	_opts+=(-D build-window-buttons=false)
fi

if (("${_disable_menu}" == 0));then
	_opts+=(-D build-window-menu=true)
	msg "Building with menu"
else
	_opts+=(-D build-window-menu=false)
fi

if (("${_disable_title}" == 0));then
	_opts+=(-D build-window-title=true)
	msg "Building with title"
else
	_opts+=(-D build-window-title=false)
fi

pkgrel=1

makedepends=('meson' 'ninja' 'vala')
depends=('gtk3' 'gdk-pixbuf2' 'libwnck3' 'mate-panel')
source=("git+https://github.com/IKRadulov/${pkgname}")
sha256sums=('SKIP')

build()
{
	cd "${srcdir}/${pkgname}"

	meson --prefix /usr --buildtype=plain build

	cd build

	meson configure "${_opts[@]}"
	
	ninja

	msg "If you want to disable an applet, edit pkgbuild variables _disable_[applet]"
}

package_mate-window-applets() {
	cd "${srcdir}/${pkgname}/build"
	DESTDIR="${pkgdir}" ninja install
	cd ..
	./install-icons.sh "${pkgdir}/usr/share" install
}
