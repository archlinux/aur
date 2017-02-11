# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=shared-mime-info
pkgver=1.8
pkgrel=1
pkgdesc="Freedesktop.org Shared MIME Info"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('libxml2' 'glib2')
makedepends=('intltool' 'pkgconfig')
install=shared-mime-info.install
url="https://freedesktop.org/Software/shared-mime-info"
source=(https://freedesktop.org/~hadess/${pkgname}-${pkgver}.tar.xz
        update-mime-database.hook)
sha256sums=('2af55ef1a0319805b74ab40d331a3962c905477d76c086f49e34dc96363589e9'
            '7ecdd55ff7c4331e188cf46debbcc5660edb0e2bbeb4dd87cc5b87278c292821')
options=(!makeflags)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # https://bugs.archlinux.org/task/38836
  # https://bugs.freedesktop.org/show_bug.cgi?id=70366
  export ac_cv_func_fdatasync=no
  ./configure --prefix=/usr --disable-update-mimedb
  make
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make -k check
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install

  install -Dm644 "$srcdir"/update-mime-database.hook "$pkgdir"/usr/share/libalpm/hooks/update-mime-database.hook
}
