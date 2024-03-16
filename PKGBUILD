# Maintainer: Eric Long <i@hack3r.moe>

_pkgname=mimic
_pkgbase=$_pkgname-bpf
pkgname=($_pkgbase $_pkgbase-dkms)
pkgver=0.1.1
pkgrel=3
pkgdesc="eBPF UDP -> TCP obfuscator"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/hack3ric/$_pkgname"
license=('GPL-2.0-only')
makedepends=('git' 'clang' 'bpf' 'libbpf')
source=("git+https://github.com/hack3ric/$_pkgname#tag=v$pkgver")
b2sums=('SKIP')

build() {
  cd $_pkgname
  make MODE=release out/$_pkgname
}

package_mimic-bpf() {
  depends=('glibc' 'libbpf' $_pkgbase-modules=$pkgver-$pkgrel)
  install -Dm755 "$srcdir/$_pkgname/out/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

package_mimic-bpf-dkms() {
  depends=('dkms')
  provides=($_pkgbase-modules=$pkgver-$pkgrel)
  conflicts=($_pkgbase-modules=$pkgver-$pkgrel)
  install -d "$pkgdir/usr/src/$_pkgname-$pkgver"
  cp -r "$srcdir/$_pkgname/src/kmod/"* "$pkgdir/usr/src/$_pkgname-$pkgver/"
}
