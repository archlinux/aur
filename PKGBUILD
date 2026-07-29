# Maintainer: Dmytro Bagrii <dimich.dmb@gmail.com>

_pkgname=dumb-uki-efi-stub
pkgname="$_pkgname"-git
pkgver=r3.8dd1224

pkgver() {
  cd "${srcdir}/$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

pkgrel=1
pkgdesc="Dumb UKI EFI Stub"
arch=(x86_64)
url="https://codeberg.org/dimich/$_pkgname"
license=(GPL-2.0-or-later BSD-3-Clause)
makedepends=(clang)
source=(git+"$url"
        git+https://github.com/ncroxon/gnu-efi)
b2sums=('SKIP'
        'SKIP')

prepare() {
  cd "$_pkgname"
  git submodule init
  git config submodule.gnu-efi.url "$srcdir/gnu-efi"
  git -c protocol.file.allow=always submodule update
}

build() {
  cd "$_pkgname"
  make
}

package() {
  cd "$_pkgname"

  install -Dm 644 dumbukistubx64.efi "$pkgdir/usr/lib/$_pkgname"/dumbukistubx64.efi
  install -Dm 644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname"/LICENSE.GPL-2.0-or-later
  install -Dm 644 gnu-efi/licenses/LICENSE.BSD-3-Clause "$pkgdir/usr/share/licenses/$_pkgname"/LICENSE.BSD-3-Clause
}
