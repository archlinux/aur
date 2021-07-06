# Maintainer: Chocobo1 <chocobo1 AT archlinux DOT net>

pkgname=iputils-git
pkgver=20210202.r18.g4f3ec1d
pkgrel=1
pkgdesc="Network monitoring tools, including ping"
arch=('i686' 'x86_64')
url="https://github.com/iputils/iputils"
license=('GPL' 'BSD' 'custom')
depends=('glibc' 'libcap' 'libidn2' 'openssl')
optdepends=('xinetd: for tftpd')
makedepends=('git' 'meson' 'libxslt')
provides=('iputils')
conflicts=('iputils')
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

  meson \
    --buildtype=plain \
    --prefix="/usr" \
    --sbindir="bin" \
    -DBUILD_RARPD=true \
    -DBUILD_TFTPD=true \
    "_build"
  ninja -C "_build"
}

check() {
  cd "iputils"

  meson test -C "_build"
}

package() {
  cd "iputils"

  DESTDIR="$pkgdir" meson install -C "_build"

  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/iputils"
  install -Dm644 "Documentation/LICENSE.BSD3" -t "$pkgdir/usr/share/licenses/iputils"
}
