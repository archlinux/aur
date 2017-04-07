# Maintainer: twa022 <twa022 at gmail dot com>
# Contributor: SanskritFritz (gmail)
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Timm Preetz <timm@preetz.us>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: serendipoldius (AUR)

_pkgname=avant-window-navigator
pkgname=${_pkgname}-git
_pkg=awn
pkgver=0.4.2.r16.gb8c22488
pkgrel=1
pkgdesc='Customisable dock (git version)'
arch=('x86_64' 'i686')
url='https://launchpad.net/awn'
license=('GPL')
depends=('libdesktop-agnostic-git' 'libwnck' 'libgtop' 'gconf' 'python2-dbus' 'pygtk' 'python2-xdg' 'hicolor-icon-theme' 'xdg-utils' 'gtkmm')
makedepends=('gtk-doc' 'vala' 'intltool' 'gnome-common' 'git')
optdepends=('awn-extras-git: extra applets for awn')
provides=("${_pkgname}=${pkgver/\.r*/}")
conflicts=("${_pkgname}")
options=('!libtool')
source=("${_pkg}::git+https://github.com/p12tic/${_pkg}.git"
        '0001_fix_missing_declaration.patch')
sha256sums=('SKIP'
            '05292720be8b99a368d8f7deba916a558328b93404810fca9cfd3780499d0e0c')

pkgver() {
  cd "$srcdir/$_pkg"
  git describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkg"

  # Python2 fix
  sed -i 's@^#!.*python$@#!/usr/bin/python2@' awn-settings/awn_settings{.py,_helper.py,_launcher.py.in}
  sed -i 's/with("python"/with("python2"/' applet-activation/main.cc

  patch -uNp2 -r- -i ../0001_fix_missing_declaration.patch
}

build() {
  cd "$srcdir/$_pkg"
  PYTHON=/usr/bin/python2 ./autogen.sh
  PYTHON=/usr/bin/python2 ./configure --prefix=/usr --sysconfdir=/etc --disable-static --enable-gtk-doc
  make
}

package() {
  cd "$srcdir/$_pkg"

  make GCONF_DISABLE_MAKEFILE_SCHEMA_INSTALL=1 DESTDIR="$pkgdir" install

  install -m755 -d "$pkgdir/usr/share/gconf/schemas"
  gconf-merge-schema "$pkgdir/usr/share/gconf/schemas/awn.schemas" "$pkgdir"/etc/gconf/schemas/*.schemas
  rm -r "$pkgdir/etc"
}
