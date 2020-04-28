# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=vala
pkgname=${_pkgname}0.36
pkgver=0.36.20
pkgrel=1
pkgdesc='Compiler for the GObject type system (0.36 long term support branch)'
url='https://wiki.gnome.org/Projects/Vala'
arch=('x86_64' 'i686')
license=('LGPL')
depends=('glib2' 'gtk-doc' 'graphviz' 'ttf-font' 'pkg-config' 'gcc')
makedepends=('libxslt' 'vala' 'help2man' 'autoconf-archive')
checkdepends=('dbus' 'libx11' 'gobject-introspection')
provides=(libvala-${pkgver%.*}.so)
source=("https://download.gnome.org/sources/${_pkgname}/${pkgver%.*}/${_pkgname}-${pkgver}.tar.xz")
sha256sums=('be960a87841d85ff76cbd0e10eb691675190e54bd690d76982b3fb94a1fc67a7')

build() {
  cd "${_pkgname}-${pkgver}"
  ./configure --prefix=/usr
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd "${_pkgname}-${pkgver}"
  make check
}

package() {
  cd "${_pkgname}-${pkgver}"
  make DESTDIR="$pkgdir" install

  # Remove conflicting files with the vala package
  rm -rf "${pkgdir}/usr/share/aclocal"
  rm "${pkgdir}"/usr/lib/pkgconfig/vapigen.pc
  mkdir -p "${pkgdir}"/usr/lib/pkgconfig/vala-${pkgver%.*}
  for _f in libvala valadoc vapigen ; do
    ln -s ../${_f}-${pkgver%.*}.pc "${pkgdir}"/usr/lib/pkgconfig/vala-${pkgver%.*}/
  done
  ln -s ./vapigen-${pkgver%.*}.pc "${pkgdir}"/usr/lib/pkgconfig/vala-${pkgver%.*}/vapigen.pc
  rm "${pkgdir}"/usr/share/vala/Makefile.vapigen
  rm "${pkgdir}"/usr/bin/{vala,valac,vala-gen-introspect,vapicheck,vapigen}
  rm "${pkgdir}"/usr/share/man/man1/{valac,vala-gen-introspect,vapigen}.1
}
