# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: jtts <jussaar@mbnet.fi>
# Contributor: GordonGR <gordongr@freemail.gr>

pkgname=lib32-polkit
pkgver=0.114
pkgrel=1
pkgdesc='Application development toolkit for controlling system-wide privileges'
arch=('x86_64')
license=('LGPL')
url='https://www.freedesktop.org/wiki/Software/polkit/'
depends=('lib32-expat' 'lib32-glib2' 'lib32-pam' 'lib32-systemd' 'polkit')
makedepends=('autoconf-archive' 'gcc-multilib' 'git' 'gobject-introspection'
             'gtk-doc' 'intltool')
_commit='ed06baed179166389d536420a6fc532781d48178' # tags/0.114^0
source=("git+https://anongit.freedesktop.org/git/polkit#commit=$_commit")
sha256sums=('SKIP')

pkgver() {
  cd polkit

  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd polkit

  git cherry-pick -n 373705b35e7f6c7dc83de5e0a3ce11ecd15d0409
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd polkit

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --sysconfdir='/etc' \
    --libdir='/usr/lib32' \
    --localstatedir='/var' \
    --libexecdir='/usr/lib32' \
    --disable-static \
    --enable-libsystemd-login='yes' \
    --with-os-type='redhat'

  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make -C src/polkit polkitenumtypes.h
  make -C src/polkit libpolkit-gobject-1.la
  make -C src/polkitagent polkitagentenumtypes.h marshal.stamp
  make -C src/polkitagent libpolkit-agent-1.la
}

package() {
  cd polkit

  make -C src/polkit DESTDIR="${pkgdir}" lib_LTLIBRARIES='libpolkit-gobject-1.la' install-libLTLIBRARIES
  make -C src/polkitagent DESTDIR="${pkgdir}" lib_LTLIBRARIES='libpolkit-agent-1.la' install-libLTLIBRARIES
  make -C data DESTDIR="${pkgdir}" install-pkgconfigDATA
}

# vim: ts=2 sw=2 et:
