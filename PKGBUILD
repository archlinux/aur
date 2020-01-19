# Maintainer: AndyRTR <andyrtr@archlinux.org>
# Maintainer: Jan de Groot <jgc@archlinux.org>

pkgname=shared-mime-info
pkgver=1.15
pkgrel=2
pkgdesc="Freedesktop.org Shared MIME Info"
arch=('x86_64')
license=('GPL2')
depends=('libxml2' 'glib2')
makedepends=('itstool' 'gettext')
install=shared-mime-info.install
url="https://www.freedesktop.org/wiki/Specifications/shared-mime-info-spec/"
source=(https://gitlab.freedesktop.org/xdg/shared-mime-info/uploads/b27eb88e4155d8fccb8bb3cd12025d5b/$pkgname-$pkgver.tar.xz
        update-mime-database.hook)
sha256sums=('f482b027437c99e53b81037a9843fccd549243fd52145d016e9c7174a4f5db90'
            '58ed2c38bf2c78276a309d2e24040ed159868b0f04e72a6b039ea803e45ff6f0')
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
