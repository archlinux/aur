# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan de Groot <jgc@archlinux.org>
# Contributor: Kritoke <kritoke@nospam.gmail.com>

pkgname=gnome-blog
pkgver=0.9.2
pkgrel=1
pkgdesc="A gnome application that allows you to post entries to many different blog formats"
arch=('any')
url="https://projects.gnome.org/gnome-blog/"
license=('GPL')
depends=('python2-gconf' 'python2-gdata' 'python2-gtkspell')
makedepends=('intltool')
options=('!emptydirs')
source=(https://download.gnome.org/sources/$pkgname/${pkgver%.*}/$pkgname-$pkgver.tar.bz2
        drop-gnomevfs.patch
        drop-gnome.patch)
sha256sums=('d2b68017d31af7dcb29cddc16a1ad8f33f58bcc2834bb1740c47b4ef75856e80'
            '1082249b34c1e44ed14c1b359bc009160178b7fb1025455b71fa5717ef3ff53e'
            '232a9e98033865d1b7c011057e909916c7ab68244bfea577b73afd7c90fa5582')

prepare() {
  cd $pkgname-$pkgver

  # https://bugzilla.gnome.org/show_bug.cgi?id=612630
  patch -Np1 -i "$srcdir/drop-gnomevfs.patch"

  # https://bugzilla.gnome.org/show_bug.cgi?id=671579
  patch -Np1 -i "$srcdir/drop-gnome.patch"

  # python2 fix
  find . -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var --libexecdir=/usr/lib/$pkgname \
              --disable-schemas-install \
              --with-gconf-schema-file-dir=/usr/share/gconf/schemas \
              PYTHON=/usr/bin/python2
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install

  # Remove old GNOME 2 applet
  make DESTDIR="$pkgdir" uninstall-libexecSCRIPTS uninstall-serverDATA uninstall-uiDATA
}
