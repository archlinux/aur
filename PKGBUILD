# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=iputils-git
pkgver=20211215.r68.g1a5d7a6
pkgrel=1
pkgdesc="Network monitoring tools, including ping"
arch=('i686' 'x86_64')
url="https://github.com/iputils/iputils"
license=('GPL' 'BSD' 'custom')
depends=('glibc' 'libcap' 'libidn2' 'openssl')
optdepends=('xinetd: for tftpd')
makedepends=('git' 'meson' 'libxslt')
provides=("iputils=$pkgver")
conflicts=('iputils' 'arping' 'netkit-base' 'netkit-tftpd')
replaces=('netkit-base')
backup=('etc/xinetd.d/tftp')
install=iputils.install
source=("git+https://github.com/iputils/iputils.git")
sha256sums=('SKIP')


pkgver() {
  cd "iputils"

  git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "iputils"

  meson setup \
    --buildtype=plain \
    --prefix="/usr" \
    --sbindir="bin" \
    "_build"
  meson compile -C "_build"
}

check() {
  cd "iputils"

  meson test -C "_build"
}

package() {
  cd "iputils"

  meson install -C "_build" --destdir "$pkgdir"

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/iputils"
  install -Dm644 "Documentation/LICENSE.BSD3" -t "$pkgdir/usr/share/licenses/iputils"
}
