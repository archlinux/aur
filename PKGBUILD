# Maintainer:
# Contributor: Balló György <ballogyor+arch at gmail dot com>
# Contributor: nifan <carlos@nifan.tk>
# Contributor: Roman Kyrylych <roman@archlinux.org>

pkgname=gdesklets
pkgver=0.36.3
pkgrel=9
pkgdesc="System for bringing mini programs (desklets) onto your desktop"
arch=('x86_64')
url="https://launchpad.net/gdesklets"
license=('GPL') 
depends=('libgtop' 'pygtk')
makedepends=('intltool')
source=(https://launchpad.net/gdesklets/0.3x/release-of-$pkgver/+download/$pkgname-$pkgver.tar.bz2
        gdesklets-core-0.36.3-.in-files.patch
        fix-vfs.patch
        make-gconf-optional.patch
        gdesklets-checkrequirements.patch
        gdesklets-nopyorbit.patch)
md5sums=('60c0c4e7301b3e653702b6fe5bf7e698'
         '27839bbefc2f6664ff31cff2d48dfeed'
         '55ac07d16a571f29033495307c4d0f0c'
         '45e81dd0fb20157bb840d006c3a4e2ea'
         '00357de7be85d2842342fe0967943eb9'
         '3815a29c307c92ec5b427b3152a21714')

prepare() {
  cd $pkgname-$pkgver

  # Build fix
  patch -Np0 -i ../gdesklets-core-0.36.3-.in-files.patch

  # Runtime fix without gnome-vfs
  patch -Np1 -i ../fix-vfs.patch

  # Make gconf dependency optional
  patch -Np1 -i ../make-gconf-optional.patch

  # Remove gnome-python and pyorbit dependencies
  patch -Np1 -i ../gdesklets-nopyorbit.patch

  # Remove check for pyorbit, make bonobo.ui optional
  patch -Np1 -i ../gdesklets-checkrequirements.patch

  # Python2 fix
  find . -type f | xargs sed -i 's@^#!.*python$@#!/usr/bin/python2@'
  sed -i 's/python -c/$PYTHON -c/' configure.ac
  sed -i 's/python/python2/' shell/plugins/PackageInstaller/__init__.py

  autoreconf -fi
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
              --disable-update-check PYTHON=python2

  #https://bugzilla.gnome.org/show_bug.cgi?id=656231
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}
