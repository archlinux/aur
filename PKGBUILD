# Maintainer: Eric Long <i@hack3r.moe>

_pkgname=mimic
_pkgbase=$_pkgname-bpf
pkgname=($_pkgbase $_pkgbase-dkms)
pkgver=0.4.1
pkgrel=2
pkgdesc="eBPF UDP -> TCP obfuscator"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/hack3ric/$_pkgname"
license=('GPL-2.0-only')
makedepends=('git' 'clang' 'bpf' 'ruby-ronn-ng' 'libbpf' 'libffi')
source=("https://github.com/hack3ric/$_pkgname/archive/refs/tags/v$pkgver.tar.gz")
b2sums=('6ebb1d477b71d5cb52064f460cb78636ad82249531b9eff33066dd5438feceb94c16341bd7e32a28684e1ba4b0ad134205246b469deb32eda9dba1bafeab0561')

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
