# Maintainer: Marc Cousin <cousinmarc@gmail.com>
pkgname=mkvtoolnix-git
pkgver=r16293.0e9275e16
pkgrel=1
pkgdesc="Git version of mkvtoolnix (to get the latest mkvtoolnix-gui)"
arch=(x86 x86_64)
url="https://www.bunkus.org/videotools/mkvtoolnix"
license=('GPL')
groups=()
depends=('libmatroska' 'expat' 'flac' 'libvorbis' 'file' 'boost-libs' 'lzo' 'xdg-utils' 'desktop-file-utils' 'qt5-base' 'libogg' 'zlib' 'curl' 'libxkbcommon-x11')
makedepends=('libmatroska' 'flac' 'libvorbis' 'file' 'ruby-erb'
             'boost-libs' 'lzo' 'xdg-utils' 'boost' 'ruby' 'git' 'libxslt' 'po4a' 'docbook-xsl'
	     'cmark' 'rake' 'qt5-multimedia')

provides=('mkvtoolnix')
conflicts=('mkvtoolnix-cli' 'mkvtoolnix-gui')
replaces=('mkvtoolnix')
source=('git+https://codeberg.org/mbunkus/mkvtoolnix.git')
noextract=()
md5sums=('SKIP')


pkgver() {
	cd "$srcdir/mkvtoolnix"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
prepare() {
	true
	#nothing for now
	#cd "$srcdir/${pkgname%-VCS}"
	#patch -p1 -i "$srcdir/${pkgname%-VCS}.patch"
}

build() {
	cd "$srcdir/mkvtoolnix"
	./autogen.sh
	git submodule init
	git submodule update
	./configure --prefix=/usr
	# remove the -j${procs} if you suffer during compile...
	# At 8, my computer has a lot of trouble with 8GB of RAM...
	declare -i procs
	procs=`nproc`/2
	rake	-j${procs}
}

package() {
	cd "$srcdir/mkvtoolnix"
	rake DESTDIR="${pkgdir}" install
}
