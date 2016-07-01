# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# AUR dependencies: esound

pkgname=xine-lib-hg
pkgver=1.2.6.r12710.24fc93301077
pkgrel=1
pkgdesc="A multimedia playback engine (Mercurial version with all possible libs)"
arch=('i686' 'x86_64')
url="https://www.xine-project.org/"
license=('GPL2' 'LGPL')
depends=(
    'aalib' 'directfb' 'mesa' 'glu' 'libxinerama' 'libxvmc' 'libvdpau'
    'linuxtv-dvb-apps' 'gnome-vfs' 'smbclient' 'v4l-utils' 'vcdimager' 'libbluray'
    'ffmpeg' 'a52dec' 'faad2' 'gdk-pixbuf2' 'libjpeg-turbo' 'libdca' 'libmad'
    'libmodplug' 'libmpeg2' 'libmpcdec' 'libmng' 'libvpx' 'freetype2' 'fontconfig'
    'xorg-server-devel' 'alsa-lib' 'esound' 'jack' 'pulseaudio' 'libcaca' 'sdl'
    'libxcb' 'flac' 'speex' 'libtheora' 'libvorbis' 'wavpack' 'libxv'
)
makedepends=('mercurial')
provides=('xine-lib')
conflicts=('xine-lib')
source=("$pkgname"::'hg+http://hg.debian.org/hg/xine-lib/xine-lib-1.2-vdpau')
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	
	# Mercurial        
	printf "%s.r%s.%s" "$(hg log -r "." --template "{latesttag}")" \
	                   "$(hg identify -n)" \
	                   "$(hg identify -i)"
}

build() {
	cd "${srcdir}/${pkgname}"
	
	./autogen.sh
	
	./configure \
	        --prefix=/usr \
	        \
	        --enable-static=no \
	        --enable-shared=yes \
	        --enable-fast-install=yes \
	        \
	        --enable-oss \
	        --enable-aalib \
	        --disable-dha-kmod \
	        --enable-directfb \
	        --enable-dxr3 \
	        --enable-fb \
	        --enable-opengl \
	        --enable-glu \
	        --disable-vidix \
	        --enable-xinerama \
	        --enable-xvmc \
	        --enable-vdpau \
	        --disable-vaapi \
	        --enable-dvb \
	        --enable-gnomevfs \
	        --enable-samba \
	        --enable-v4l2 \
	        --enable-libv4l \
	        --enable-vcd \
	        --enable-vdr \
	        --enable-bluray \
	        --enable-avformat \
	        --enable-a52dec \
	        --enable-asf \
	        --enable-nosefart \
	        --enable-faad \
	        --enable-gdkpixbuf \
	        --enable-libjpeg \
	        --enable-dts \
	        --enable-mad \
	        --enable-modplug \
	        --enable-libmpeg2new \
	        --enable-musepack \
	        --enable-mng \
	        --enable-vpx \
	        \
	        --with-freetype \
	        --with-fontconfig \
	        --with-x \
	        --with-alsa \
	        --with-esound \
	        --without-fusionsound \
	        --with-jack \
	        --with-pulseaudio \
	        --with-caca \
	        --without-linux-path \
	        --without-libstk \
	        --with-sdl \
	        --without-xcb \
	        --without-imagemagick \
	        --with-libflac \
	        --with-speex \
	        --with-theora \
	        --with-vorbis \
	        --with-wavpack
	        
	        # NOTE:
	        # (1): "--enable-vaapi" and "--with-xcb" doesn't work. Disabled
	        # (2): "--with-imagemagick" doesn't work with ImageMagick 7 (and imagemagick git). Disabled.
	        
	        # TODO:
	        # --enable-dha-kmod
	        # --enable-vidix
	        # --with-fusionsound
	        # --with-linux-path=/usr/lib/modules/$(uname -r)/build
	        # --with-libstk
	
	make
}

package() {
	cd "${srcdir}/${pkgname}"
	
	make DESTDIR="$pkgdir/" install
}
