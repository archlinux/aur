# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Allen Choong <allencch at hotmail dot com>

pkgbase=scanmem-git
pkgname=('scanmem-git' 'libscanmem-git' 'gameconqueror-git')
pkgver=0.17.1035.0cc3830
pkgrel=1
pkgdesc='Memory scanner designed to isolate the address of an arbitrary variable in an executing process'
url='https://github.com/scanmem/scanmem'
arch=('x86_64')
license=('GPL3')
makedepends=('git' 'intltool' 'gtk3' 'python-gobject' 'polkit' 'glibc' 'readline')
options=('!emptydirs')
source=(${pkgbase}::git+https://github.com/scanmem/scanmem.git)
sha512sums=('SKIP')

pkgver() {
  cd ${pkgbase}
  printf "%s.%s.%s" "$(git tag|sort|tail -n1|sed -r 's|-|.|g'|sed -r 's|v?(.*)|\1|')" \
    "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd ${pkgbase}
  ./autogen.sh
}

build() {
  cd ${pkgbase}
  ./configure --enable-gui --prefix=/usr
  make
}

check() {
  cd ${pkgbase}
  make check
}

package_scanmem-git() {
  depends=('libscanmem' 'glibc' 'readline')
  provides=('scanmem')
  conflicts=('scanmem')

  cd ${pkgbase}
  make DESTDIR="${pkgdir}" install
  rm -r "${pkgdir}/usr/"{include,lib}
  rm -rf "${pkgdir}/usr/share/"{gameconqueror,appdata,applications,icons,locale,polkit-1}
  rm "${pkgdir}"{/usr/bin/gameconqueror,/usr/share/man/man1/gameconqueror.1}
}

package_libscanmem-git() {
  depends=('readline')
  pkgdesc+=" (library)"
  provides=('libscanmem')
  conflicts=('libscanmem')

  cd ${pkgbase}
  make DESTDIR="${pkgdir}" install
  rm -r "${pkgdir}/usr/bin"
  rm -r "${pkgdir}/usr/share"
}

package_gameconqueror-git() {
  depends=('libscanmem' 'gtk3' 'python' 'python-gobject' 'polkit')
  pkgdesc+=" (gtk GUI)"
  provides=('gameconqueror')
  conflicts=('gameconqueror')

  cd ${pkgbase}
  make DESTDIR="${pkgdir}" install
  rm -r "${pkgdir}/usr/"{include,lib,share/doc}
  rm "${pkgdir}"{/usr/bin/scanmem,/usr/share/man/man1/scanmem.1}
}

# vim: ts=2 sw=2 et:
