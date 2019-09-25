# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=shared-mime-info
pkgver=1.14
pkgrel=1
pkgdesc="Freedesktop.org Shared MIME Info"
arch=('x86_64')
license=('GPL2')
depends=('libxml2' 'glib2')
makedepends=('itstool' 'gettext')
install=shared-mime-info.install
url="https://www.freedesktop.org/wiki/Specifications/shared-mime-info-spec/"
source=(https://gitlab.freedesktop.org/xdg/shared-mime-info/uploads/aee9ae9646cbef724bbb1bd2ba146556/$pkgname-$pkgver.tar.xz
        update-mime-database.hook)
sha256sums=('c573e9cae423669878b990e5e4790bc924119841f482b36a25fd751147f44a26'
            '7ecdd55ff7c4331e188cf46debbcc5660edb0e2bbeb4dd87cc5b87278c292821')
options=(!makeflags)

build() {
  cd ${pkgname}-${pkgver}
  # https://bugs.archlinux.org/task/38836
  # https://bugs.freedesktop.org/show_bug.cgi?id=70366
  export ac_cv_func_fdatasync=no
  ./configure --prefix=/usr --disable-update-mimedb
  make
}

check() {
  cd ${pkgname}-${pkgver}
  make -k check
}

package() {
  cd ${pkgname}-${pkgver}
  make DESTDIR="${pkgdir}" install

  install -Dm644 "$srcdir"/update-mime-database.hook "$pkgdir"/usr/share/libalpm/hooks/update-mime-database.hook
}
