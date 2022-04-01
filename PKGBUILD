# Maintainer: Florian Pritz <flo@xssn.at>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=lib32-libcanberra
pkgver=0.30+r2+gc0620e4
pkgrel=1
epoch=1
pkgdesc="A small and lightweight implementation of the XDG Sound Theme Specification (32-bit)"
url="http://0pointer.de/lennart/projects/libcanberra"
arch=(x86_64)
license=(LGPL)
depends=(lib32-libvorbis lib32-libltdl lib32-alsa-lib lib32-libpulse lib32-tdb
         libcanberra)
makedepends=(gtk-doc lib32-gtk2 lib32-gtk3 git)
provides=(lib32-libcanberra-pulse libcanberra{,-gtk,-gtk3}.so)
replaces=("lib32-libcanberra-pulse<0.30+2+gc0620e4-4")
options=(libtool debug)
_commit=c0620e432650e81062c1967cc669829dbd29b310  # master
source=("git+http://git.0pointer.net/clone/libcanberra.git#commit=$_commit"
        libcanberra-multi-backend.patch)
sha256sums=('SKIP'
            'de146cae3e40a16b38c8edb4f1a3a423c64eb9c5000e36c316b677e9909c9b06')

pkgver() {
  cd libcanberra
  git describe --tags | sed 's/^v//;s/[^-]*-g/r&/;s/-/+/g'
}

prepare() {
  cd libcanberra

  # https://bugs.archlinux.org/task/71341
  # https://bugs.freedesktop.org/show_bug.cgi?id=51662
  git apply -3 ../libcanberra-multi-backend.patch

  ./autogen.sh
}

build() {
  cd libcanberra

  export CC="gcc -m32"
  export CXX="g++ -m32"
  export PKG_CONFIG=i686-pc-linux-gnu-pkg-config

  ./configure --sysconfdir=/etc --prefix=/usr --localstatedir=/var \
      --libdir=/usr/lib32 \
      --disable-static --with-builtin=dso --enable-null --disable-oss \
      --enable-alsa --enable-pulse \
      --with-systemdsystemunitdir=/usr/lib/systemd/system --enable-gtk-doc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package_lib32-libcanberra() {
  cd libcanberra

  make -j1 DESTDIR="$pkgdir" install

  rm "$pkgdir"/usr/lib32/*.la
  rm "$pkgdir"/usr/lib32/gtk-{2,3}.0/modules/*.la

  rm -r "$pkgdir"/usr/{include,share,bin,lib,lib32/gnome-settings-daemon-3.0}
}

# vim:set sw=2 et:
