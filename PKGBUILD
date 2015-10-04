# Maintainer : Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>

pkgname=vlc-plugin-fluidsynth-git
pkgver=3.0.0.r4737.g5a2e513
pkgrel=1
pkgdesc="FluidSynth plugin for VLC (compiling from vlc GIT repo)."
arch=("i686" "x86_64")
url="http://www.videolan.org/vlc/"
license=("LGPL2.1")
depends=('vlc>=3.0.0' 'fluidsynth')
makedepends=()
optdepends=("soundfont-fluid: FluidR3_GM soundfont")
conflicts=("${pkgname%-*}")
provides=("${pkgname%-*}=${pkgver:0:5}")
replaces=("${pkgname%-*}")
options=("!libtool" "!emptydirs")
install="notes.install"
source=("git://git.videolan.org/${pkgname%%-*}.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname%%-*}"
		git_ver=`git describe --long | sed 's/git-//;s/\([^-]*-g\)/r\1/;s/-/./g'`
		conf_ver=`sed -n 's/)$//g;s/^AC_INIT(vlc, //p' configure.ac`
		echo "${git_ver/#${git_ver:0:5}/${conf_ver:0:5}}"
}

prepare() {
	cd "${srcdir}/${pkgname%%-*}"
	# Patch
	sed -i -e 's:truetype/freefont:TTF:g' modules/text_renderer/freetype.c
	sed -i -e 's:truetype/ttf-dejavu:TTF:g' modules/visualization/projectm.cpp
}

build() {
	cd "${srcdir}/${pkgname%%-*}"

	msg 'Generating necessary files...'
	RCC=/usr/bin/rcc-qt5
	./bootstrap

	msg 'Done. Configuring VLC...'

	# Config
	[ ${CARCH} = 'x86_64' ] && CXXFLAGS="$CXXFLAGS -fPIC"

	./configure --prefix=/usr \
				--sysconfdir=/etc \
				--disable-rpath \
				--enable-faad \
				--enable-nls \
				--enable-lirc \
				--enable-ncurses \
				--enable-realrtsp \
				--enable-aa \
				--enable-vcdx \
				--enable-upnp \
				--enable-opus \
				--enable-sftp \
				--enable-fluidsynth

	msg 'Done. Starting make...'

	cd "${srcdir}/${pkgname%%-*}/compat/"
	make libcompat.la

	cd "${srcdir}/${pkgname%%-*}/src/"
	make fourcc_tables.h libvlccore.la # ../include/vlc_about.h
	
	cd "${srcdir}/${pkgname%%-*}/modules/"
	make top_builddir="${srcdir}/${pkgname%%-*}" codec/libfluidsynth_plugin_la-fluidsynth.lo libfluidsynth_plugin.la
}

package() {
	cd "${srcdir}/${pkgname%%-*}/modules/"
	make DESTDIR="${pkgdir}" codec_LTLIBRARIES="libfluidsynth_plugin.la" install-codecLTLIBRARIES
}
