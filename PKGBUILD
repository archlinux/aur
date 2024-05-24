# Maintainer: Eric Long <i@hack3r.moe>

_pkgname=mimic
_pkgbase=$_pkgname-bpf
pkgname=($_pkgbase $_pkgbase-dkms)
pkgver=0.4.2
pkgrel=1
pkgdesc="eBPF UDP -> TCP obfuscator"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/hack3ric/$_pkgname"
license=('GPL-2.0-only')
makedepends=('git' 'clang' 'bpf' 'ruby-ronn-ng' 'libbpf' 'libffi')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/hack3ric/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('f2c7816fd8b087a7c72277fd220f5147c20d9676486ce3255d5275de3717d46c261ac679573bfc7694620964f6e8a7b9d263a0ee378ade8859678f6fbe5e7af8')

prepare() {
  cd $_pkgname-$pkgver
  sed install/mimic@.service.in \
		-e 's|@@MIMIC_EXEC@@|/usr/bin/mimic|' \
		-e 's|@@MIMIC_CONFIG_PATH@@|/etc/mimic|' \
    -e 's|@@MIMIC_RUNTIME_DIR@@|mimic|' \
		> install/mimic@.service
}

build() {
  cd $_pkgname-$pkgver
  make MODE=release build-cli generate-manpage
}

package_mimic-bpf() {
  depends=('glibc' 'gcc-libs' 'libbpf' 'libffi' $_pkgbase-modules=$pkgver)

  install -Dm755 "$srcdir/$_pkgname-$pkgver/out/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/$_pkgname-$pkgver/out/$_pkgname.1.gz" "$pkgdir/usr/share/man/man1/$_pkgname.1.gz"
  install -Dm644 "$srcdir/$_pkgname-$pkgver/install/eth0.conf.example" "$pkgdir/etc/mimic/eth0.conf.example"
  install -Dm644 "$srcdir/$_pkgname-$pkgver/install/$_pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
  install -Dm644 "$srcdir/$_pkgname-$pkgver/install/$_pkgname@.service" "$pkgdir/usr/lib/systemd/system/$_pkgname@.service"
}

package_mimic-bpf-dkms() {
  pkgdesc+=" - DKMS module"
  depends=('dkms')
  provides=($_pkgbase-modules=$pkgver)
  conflicts=($_pkgbase-modules=$pkgver)

  install -d "$pkgdir/usr/src/$_pkgname-$pkgver"
  cp -r "$srcdir/$_pkgname-$pkgver/kmod/"* "$pkgdir/usr/src/$_pkgname-$pkgver/"
}
