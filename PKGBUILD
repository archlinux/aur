# Maintainer: Frederic Bezies < fredbezies at gmail dot com>
# Contributor: Ian Brunelli (brunelli) <ian@brunelli.me>

pkgname=lollypop-git
_gitname=lollypop
pkgver=0.9.242.r2.gcdfd1319
_portal_pkgver=0.9.1
pkgrel=1
pkgdesc='Music player for GNOME'
arch=('i686' 'x86_64')
license=('GPL3')
url="https://github.com/gnumdk/${_gitname}"
depends=('desktop-file-utils' 'gst-python' 'gtk3' 'python-cairo'
         'python-dbus' 'python-gobject' 'totem-plparser' 'python-pylast')
makedepends=('git' 'gnome-common' 'intltool' 'itstool' 'python' 'yelp-tools' 'gobject-introspection' 'meson' 'appstream-glib')
optdepends=('easytag: tag editing'
	    'flatpak: Flatpak Portal'
            'gst-libav: FFmpeg plugin for GStreamer'
            'kid3-qt: Store covers in tags'
            'libsecret: Last.FM support'
            'python-wikipedia: Wikipedia support'
            'youtube-dl: YouTube playback')
options=('!emptydirs')
source=("git://github.com/gnumdk/${_gitname}.git"
"https://github.com/gnumdk/lollypop-portal/releases/download/${_portal_pkgver}/lollypop-portal-${_portal_pkgver}.tar.xz")
sha256sums=('SKIP'
           'd7c5ae781eb3a7d24b1303b6f0c618d386e7ee0c977f87220f889c12e2713e6f')
conflicts=('lollypop')
provides=("lollypop=$pkgver")

pkgver() {
	cd "${_gitname}"
	git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd lollypop-portal-${_portal_pkgver}
    ./configure \
    --prefix='/usr' \
    --libexecdir='/usr/lib/lollypop'
    make
 
	cd "$srcdir/${_gitname}"
    rm -rf _build
	/usr/bin/meson _build --prefix=/usr 
	ninja -C _build
}

package() {
    cd lollypop-portal-${_portal_pkgver}
    make DESTDIR="${pkgdir}" install

	cd "$srcdir/${_gitname}"
	env DESTDIR="$pkgdir" ninja -C _build install
}
