pkgname=pkcs11-provider
#_commit=58040b4e32975cc1d7f39e424ee7b0097cd11311
pkgver=0.5
pkgrel=1
pkgdesc="OpenSSL 3.0 provider for PKCS#11 hardware-backed private keys"
url="https://github.com/latchset/pkcs11-provider"
arch=(x86_64)
license=(Apache-2.0)
depends=(
  "openssl>=3.0.7"
  p11-kit
)
makedepends=(
  gcc
  git
  meson
)
checkdepends=(
  expect
  gnutls
  nss
  opensc
  softhsm
)
#source=("git+https://github.com/latchset/pkcs11-provider#commit=$_commit")
source=("https://github.com/latchset/pkcs11-provider/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz"
        "https://github.com/latchset/pkcs11-provider/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz.asc")
sha256sums=('6815de8c6d15bed8f72f65bf8d73efd7d013f17460a77c457a3ed7c679809cfc'
            'SKIP')
validpgpkeys=('7C7BD146943B206BB645B64594EAD67E004B65AB')

#pkgver() {
#  cd $pkgname
#  git describe --tags | sed "s/^v//; s/-/.r/; s/-/./"
#}
#
#prepare() {
#  cd $pkgname
#  autoreconf -fi
#}

build() {
  cd $pkgname-$pkgver
  meson setup build --wipe --prefix=/usr --sysconfdir=/etc
  meson compile -C build
}

check() {
  cd $pkgname-$pkgver
  meson test -C build
}

package() {
  cd $pkgname-$pkgver
  meson install -C build --destdir="$pkgdir"
  install -Dm644 README.md "$pkgdir"/usr/share/doc/pkcs11-provider/README.md
}

# vim: ts=2:sw=2:et
