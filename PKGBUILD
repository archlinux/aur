# Maintainer: eaut@boehm.org
pkgname=efistub-git
pkgver=r18.4c8bc0c
pkgrel=1
pkgdesc="Manage UEFI only (secure) boot configurations for Linux EFISTUB kernels"
arch=("any")
url="https://github.com/eaut/efistub"
license=('GPL3')
depends=('efibootmgr' 'efitools' 'efivar' 'sbsigntools' 'binutils' 'openssl' 'bash' 'coreutils' 'util-linux')
makedepends=('git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("efistub::git+https://github.com/eaut/efistub.git")
#source=("efibootmgr::git+https://github.com/eaut/efibootmgr.git#tag=${pkgver}")
#source=("efibootmgr::git+https://github.com/eaut/efibootmgr.git#commit=5e9700c2252eed45f4568f3a7c08c866c2c83c0b")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -d "$pkgdir/etc/efistub/config.d/"
  install -d "$pkgdir/etc/efistub/keys/"
  install -D -m 0755 -t "$pkgdir/usr/bin" efistub
  install -D -m 0644 -t "$pkgdir/usr/lib/systemd/system" systemd/*
  install -D -m 0644 -t "$pkgdir/usr/share/licenses/${pkgname%-git}" LICENSE
  install -D -m 0644 -t "$pkgdir/usr/share/doc/${pkgname%-git}" README.md
  install -D -m 0644 -t "$pkgdir/usr/share/doc/${pkgname%-git}/config-examples" config-examples/*.conf
}
