# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Cédric Bellegarde
# Contributor: robertfoster
# Contributor: Dan Beste <dan.ray.beste@gmail.com>
# Contributor: Frederic Bezies < fredbezies at gmail dot com>
# Contributor: Ian Brunelli (brunelli) <ian@brunelli.me>

pkgname=lollypop-next-git
pkgver=1.4.34.r1.g9b5393ca2
pkgrel=2
pkgdesc="Music player for GNOME, next branch"
arch=(any)
url="https://gitlab.gnome.org/World/lollypop"
license=(GPL3)
depends=(
	appstream-glib
	gst-plugins-base-libs
    gobject-introspection-runtime
    gdk-pixbuf2
	gtk3
	python-beautifulsoup4
	python-cairo
	python-gobject
	python-pillow
    gst-python
	libhandy
    libsoup
	totem-plparser
)
makedepends=(
	git
	gobject-introspection
	intltool
	itstool
	meson
)
optdepends=(
	'easytag: Modify tags'
	'gst-libav: FFmpeg plugin for GStreamer'
	'gst-plugins-bad: "Bad" plugin libraries'
	'gst-plugins-base: "Base" plugin libraries'
	'gst-plugins-good: "Good" plugin libraries'
	'gst-plugins-ugly: "Ugly" plugin libraries'
	'kid3-qt: Store covers in tags'
	'libsecret: Last.FM support'
	'python-pylast: Last.FM support'
	'youtube-dl: Youtube support'
)
conflicts=(lollypop)
provides=(lollypop)
source=("git+https://gitlab.gnome.org/World/lollypop.git#branch=next"
        "git+https://gitlab.gnome.org/gnumdk/lollypop-po.git")
sha256sums=('SKIP'
            'SKIP')

pkgver() {
  cd "$srcdir/lollypop"
  git describe --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd lollypop
  git submodule init
  git config submodule.subprojects/po.url "${srcdir}/lollypop-po"
  git -c protocol.file.allow=always submodule update
}

build() {
  arch-meson lollypop build \
    --libexecdir='lib/lollypop'
  ninja -C build
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install
}
