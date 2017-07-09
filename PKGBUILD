# Maintainer: orumin <dev@orum.in>

_basename=gst-libav
pkgname="lib32-$_basename"
pkgver=1.12.1
pkgrel=1
pkgdesc="Gstreamer libav Plugin (32-bit)"
arch=('x86_64')
license=('GPL')
url="http://gstreamer.freedesktop.org/"
depends=('lib32-gst-plugins-base-libs' 'bzip2' 'lib32-ffmpeg' 'gst-libav')
makedepends=('python' 'autoconf-archive' 'git' 'valgrind-multilib')
options=(!emptydirs)
provides=("lib32-gst-ffmpeg=$pkgver-$pkgrel")
_commit=717fc7c3bde7d2f6da41ff8299fd4564d802065c  # tags/1.12.1^0
source=("git+https://anongit.freedesktop.org/git/gstreamer/gst-libav#commit=$_commit"
        "gst-common::git+https://anongit.freedesktop.org/git/gstreamer/common"
        "git://source.ffmpeg.org/ffmpeg")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd $_basename
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_basename

  git submodule init
  git config --local submodule.common.url "$srcdir/gst-common"
  git config --local submodule.gst-libs/ext/libav.url "$srcdir/ffmpeg"
  git submodule update

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_basename

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib32 \
    --build=i686-pc-linux-gnu --libdir=/usr/lib32 \
    --with-package-name="GStreamer libav Plugin (Arch Linux)" \
    --with-package-origin="http://www.archlinux.org/" \
    --with-system-libav --with-libav-extra-configure="--enable-runtime-cpudetect" \
    --enable-experimental --disable-gtk-doc --disable-static

  # https://bugzilla.gnome.org/show_bug.cgi?id=655517
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

check() {
  cd $_basename
  make check
}

package() {
  cd $_basename
  make DESTDIR="${pkgdir}" install
}
