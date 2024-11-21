# Maintainer: Eric Long <i@hack3r.moe>

_pkgname=mimic
_pkgbase=$_pkgname-bpf
pkgname=($_pkgbase $_pkgbase-dkms)
pkgver=0.6.0
pkgrel=1
pkgdesc="eBPF UDP -> TCP obfuscator"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/hack3ric/$_pkgname"
license=('GPL-2.0-only')
makedepends=('git' 'clang' 'bpf' 'ruby-ronn-ng' 'libbpf' 'libffi')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/hack3ric/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('8112687fc106c5c4a718fea9dda1f8dfa857df344723a5cc5e022d80080da7949d029c2868a689ba40f4d6894e952ce181231d6743d799c89874acd985402765')

prepare() {
  cd $_pkgname-$pkgver
  sed install/mimic@.service.in \
		-e 's|@@MIMIC_EXEC@@|/usr/bin/mimic|' \
		-e 's|@@MIMIC_CONFIG_PATH@@|/etc/mimic|' \
    -e 's|@@MIMIC_RUNTIME_DIR@@|mimic|' \
		> install/mimic@.service
  sed kmod/dkms.conf.in \
    -e 's|@@EXTRA_OPTS@@||' \
    > kmod/dkms.conf
}

build() {
  cd $_pkgname-$pkgver
  make MODE= build-cli generate-manpage
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
