# Maintainer: Uncle Hunto <unclehunto äτ ÝãΗ00 Ð0τ ÇÖΜ>

_tag=$(git ls-remote -t --refs https://gitlab.com/mbunkus/mkvtoolnix.git | awk '{print $2}' | LC_ALL=C sort -bfV | tail -n1 | sed -n -e 's/^.*tags\///p')
pkgname=mkvtoolnix-stable-git
pkgver=22.0.0.r0.gb8389e65b
pkgrel=1
pkgdesc="MKVToolnix latest stable release with unit tests"
arch=(x86 x86_64)
url="https://www.bunkus.org/videotools/mkvtoolnix"
license=('GPL')
depends=('libmatroska' 'expat' 'flac' 'libvorbis' 'file' 'boost-libs' 'lzo' 'wxgtk' 'xdg-utils' 'desktop-file-utils' 'qt5-base' 'libogg' 'zlib' 'curl' 'libxkbcommon-x11' 'qt5-multimedia')
makedepends=('libmatroska' 'flac' 'libvorbis' 'file' 'wxgtk' 'boost-libs' 'lzo' 'xdg-utils' 'boost' 'ruby' 'git' 'libxslt' 'po4a' 'docbook-xsl' 'gtest' 'ruby-rake' 'cmark')
provides=('mkvtoolnix')
conflicts=('mkvtoolnix' 'mkvtoolnix-cli' 'mkvtoolnix-gui' 'mkvtoolnix-git')
replaces=('mkvtoolnix')
source=("git+https://gitlab.com/mbunkus/mkvtoolnix.git#tag=$_tag")
md5sums=('SKIP')


pkgver() {
	cd "$srcdir/mkvtoolnix"
  git describe --long --tags | sed -E 's/([^-]*-g)/r\1/;s/-/./g;s/release.//g'
}
prepare() {
  cd "$srcdir/mkvtoolnix"
  git submodule update --init
  ./autogen.sh
}

build() {
	cd "$srcdir/mkvtoolnix"
  ln -s -T "/usr/include/gtest" "$srcdir/mkvtoolnix/lib/gtest"
	./configure --prefix=/usr --disable-update-check
  rake
  cd "$srcdir/mkvtoolnix/tests/unit"
  rake
}

package() {
	cd "$srcdir/mkvtoolnix"
  rake DESTDIR="${pkgdir}" install
}
