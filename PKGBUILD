# Maintainer: Eric Long <i@hack3r.moe>

_pkgname=mimic
_pkgbase=$_pkgname-bpf
pkgname=($_pkgbase-git $_pkgbase-dkms-git)
pkgver=0.6.3.r2.5c8cf13
pkgrel=1
pkgdesc="eBPF UDP -> TCP obfuscator"
arch=('x86_64' 'aarch64' 'riscv64')
url="https://github.com/hack3ric/$_pkgname"
license=('GPL-2.0-only')
makedepends=('git' 'clang' 'bpf' 'ruby-ronn-ng' 'libbpf' 'libffi' 'libxdp')
source=("git+https://github.com/hack3ric/$_pkgname#branch=master")
b2sums=('SKIP')

pkgver() {
  cd $_pkgname
  printf "%s" "$(git describe --dirty=-patched --tags --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g' | sed 's/^v//')"
}

prepare() {
  cd $_pkgname
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
  cd $_pkgname
  make MODE= build-cli generate-manpage
}

package_mimic-bpf-git() {
  depends=('glibc' 'gcc-libs' 'libbpf' 'libffi' $_pkgbase-modules=$pkgver)
  optdepends=('libxdp: Load multiple XDP programs on one network interface')
  provides=($_pkgbase)
  conflicts=($_pkgbase)

  install -Dm755 "$srcdir/$_pkgname/out/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/$_pkgname/out/$_pkgname.1.gz" "$pkgdir/usr/share/man/man1/$_pkgname.1.gz"
  install -Dm644 "$srcdir/$_pkgname/install/$_pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
  install -Dm644 "$srcdir/$_pkgname/install/$_pkgname@.service" "$pkgdir/usr/lib/systemd/system/$_pkgname@.service"
}

package_mimic-bpf-dkms-git() {
  pkgdesc+=" - DKMS module"
  depends=('dkms')
  provides=($_pkgbase-modules=$pkgver $_pkgbase-dkms)
  conflicts=($_pkgbase-modules=$pkgver $_pkgbase-dkms)

  install -d "$pkgdir/usr/src/$_pkgname-$pkgver"
  cp -r "$srcdir/$_pkgname/kmod/"* "$pkgdir/usr/src/$_pkgname-$pkgver/"
}
