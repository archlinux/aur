# Maintainer:  Gilbert Gilb's <gilbsgilbert@gmail.com>
# Contributor:  Vincent Grande <shoober420@gmail.com>
# Contributor: David Runge <dvzrv@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Murtuza Akhtari <inxsible at gmail dot com>
# Contributor: Keshav Amburay <(the ddoott ridikulus ddoott rat) (aatt) (gemmaeiil) (ddoott) (ccoomm)>

pkgname=efibootmgr-json-git
pkgver=r392.g975051a
pkgrel=1
pkgdesc="Linux user-space application to modify the EFI Boot Manager with JSON support."
arch=('x86_64')
url="https://github.com/pvxe/efibootmgr-json"
license=('GPL2')
depends=('glibc' 'popt' 'jansson')
makedepends=('efivar' 'git')
provides=(efibootmgr)
conflicts=(efibootmgr)
source=(git+https://github.com/pvxe/efibootmgr-json)
sha512sums=('SKIP')

pkgver() {
  cd efibootmgr-json
  local commits=$(git rev-list --count HEAD)
  local hash=$(git rev-parse --short HEAD)
  printf 'r%s.g%s' "$commits" "$hash"
}

prepare() {
  cd efibootmgr-json
  # removing hotfix function declaration:
  # https://github.com/rhboot/efibootmgr/issues/128
  sed -e '/extern int efi_set_verbose/d' -i "src/efibootmgr.c"
}

build() {
  cd efibootmgr-json
  make libdir='/usr/lib' sbindir='/usr/bin' EFIDIR='arch' JSON=1
}

package() {
  depends+=('libefiboot.so' 'libefivar.so')
  cd efibootmgr-json
  make DESTDIR="${pkgdir}" \
       libdir='/usr/lib' \
       sbindir='/usr/bin' \
       EFIDIR='arch' \
       install
  install -vDm 644 {AUTHORS,README,README.md,TODO} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
