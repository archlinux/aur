# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Florian Pritz <flo@xssn.at>
# Contributor: Jan de Groot <jgc@archlinux.org>

pkgname=lib32-libcanberra-gtk3
pkgver=0.30
pkgrel=2
pkgdesc='A small and lightweight implementation of the XDG Sound Theme Specification'
arch=('x86_64')
url='http://0pointer.de/lennart/projects/libcanberra'
license=('LGPL')
depends=('lib32-gtk3' 'lib32-libcanberra')
makedepends=('gcc-multilib' 'git' 'gtk-doc' 'libtool-multilib')
source=('git://git.0pointer.de/libcanberra.git#commit=c0620e4')
sha256sums=('SKIP')

prepare() {
  cd libcanberra

  ./autogen.sh
}

build() {
  cd libcanberra

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --localstatedir='/var' \
    --sysconfdir='/etc' \
    --with-builtin='dso' \
    --disable-{alsa,gstreamer,gtk,oss,pulse,udev} \
    --disable-static

  # Fight unused direct deps
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool

  make
}

package() {
  cd libcanberra

  make -j1 DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,lib32/{gnome-settings-daemon-3.0,libcanberra-0.30,libcanberra.so*,pkgconfig/libcanberra.pc},share}
}

# vim: ts=2 sw=2 et:
