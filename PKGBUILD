# Maintainer: Neo_Chen <chenkolei@gmail.com>

_pkgbase=ryzen_smu
pkgname=ryzen_smu_vermeer_phoenix-git
pkgver=0.2.1.r217.g2f54a4b
pkgrel=1
pkgdesc="AMD Ryzen SMU driver (DKMS) with a PM table monitor for Vermeer and Phoenix"
arch=('x86_64')
url="https://github.com/NeoChen1024/ryzen_smu"
license=('GPL-2.0-only' 'GPL-3.0-or-later')
depends=('dkms' 'glibc')
makedepends=('git')
optdepends=('sudo: lets monitor_cpu elevate itself when not run as root')
provides=('ryzen_smu' 'ryzen_smu-dkms')
conflicts=('ryzen_smu' 'ryzen_smu-dkms')
install=$pkgname.install
source=("$_pkgbase::git+$url.git#branch=vermeer-monitor")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$_pkgbase"
  printf "%s.r%s.g%s" \
    "$(sed -n 's/^VERSION[[:space:]]*:=[[:space:]]*//p' Makefile)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/$_pkgbase"
  make -C userspace
}

package() {
  cd "$srcdir/$_pkgbase"

  local _dkmsdir="$pkgdir/usr/src/$_pkgbase-$pkgver"

  install -Dm644 -t "$_dkmsdir" Makefile dkms.conf drv.c smu.c smu.h

  # The module version DKMS tracks is the package version.
  sed -e "s/@VERSION@/$pkgver/" \
      -e "s/ CFLAGS_MODULE+=@CFLGS@//" \
      -i "$_dkmsdir/dkms.conf"

  install -Dm755 userspace/monitor_cpu "$pkgdir/usr/bin/monitor_cpu"

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md docs/rsmu_commands.md
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
