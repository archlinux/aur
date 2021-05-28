# Maintainer: Steven Allen <steven@stebalien.com>
pkgname=localtime-git
pkgver=r44.541590b
pkgrel=2
pkgdesc="Automatic Timezone Updater"
arch=('any')
url="http://stebalien.com/projects/localtime/"
license=('GPL3')
depends=('dbus' 'geoclue2' 'systemd>=235' 'polkit')
makedepends=('git' 'go')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://github.com/Stebalien/localtime.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  echo "r$(git rev-list --count HEAD).$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  make PREFIX=/usr DESTDIR="$pkgdir"
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make PREFIX=/usr DESTDIR="$pkgdir" install

  # Fix permissions
  chmod -R u=rwX,g=rX,o=- "$pkgdir/usr/share/polkit-1/rules.d/"
  chgrp -R polkitd "$pkgdir/usr/share/polkit-1/rules.d/"
}
