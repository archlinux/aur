# Maintainer: kharec <sandro@cazzaniga.fr>
pkgname=nixd
pkgver=2.9.3
pkgrel=1
pkgdesc='Nix language server'
arch=('x86_64')
url='https://github.com/nix-community/nixd'
license=('LGPL3')
depends=('nix' 'llvm' 'boost' 'nlohmann-json')
makedepends=('meson' 'ninja' 'pkgconf' 'gtest')
source=("$pkgname-$pkgver.tar.gz::https://github.com/nix-community/nixd/archive/refs/tags/$pkgver.tar.gz"
        "nixd-llvm19-compat.patch"
        "nixd-llvm-shared.patch")
sha256sums=('25cdadefa4dc1649121d6eb1c315c4f75ee79e0dd165bf25a38878a7f46b0426'
            'a2fc1f82264e43873a34e4742b456383f4a32fb474c5618da598f80e6895f8f1'
            'f551327c1e5e87b9d33642a0644073f1987fb37ebd25387689b28c537f28395d')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 -i "$srcdir/nixd-llvm19-compat.patch"
  patch -Np1 -i "$srcdir/nixd-llvm-shared.patch"
}

build() {
  cd "$pkgname-$pkgver"
  meson setup build --prefix=/usr --buildtype=release
  meson compile -C build
}

package() {
  cd "$pkgname-$pkgver"
  meson install -C build --destdir="$pkgdir"
}
