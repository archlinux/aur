# Maintainer: Alastair Pharo <asppsa at gmail dot com>
# Contributor: Felix Morgner <felix.morgner@gmail.com>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Mario Rodas
# Contributor: Oozyslug <oozyslug at gmail dot com>
# Contributor: koral <koral at mailoo dot org>
# Contributor: Anders Bennehag

pkgname=nix
pkgver=2.3.6
pkgrel=2
pkgdesc="A purely functional package manager"
arch=('i686' 'x86_64' 'armv7h')
url="https://nixos.org/nix"
license=('LGPL')
depends=('gc' 'libsodium' 'boost' 'brotli' 'editline')
optdepends=('archlinux-nix: tools to help with setup of Nix')
makedepends=('bzip2' 'openssl')
install=nix.install
source=("https://nixos.org/releases/nix/nix-$pkgver/nix-$pkgver.tar.xz"
        'ldflags.patch')
sha256sums=('05e90529c9dc9f4bf656cbceae61cafdca49935bb79cd291c8f078a095701d89'
            '42350237d98785b30b0ee099405f2f1f7412f8a816162c22bd232ed3dbbe0305')

prepare() {
  cd "$pkgname-$pkgver"
  patch --forward --strip=1 --input="${srcdir}/ldflags.patch"
}

build () {
  cd "$pkgname-$pkgver"
  CXXFLAGS='-D_GLIBCXX_USE_CXX11_ABI=0' ./configure --prefix=/usr \
              --libexecdir="/usr/lib/$pkgname" \
              --sysconfdir=/etc \
              --enable-gc
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
