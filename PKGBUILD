# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Simeon Felis <simeonfelis@gmail.com>

pkgname=eekboard-gtk2
_pkgname=eekboard
pkgver=1.0.8
pkgrel=5
pkgdesc='Yet Another Virtual Keyboard for Gnome. http://blog.du-a.org/?cat=9'
arch=(i686 x86_64)
url='https://github.com/ueno/eekboard'
license=(GPL3)
depends=('gtk2' 'libxklavier' 'libcanberra' 'dconf')
makedepends=('intltool' 'gtk-doc' 'gnome-common' 'gobject-introspection')
optdepends=('ibus' 'clutter-gtk')
provides=($_pkgname)
conflicts=($_pkgname)
source=("https://github.com/downloads/ueno/eekboard/eekboard-$pkgver.tar.gz"
        '0001-Revert-Drop-GTK2-support.patch'
        '0002-more-gtk2-reverts.patch'
        '0003-handle-missing-method-in-gtk2.patch')
md5sums=('83584689cd3353d2f471d01f4f5f2efd'
         'def53b919e778ddceabbad9fc35ed71d'
         'ed22aeda66e92ef2b89168fc5baef8b8'
         'b02d89302d86cd7ebc304babf64408bd')

prepare() {
  cd $_pkgname-$pkgver
  sed -i src/preferences-dialog.ui -e 's,GtkButtonBox,GtkHButtonBox,'
  patch -Np1 <../0001-Revert-Drop-GTK2-support.patch
  patch -Np1 <../0002-more-gtk2-reverts.patch
  patch -Np1 <../0003-handle-missing-method-in-gtk2.patch
}

build () {
  cd $_pkgname-$pkgver
  gnome-autogen.sh \
          --prefix=/usr \
          --sysconfdir=/etc \
          --libexecdir=/usr/lib \
          --enable-gtk-doc \
          --disable-vala \
          --with-gtk=2.0
  make PYTHON=/usr/bin/python2 V=0
}

package() {
  cd $_pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

