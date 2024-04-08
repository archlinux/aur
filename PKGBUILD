# Maintainer: Eric Long <i@hack3r.moe>

_pkgname=mimic
_pkgbase=$_pkgname-bpf
pkgname=($_pkgbase $_pkgbase-dkms)
pkgver=0.3.0
pkgrel=1
pkgdesc="eBPF UDP -> TCP obfuscator"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/hack3ric/$_pkgname"
license=('GPL-2.0-only')
makedepends=('git' 'clang' 'bpf' 'libbpf' 'json-c' 'libffi')
source=("https://github.com/hack3ric/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('c75e57b4f307289ea1fed3d5376b76431b413b734d861a56ef564817d6972a20e60a2df479614c75a24e32b5845358a945b5f998d6e4a1e00b2f7cb342f8ee7d')

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
  depends=('glibc' 'gcc-libs' 'libbpf' 'json-c' 'libffi' $_pkgbase-modules=$pkgver)

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
