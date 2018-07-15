# $Id$
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Packager: Saren Arterius <saren@wtako.net>
# Patch origin: https://launchpadlibrarian.net/365705963/gjs_1.52.1-1ubuntu1.debdiff

_pkgname=gjs
pkgname=gjs-fix-leaks
pkgver=1.52.3
pkgrel=2
epoch=1
pkgdesc="Javascript Bindings for GNOME"
url="https://wiki.gnome.org/Projects/Gjs"
arch=(x86_64)
license=(GPL)
depends=(cairo gobject-introspection-runtime js52 gtk3)
makedepends=(gobject-introspection git autoconf-archive xorg-server-xvfb)
conflicts=(gjs)
provides=(gjs)
checkdepends=(valgrind)
_commit=9e63c335e84613a6e499c61aa1afcd5107c36b10  # tags/1.52.3^0
source=(
  "git+https://gitlab.gnome.org/GNOME/gjs.git#commit=$_commit"
  "fix-leaks-lp1672297-1-context-Add-API-to-force-GC-schedule.patch"
  "fix-leaks-lp1672297-2-object-Queue-a-forced-GC-when-toggling-down.patch"
  "https://src.fedoraproject.org/rpms/gjs/raw/f27/f/disable-destoyed-object-criticals.patch")
sha256sums=(
  'SKIP'
  '2f32d58d4408a1c9161a9affd77b062d202217ee645894b00323c0adae77e8f9'
  '0b1757b8175cfc78ec8d64f13730f21bc9b983a84e2081687f2bd0cd48c6bc91'
  'c65a1ef3b290c80c78b27a77dda8e08382989a7ca145abc85bbaf3082d46d167')

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $_pkgname
  patch -Np1 -i ../fix-leaks-lp1672297-1-context-Add-API-to-force-GC-schedule.patch
  patch -Np1 -i ../fix-leaks-lp1672297-2-object-Queue-a-forced-GC-when-toggling-down.patch
  ## Enable the patch below by removing its # if your system log get spammed.
  ## You need to also remove a line in check() function of this file
  # patch -Np1 -i ../disable-destoyed-object-criticals.patch
  NOCONFIGURE=1 ./autogen.sh
}

build() {
  cd $_pkgname
  ./configure \
    --prefix=/usr \
    --libexecdir=/usr/lib \
    --disable-static \
    --enable-compile-warnings=yes \
    --with-xvfb-tests
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool
  make
}

check() {
  cd $_pkgname
  ## Remove the line below if disable-destoyed-object-criticals.patch is enabled
  make -j1 check
}

package() {
  cd $_pkgname
  make DESTDIR="$pkgdir" install
}

