# Maintainer: orumin <dev@orum.in>

_basename=gst-libav
pkgname="lib32-$_basename"
pkgver=1.14.3
pkgrel=1
pkgdesc="GStreamer Multimedia Framework ffmpeg Plugin (32-bit)"
url="https://gstreamer.freedesktop.org/"
arch=(x86_64)
license=(GPL)
depends=('lib32-gst-plugins-base-libs' 'bzip2')
makedepends=(python autoconf-archive git valgrind-multilib yasm)
provides=("lib32-gst-ffmpeg=$pkgver-$pkgrel")
_commit=35290bb8c25b00b80a51d18c88adc9c70aeaebf8  # tags/1.14.3^0
source=("git+https://anongit.freedesktop.org/git/gstreamer/gst-libav#commit=$_commit"
        "gst-common::git+https://anongit.freedesktop.org/git/gstreamer/common"
        "git+https://git.videolan.org/git/ffmpeg" "git://git.libav.org/gas-preprocessor")
sha256sums=('SKIP'
            'SKIP'
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
  git config --local submodule.gst-libs/ext/gas-preprocessor.url "$srcdir/gas-preprocessor"
  git submodule update

  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_basename

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --libexecdir=/usr/lib32 \
    --libdir=/usr/lib32 \
    --build=i686-pc-linux-gnu \
    --with-package-name="GStreamer libav Plugin (Arch Linux)" \
    --with-package-origin="http://www.archlinux.org/" \
    --without-system-libav \
    --with-libav-extra-configure="--enable-runtime-cpudetect" \
    --enable-experimental \
    --disable-gtk-doc \
    --disable-static

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
