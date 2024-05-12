# Maintainer: Andre Kugland <kugland at gmail dot com>

_pkgname=bip39
pkgname=$_pkgname-git
pkgver=0.2.0.r1.6463895
pkgrel=1
pkgdesc="Generate mnemonic codes according to BIP-0039"
arch=('x86_64')
url="https://github.com/kugland/bip39"
license=('MIT')
depends=('libsodium')
makedepends=('git' 'meson')
checkdepends=('cunit')
conflicts=("$_pkgname")
source=("$_pkgname::git+https://github.com/kugland/bip39.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf '%s.r%s.%s' \
    "$(git describe --tags | perl -pe 's/^v//g')" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/$_pkgname"
  meson setup -Dprefix="$pkgdir/usr" build
  ninja -C build
}

check() {
  cd "$srcdir/$_pkgname"
  ninja -C build test
}

package() {
  cd "$srcdir/$_pkgname"
  ninja -C build install
  mkdir -p "$pkgdir/usr/share/doc/bip39" || true
  install -Dm644 README.md "$pkgdir/usr/share/doc/bip39/README.md"
}

