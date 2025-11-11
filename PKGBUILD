# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>

_pkgname=libcanberra
pkgname=libcanberra-gtk2
pkgver=0.30+r2+gc0620e4
pkgrel=5
epoch=1
pkgdesc="A small and lightweight implementation of the XDG Sound Theme Specification"
url="https://0pointer.net/lennart/projects/libcanberra/"
arch=(x86_64)
license=(LGPL)
depends=(libvorbis libltdl alsa-lib libpulse tdb sound-theme-freedesktop)
makedepends=(gtk-doc gtk2 gtk3 git)
optdepends=('gtk3: canberra-gtk-play')
provides=(libcanberra-pulse libcanberra{,-gtk,-gtk3}.so "$_pkgname")
conflicts=("$_pkgname")
replaces=("libcanberra-pulse<0.30+2+gc0620e4-4")
options=(libtool)
_commit=c0620e432650e81062c1967cc669829dbd29b310  # master
source=("git+https://git.0pointer.net/clone/libcanberra.git#commit=$_commit"
        40-libcanberra-gtk-module.sh
        libcanberra-multi-backend.patch)
sha256sums=('SKIP'
            'a0d0b135d3fea5c703a5f84208b79d66f671b082ae85f67b629ee2568a7ddc30'
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
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
      --disable-static --with-builtin=dso --enable-null --disable-oss \
      --enable-alsa --enable-pulse \
      --with-systemdsystemunitdir=/usr/lib/systemd/system --enable-gtk-doc
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

package() {
  cd libcanberra

  make -j1 DESTDIR="$pkgdir" install

  rm "$pkgdir"/usr/lib/*.la
  rm "$pkgdir"/usr/lib/gtk-{2,3}.0/modules/*.la

  # FS#52370: Remove login, logout and system-ready sounds.
  # We have no sound themes that include these so do not play them.
  rm -r "$pkgdir"/usr/share/{gnome,gdm}

  install -Dt "$pkgdir/etc/X11/xinit/xinitrc.d" ../40-libcanberra-gtk-module.sh
}

# vim:set sw=2 sts=-1 et:
