# Maintainer : Özgür Sarıer <echo b3pndXJzYXJpZXIxMDExNjAxMTE1QGdtYWlsLmNvbQo= | base64 -d>

_compile=0 # Default 0
# 0=Use prebuilt debian vlc-plugin-fluidsynth package
# 1=Download vlc stable git source and compile vlc fluidsynth plugin standalone.

pkgname=vlc-plugin-fluidsynth
pkgver=2.2.1
pkgrel=4
pkgdesc="FluidSynth plugin for VLC"
arch=('i686' 'x86_64')
url="http://www.videolan.org/vlc/"
license=('LGPL2.1')
depends=('vlc<3.0.0' 'fluidsynth')
makedepends=()
optdepends=("soundfont-fluid: FluidR3_GM soundfont")
conflicts=("${pkgname}-git")
provides=("${pkgname}=${pkgver}")
replaces=("${pkgname}-git")
install="notes.install"

if [ "${_compile}" -eq 0 ]; then
	source_i686=("${pkgname}_${pkgver}-${pkgrel}_i386.deb::http://ftp.us.debian.org/debian/pool/main/v/vlc/${pkgname}_${pkgver}-${pkgrel}_i386.deb")
	source_x86_64=("${pkgname}_${pkgver}-${pkgrel}_amd64.deb::http://ftp.us.debian.org/debian/pool/main/v/vlc/${pkgname}_${pkgver}-${pkgrel}_amd64.deb")

	md5sums_i686=('221cc6cca2507ee5f5584b2f757f040c')
	md5sums_x86_64=('fa948b33dda99e25a2f17feaa07a1b86')
else
	options=("!libtool" "!emptydirs")
	source+=("git://git.videolan.org/${pkgname%%-*}/${pkgname%%-*}-${pkgver:0:3}.git")
	md5sums+=('SKIP')
fi

pkgver() {
	if [ "${_compile}" -ne 0 ]; then
		cd "${srcdir}/${pkgname%%-*}-${pkgver:0:3}"
		conf_ver=`sed -n 's/)$//g;s/^AC_INIT(vlc, //p' configure.ac`
		echo "${conf_ver:0:5}"
	fi
}

prepare() {
	if [ "${_compile}" -eq 0 ]; then
		cd "${srcdir}/"
		mkdir -p "${srcdir}/data/"
		tar -xf data.tar.xz -C "${srcdir}/data/"
	else
		cd "${srcdir}/${pkgname%%-*}-${pkgver:0:3}"
		# Patch
		sed -i -e 's:truetype/freefont:TTF:g' modules/text_renderer/freetype.c
		sed -i -e 's:truetype/ttf-dejavu:TTF:g' modules/visualization/projectm.cpp
	fi
}

build() {
	if [ "${_compile}" -ne 0 ]; then
		cd "${srcdir}/${pkgname%%-*}-${pkgver:0:3}"

		msg 'Generating necessary files...'
		RCC=/usr/bin/rcc-qt4
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

		cd "${srcdir}/${pkgname%%-*}-${pkgver:0:3}/compat/"
		make libcompat.la

		cd "${srcdir}/${pkgname%%-*}-${pkgver:0:3}/src/"
		make libvlccore.la

		cd "${srcdir}/${pkgname%%-*}-${pkgver:0:3}/modules/"
		make top_builddir="${srcdir}/${pkgname%%-*}-${pkgver:0:3}" codec/libfluidsynth_plugin_la-fluidsynth.lo libfluidsynth_plugin.la
	fi
}

package() {
	if [ "${_compile}" -eq 0 ]; then
		cd "${srcdir}/"
  
		install -Dm0755 "${srcdir}/data/usr/lib/vlc/plugins/codec/libfluidsynth_plugin.so" "$pkgdir/usr/lib/vlc/plugins/codec/libfluidsynth_plugin.so"
	else
		cd "${srcdir}/${pkgname%%-*}-${pkgver:0:3}/modules/"
		make DESTDIR="${pkgdir}" codec_LTLIBRARIES="libfluidsynth_plugin.la" install-codecLTLIBRARIES
	fi
}
