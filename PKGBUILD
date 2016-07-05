# $Id: PKGBUILD 266206 2016-04-27 11:04:57Z allan $
# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>

_gitname=shared-mime-info
pkgname=shared-mime-info-git
pkgver=1.6.r41.gc3430af
pkgrel=1
pkgdesc="Freedesktop.org Shared MIME Info"
arch=('i686' 'x86_64')
license=('GPL2')
conflicts=('shared-mime-info')
provides=('shared-mime-info')
depends=('libxml2' 'glib2')
makedepends=('intltool' 'pkgconfig')
install=shared-mime-info.install
url="http://freedesktop.org/Software/shared-mime-info"
source=('git+https://anongit.freedesktop.org/git/xdg/shared-mime-info.git'
        update-mime-database.hook)
md5sums=('SKIP'
         'fc48155d8fb2147b8fc72597e79936b4')
options=(!makeflags)

pkgver() {
  cd "${_gitname}"

  git describe --long | sed 's/^Release-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_gitname}"

  ./autogen.sh --prefix=/usr --disable-update-mimedb
  make
}

check() {
  cd "${_gitname}"

  make -k check
}

package() {
  cd "${_gitname}"

  make DESTDIR="${pkgdir}" install

  install -Dm644 "$srcdir"/update-mime-database.hook "$pkgdir"/usr/share/libalpm/hooks/update-mime-database.hook
}
