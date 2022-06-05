# $Id$
# Original Maintainer: Jan de Groot <jgc@archlinux.org>
# Fork Maintainer: epitron <chris@ill-logic.com>

pkgname=glib2-quiet
pkgver=2.48.2
pkgrel=1
pkgdesc="A patched version of glib2, with spammy console WARNING messages disabled"
url="http://www.gtk.org/"
arch=(i686 x86_64)
depends=('pcre' 'libffi')
optdepends=('python: for gdbus-codegen and gtester-report'
            'libelf: gresource inspection tool')
makedepends=('pkg-config' 'python' 'pcre' 'libffi' 'libelf')
options=('!docs' '!emptydirs')
license=('LGPL')

# provides=('glib2')  #  Current pkgver is so old that it should not provide glib2 to Arch
conflicts=('glib2')

source=(http://ftp.gnome.org/pub/GNOME/sources/glib/${pkgver:0:4}/glib-$pkgver.tar.xz
        glib-compile-schemas.hook
        gio-querymodules.hook
        revert-warn-glib-compile-schemas.patch
        gmessages-nowarn.patch)

sha256sums=('f25e751589cb1a58826eac24fbd4186cda4518af772806b666a3f91f66e6d3f4'
            'e1123a5d85d2445faac33f6dae1085fdd620d83279a4e130a83fe38db52b62b3'
            '5ba204a2686304b1454d401a39a9d27d09dd25e4529664e3fd565be3d439f8b6'
            '049240975cd2f1c88fbe7deb28af14d4ec7d2640495f7ca8980d873bb710cc97'
            '3c5d812cd1e8905f89de14b0d5272e733c612a8c47bd648da97a3545a727044a')

prepare() {
  cd glib-$pkgver
  patch -Rp1 -i ../revert-warn-glib-compile-schemas.patch
  patch -p1 -i ../gmessages-nowarn.patch
}
  
build() {
  cd glib-$pkgver
  ./configure --prefix=/usr --libdir=/usr/lib \
      --sysconfdir=/etc \
      --with-pcre=system \
      --disable-fam
  make
}

check() {
  cd glib-$pkgver
  # Takes an effing long time
  #make -k check || :
}

package() {
  cd glib-$pkgver
  make completiondir=/usr/share/bash-completion/completions DESTDIR="$pkgdir" install

  chmod -x "$pkgdir"/usr/share/bash-completion/completions/*

  # Our gdb does not ship the required python modules, so remove it
  rm -r "$pkgdir/usr/share/gdb/"
  
  # install hooks
  install -dm755 "$pkgdir"/usr/share/libalpm/hooks/
  install -m644 "$srcdir"/{glib-compile-schemas,gio-querymodules}.hook "$pkgdir"/usr/share/libalpm/hooks/
}
