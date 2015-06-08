# $Id$
# Maintainer: Realex
# Based on nemo PKGBUILD

_pkgname=nemo
pkgname=${_pkgname}-dev
pkgver=784.676b171
pkgrel=1
pkgdesc="Cinnamon file manager (Nautilus fork)"
arch=('i686' 'x86_64')
url="https://github.com/linuxmint/nemo"
license=('GPL')
depends=('libexif' 'gvfs' 'dconf' 'desktop-file-utils' 'exempi' 'python2'
         'cinnamon-desktop-git' 'gnome-icon-theme' 'libnotify' 'libxml2'
         'cinnamon-translations-git')
makedepends=('git' 'gtk-doc' 'gobject-introspection' 'intltool' 'gnome-common' 'python2-gobject'
         'python2-polib')
optdepends=('nemo-dropbox-git: Dropbox integration'
            'nemo-fileroller-git: File Roller integration'
            'gksu: Open as Root'
            'gnome-polkit: Open as Root')
provides=('nemo' 'nemo-fm' 'nautilus')
conflicts=(${_pkgname} 'nemo-fm')
options=('!emptydirs' '!libtool')
install=${pkgname}.install
source=('git://github.com/linuxmint/nemo.git')
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${_pkgname}"
  echo $(git rev-list --count master).$(git rev-parse --short master)
}

prepare() {
  cd "$srcdir/${_pkgname}"

  # Python2 fix
  sed -i 's/bin\/python/bin\/python2/g' files/usr/share/nemo/actions/myaction.py
  find -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'

  # Fix desktop style with Adwaita theme
  sed -i 's/add_class (\(.*\), "nemo-/add_class (\1, "nautilus-/' \
    libnemo-private/nemo-icon-{canvas-item,container}.c

  # Fix build
  sed -i '/AC_SUBST(DISABLE_DEPRECATED_CFLAGS)/d' configure.in

  # Rename 'Files' app name to avoid having the same as nautilus
  sed -i 's/^Name\(.*\)=.*/Name\1=Nemo/' data/nemo.desktop.in.in
}

build() {
  cd "$srcdir/${_pkgname}"

  ./autogen.sh --prefix=/usr --sysconfdir=/etc \
      --localstatedir=/var --disable-static \
      --libexecdir=/usr/lib/nemo \
      --disable-update-mimedb \
      --disable-tracker \
      --disable-gtk-doc-html \
      --disable-schemas-compile
  make
}

package() {
  cd "$srcdir/${_pkgname}"
  make DESTDIR="$pkgdir/" install
}
