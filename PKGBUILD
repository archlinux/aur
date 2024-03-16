# Maintainer: Eric Long <i@hack3r.moe>

_pkgname=mimic
_pkgbase=$_pkgname-bpf
pkgname=($_pkgbase-git $_pkgbase-dkms-git)
pkgver=0.1.1.r92.a7dc2e6
pkgrel=2
pkgdesc="eBPF UDP -> TCP obfuscator"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/hack3ric/$_pkgname"
license=('GPL-2.0-only')
makedepends=('git' 'clang' 'bpf' 'libbpf' 'json-c')
source=("git+https://github.com/hack3ric/$_pkgname#branch=master")
b2sums=('SKIP')

pkgver() {
  cd $_pkgname
  # printf "r%s.%s\n" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  printf "%s" "$(git describe --dirty=-patched --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g' | sed 's/^v//')"
}

build() {
  cd $_pkgname
  make MODE=release out/$_pkgname
}

package_mimic-bpf-git() {
  depends=('glibc' 'libbpf' 'json-c' $_pkgbase-modules=$pkgver-$pkgrel)
  provides=($_pkgbase)
  conflicts=($_pkgbase)
  install -Dm755 "$srcdir/$_pkgname/out/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}

package_mimic-bpf-dkms-git() {
  depends=('dkms')
  provides=($_pkgbase-modules=$pkgver-$pkgrel $_pkgbase-dkms)
  conflicts=($_pkgbase-modules=$pkgver-$pkgrel $_pkgbase-dkms)
  install -d "$pkgdir/usr/src/$_pkgname-$pkgver"
  cp -r "$srcdir/$_pkgname/src/kmod/"* "$pkgdir/usr/src/$_pkgname-$pkgver/"
}
