# Maintainer: Valentin Hăloiu <valentin.haloiu+aur@gmail.com>

buildarch=8

_pkgname=gt
pkgname=gt-git
pkgver="r146.a2aa973"
pkgrel=2
pkgdesc="Gadget Tool: Linux command line tool for setting USB gadget using configFS"
arch=('x86_64' 'aarch64')
url='https://github.com/linux-usb-gadgets/gt'
license=('Apache-2.0')
depends=('libusbgx')
makedepends=('asciidoc' 'cmake' 'git')
source=('git+https://github.com/linux-usb-gadgets/gt.git' 'gt@.service')
sha256sums=('SKIP'
            'dc636c51547e83027ab42c15a37afb2133a3edc06c60931b3198fc4ba919615a')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$_pkgname"

  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_POLICY_VERSION_MINIMUM=3.5 -S ./source -B ./build
  cmake --build ./build --target all
}

package() {
  cd "$_pkgname"

  DESTDIR="${pkgdir}" cmake --install ./build

  install -Dm0644 -t "$pkgdir/usr/share/licenses/${_pkgname}" LICENSE
  install -Dm0644 -t "$pkgdir/usr/lib/systemd/system" ../gt@.service
}
