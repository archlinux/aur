# Maintainer:
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: Jan "heftig" Steffens <jan.steffens@gmail.com>
# Contributor: Daniel J Griffiths <ghost1227@archlinux.us>
# Contributor: Leo von Klenze <leo@von-klenze.de>

pkgname=libdesktop-agnostic
pkgver=0.3.92
pkgrel=8
pkgdesc='Provides an extensible config API, a unified virtual fs API, and a desktop item editor for GLib-based projects'
arch=('i686' 'x86_64')
url='https://launchpad.net/libdesktop-agnostic'
license=('GPL' 'LGPL')
depends=('pygtk')
makedepends=('intltool' 'vala' 'gconf' 'gobject-introspection')
optdepends=('gconf: gconf configuration backend')
options=('!libtool' '!strip')
backup=(etc/xdg/libdesktop-agnostic/desktop-agnostic.ini)
source=("https://launchpad.net/$pkgname/0.4/$pkgver/+download/$pkgname-$pkgver.tar.gz" megalo.patch ListStore.patch)

build() {
  cd "$srcdir/$pkgname-$pkgver"

  [ -d build ] && rm -R build
  [ -d gen_src ] && rm -R gen_src

  patch -Np0 -i ../megalo.patch
  patch -Np0 -i ../ListStore.patch

  export PYTHON=/usr/bin/python2
  python2 ./waf configure --prefix=/usr --sysconfdir=/etc \
                  --config-backends=gconf,keyfile \
                  --vfs-backends=gio \
                  --desktop-entry-backends=gio,glib
  python2 ./waf
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 ./waf install --destdir="$pkgdir"
}

md5sums=('42374d226a21d57637f97173f6b105a1'
         '9be8f4e706b933f456393a782d89d555'
         'fc0d00e48be5be46045307b4366408be')
