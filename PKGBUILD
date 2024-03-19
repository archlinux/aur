# Maintainer: Eric Long <i@hack3r.moe>

_pkgname=mimic
_pkgbase=$_pkgname-bpf
pkgname=($_pkgbase $_pkgbase-dkms)
pkgver=0.2.1
pkgrel=1
pkgdesc="eBPF UDP -> TCP obfuscator"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/hack3ric/$_pkgname"
license=('GPL-2.0-only')
makedepends=('git' 'clang' 'bpf' 'libbpf' 'json-c')
source=("https://github.com/hack3ric/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('b6e18fd68975288d2e1107e6ed3fb5f016cccc8feabfbf976c439b6a628bdaf87e74c10b829cfa33ffc44fa7fb8e4cc7614045099d953b225de1e6e82412dc50')

prepare() {
  cd $_pkgname-$pkgver
  sed install/mimic@.service.in \
		-e 's|@@MIMIC_EXEC@@|/usr/bin/mimic|' \
		-e 's|@@MIMIC_CONFIG_PATH@@|/etc/mimic|' \
		> install/mimic@.service
}

build() {
  cd $_pkgname-$pkgver
  make MODE=release out/$_pkgname
}

package_mimic-bpf() {
  depends=('glibc' 'gcc-libs' 'libbpf' 'json-c' $_pkgbase-modules=$pkgver)

  install -Dm755 "$srcdir/$_pkgname-$pkgver/out/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/$_pkgname-$pkgver/install/eth0.conf.example" "$pkgdir/etc/mimic/eth0.conf.example"
  install -Dm644 "$srcdir/$_pkgname-$pkgver/install/$_pkgname@.service" "$pkgdir/usr/lib/systemd/system/$_pkgname@.service"
}

package_mimic-bpf-dkms() {
  pkgdesc+=" - DKMS module"
  depends=('dkms')
  provides=($_pkgbase-modules=$pkgver)
  conflicts=($_pkgbase-modules=$pkgver)

  install -d "$pkgdir/usr/src/$_pkgname-$pkgver"
  cp -r "$srcdir/$_pkgname-$pkgver/src/kmod/"* "$pkgdir/usr/src/$_pkgname-$pkgver/"
}
