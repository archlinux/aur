# Maintainer: Eric Long <i@hack3r.moe>

_pkgname=mimic
_pkgbase=$_pkgname-bpf
pkgname=($_pkgbase-git $_pkgbase-dkms-git)
pkgver=0.1.1.r117.17015ab
pkgrel=1
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

prepare() {
  cd $_pkgname
  sed install/mimic@.service.in \
		-e 's|@@MIMIC_EXEC@@|/usr/bin/mimic|' \
		-e 's|@@MIMIC_CONFIG_PATH@@|/etc/mimic|' \
		> install/mimic@.service
}

build() {
  cd $_pkgname
  make MODE=release out/$_pkgname
}

package_mimic-bpf-git() {
  depends=('glibc' 'gcc-libs' 'libbpf' 'json-c' $_pkgbase-modules=$pkgver)
  provides=($_pkgbase)
  conflicts=($_pkgbase)

  install -Dm755 "$srcdir/$_pkgname/out/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/$_pkgname/install/eth0.conf.example" "$pkgdir/etc/mimic/eth0.conf.example"
  install -Dm644 "$srcdir/$_pkgname/install/$_pkgname@.service" "$pkgdir/usr/lib/systemd/system/$_pkgname@.service"
}

package_mimic-bpf-dkms-git() {
  depends=('dkms')
  provides=($_pkgbase-modules=$pkgver $_pkgbase-dkms)
  conflicts=($_pkgbase-modules=$pkgver $_pkgbase-dkms)

  install -d "$pkgdir/usr/src/$_pkgname-$pkgver"
  cp -r "$srcdir/$_pkgname/src/kmod/"* "$pkgdir/usr/src/$_pkgname-$pkgver/"
}
