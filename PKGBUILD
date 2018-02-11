# Maintainer: Ernesto Castellotti <erny.castell@gmail.com>

_pkgname=vlc
pkgname=vlc3
pkgver=3.0.0
pkgrel=1
pkgdesc="Multi-platform MPEG, VCD/DVD, and DivX player"
url="https://www.videolan.org/vlc"
license=('GPL2, LGPL2.1')
arch=('x86_64')
depends=('a52dec' 'faad2' 'ffmpeg2.8' 'libdca' 'libdvbpsi' 'libdvdnav' 'libmad' 'libmatroska' 'libmpcdec' 'libmpeg2' 'libproxy' 'libshout' 'libtar' 'libtiger' 'libupnp' 'libxinerama' 'libxpm' 'lua' 'sdl_image' 'taglib' 'xcb-util-keysyms' 'zvbi')
makedepends=('aalib' 'flac' 'gtk2' 'kdelibs' 'libavc1394' 'libbluray' 'libcaca' 'libdc1394' 'libdvdcss' 'libgme' 'libgoom2' 'libmtp' 'libnotify' 'librsvg' 'libssh2' 'lirc' 'live-media' 'mesa' 'opus' 'portaudio' 'projectm' 'qt4' 'smbclient' 'twolame' 'vcdimager' 'xosd')
conflicts=("$_pkgname" 'vlc-dev' 'vlc-plugin' 'vlc-stable-git')
provides=("$_pkgname=$pkgver")
source=("http://get.videolan.org/vlc/3.0.0/vlc-3.0.0.tar.xz"
	"https://gist.github.com/ErnyTech/0b18995e092d93e429db085041fc2ddc/raw/f0006a0757fa7452d6c783b74c7e79c92504b14a/fixlua_503.patch"
	"https://gist.github.com/ErnyTech/ca58899bb74b87c3be5e84386fb8f9e3/raw/103ab9c302591f53e0c3746945e1c00e97735761/update-vlc-plugin-cache.hook")
sha256sums=('68d587999f50d58df5ca3d69998bba910bdb5a82e5a1a39247179932fae0c19c'
	    '9f6c8e7bdffdddba610f367faec784754670d58053ef0c7b9cb0729705b11c61'
            '14bfdd4d68bcd27cd9f1e4c8d78cfb39d9534f1d12c19ba617f34a9a054f3b8a')

prepare() {
    cd "${srcdir}/$_pkgname-$pkgver"
    patch -p0 -i "${srcdir}/fixlua_503.patch" 
}	

build() {
    cd "${srcdir}/$_pkgname-$pkgver"
    ./configure --prefix=/usr \
              --sysconfdir=/etc \
              --disable-rpath \
              --enable-aa \
              --enable-faad \
              --enable-lirc \
              --enable-ncurses \
              --enable-nls \
              --enable-opus \
              --enable-realrtsp \
              --enable-sftp \
              --enable-upnp \
              --enable-vcdx \
              --enable-wayland \
              --disable-opencv
    make -j$(nproc)
}

package() {
    cd "${srcdir}/$_pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
    for res in 16 32 48 128; do
    	install -D -m644 "$srcdir"/"$_pkgname-$pkgver"/share/icons/"${res}"x"${res}"/vlc.png \
                     "$pkgdir"/usr/share/icons/hicolor/"${res}"x"${res}"/apps/vlc.png
    done
    install -Dm 644 "$srcdir"/update-vlc-plugin-cache.hook -t "$pkgdir"/usr/share/libalpm/hooks
}

