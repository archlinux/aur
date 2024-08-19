# Maintainer: neocturne <mschiffer@universe-factory.net>

pkgname=fastd-git
arch=("x86_64")
pkgver=22.13.g2456f767edc6
pkgrel=2
pkgdesc="Fast and secure tunneling daemon (git version)"
makedepends=('git' 'meson')
depends=('glibc' 'libcap' 'libuecc>=6' 'libsodium' 'json-c' 'openssl' 'libmnl')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
url="https://github.com/neocturne/fastd/"
license=('BSD-2-Clause')
source=("git+https://github.com/neocturne/fastd.git")
sha512sums=('SKIP')
_gitname="fastd"

pkgver() {
  cd $_gitname
  git describe | sed -e 's/^v//' -e 's/-/./g'
}

build() {
  cd "$srcdir/$_gitname"
  rm -rf "$srcdir/build-${pkgver}"
  meson setup "$srcdir/build-${pkgver}" \
    -Dbuildtype=release \
    -Db_lto=true \
    -Dauto_features=enabled \
    -Dprefix=/usr

  cd "$srcdir/build-${pkgver}"
  ninja -v
}

package() {
  cd "$srcdir/build-${pkgver}"
  DESTDIR="${pkgdir}" ninja install

  install -dm755 "${pkgdir}/etc/fastd/"

  install -Dm644 "$srcdir/${_gitname}/COPYRIGHT" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "$srcdir/${_gitname}/doc/examples/fastd@.service" "${pkgdir}/usr/lib/systemd/system/fastd@.service"
  install -Dm644 "$srcdir/${_gitname}/doc/fastd.1" "${pkgdir}/usr/share/man/man1/fastd.1"
}
