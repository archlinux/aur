# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgbase="libgsf"
pkgbase="${_pkgbase}-git"
pkgname=("${pkgbase}" "${_pkgbase}-docs-git")
pkgver=1.14.52.r5.g634340d
pkgrel=1
pkgdesc="Extensible I/O abstraction library for dealing with structured file formats"
arch=('any')
url="https://gitlab.gnome.org/GNOME/${_pkgbase}"
license=('LGPL-2.1-only')
makedepends=('autoconf-archive' 'gdk-pixbuf2' 'git' 'gobject-introspection'
             'gtk-doc>=1.12')
checkdepends=('perl-xml-parser' 'unzip' 'valgrind')
_pkgsrc="${_pkgbase}"
source=("${_pkgsrc}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgsrc}"
  git describe --long --tags --abbrev=7 | sed 's/LIBGSF_//;s/_/./g;s/\([^-]*-g\)/r\1/;s/-/./g';
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  NOCONFIGURE=1 ./autogen.sh
  ./configure \
    --prefix='/usr' \
    --sysconfdir='/etc' \
    --localstatedir='/var' \
    --disable-static \
    --enable-introspection \
    --enable-gtk-doc \
    --with-bz2 \
    --with-gdk-pixbuf
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' "libtool"
  make
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  make check
}

package_libgsf-git() {
  arch=('x86_64')
  depends=('bzip2' 'gdk-pixbuf2' 'glib2>=2.36.0' 'glibc' 'libxml2>=2.4.16' 'zlib')
  optdepends=("${_pkgbase}-docs: HTML documentation")
  provides=("${_pkgbase}=${pkgver%%.r*}" 'libgsf-1.so')
  conflicts=("${_pkgbase}")

  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}/usr/share/gtk-doc"

  install -Dm644 "README"      "${pkgdir}/usr/share/doc/${_pkgbase}/README"
  install -Dm644 "NEWS"        "${pkgdir}/usr/share/doc/${_pkgbase}/NEWS"
  install -Dm644 "AUTHORS"     "${pkgdir}/usr/share/doc/${_pkgbase}/AUTHORS"
  install -Dm644 "MAINTAINERS" "${pkgdir}/usr/share/doc/${_pkgbase}/MAINTAINERS"
  install -Dm644 "BUGS"        "${pkgdir}/usr/share/doc/${_pkgbase}/BUGS"
  install -Dm644 "HACKING"     "${pkgdir}/usr/share/doc/${_pkgbase}/HACKING"

  install -Dm644 "COPYING"     "${pkgdir}/usr/share/licenses/${_pkgbase}/COPYING"
}

package_libgsf-docs-git() {
  pkgdesc="HTML documentation for ${_pkgbase}"
  provides=("${_pkgbase}-docs=${pkgver%%.r*}")
  conflicts=("${_pkgbase}-docs")

  cd "${srcdir}/${_pkgsrc}/doc"
  make DESTDIR="${pkgdir}" install-data-local
}
