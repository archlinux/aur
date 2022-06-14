# Maintainer: <thysupremematrix at tuta dot io>
pkgname=gamin-git
pkgver=0.1.10.6.r0.g905a5bf
pkgrel=1
pkgdesc='File and directory monitoring system defined to be a subset of the FAM (File Alteration Monitor) [git version]'
url="https://salsa.debian.org/gnome-team/gamin"
license=('GPL')
arch=('x86_64' 'i686')
depends=('glib2')
makedepends=('python2' 'git')
optdepends=('python2: for the python module')
provides=('fam' "gamin")
conflicts=('fam' "gamin")
source=("git+${url}.git"
        'fix-deprecated-const.patch'
        '18_gam_server_deadlocks.patch'
        '0001-Poll-files-on-nfs4.patch')
sha256sums=('SKIP'
            '33af6c9a94b459506fc48892c169d89cb4ad7c68e160f0c4bc74475f19ce5a2f'
            '041eb7fb21d83c50ee5ab8b51e7dc81cce352761355a66e89e8fd0617f113b50'
            '49806b9788dd3c3f362057f7d2919c956ba88c4750867ebab295e6d678c86e1c')
_gitname=gamin

pkgver(){
  cd $srcdir/$_gitname
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s@.*/@@'
}
prepare() {
  cd $srcdir/$_gitname

  # https://bugs.archlinux.org/task/33642
  patch -Np1 -i ../18_gam_server_deadlocks.patch

  patch -Np1 -i ../fix-deprecated-const.patch
  patch -Np1 -i ../0001-Poll-files-on-nfs4.patch

  # python 2
  sed -i 's_#!/usr/bin/env python_#!/usr/bin/env python2_' python/gamin.py
}

build() {
  cd $srcdir/$_gitname
  ./configure --prefix=/usr --disable-static --with-threads \
    --disable-debug-api --disable-debug --libexecdir=/usr/lib/gamin \
    --with-python=/usr/bin/python2
  make
}

package() {
  cd $srcdir/$_gitname
  make DESTDIR="$pkgdir" install
}
