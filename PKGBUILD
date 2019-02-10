# Maintainer: s3lph <account-arch-aur-gzxkqqna at kernelpanic dot lol>

pkgname=i3lock-s3lph-git
pkgver=r317.50d1174
pkgrel=1
pkgdesc="An improved screenlocker based upon XCB and PAM (s3lph fork)"
arch=('i686' 'x86_64')
url="https://github.com/s3lph/i3lock"
license=('MIT')
groups=('i3')
depends=('xcb-util-image' 'xcb-util-xrm' 'libev' 'cairo' 'libxkbcommon-x11' 'pam')
makedepends=('autoconf' 'git' 'gzip' 'make')
provides=('i3lock')
conflicts=('i3lock')
backup=("etc/pam.d/i3lock")
options=()
install=
source=("git://github.com/s3lph/i3lock.git")
noextract=()
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/i3lock"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/i3lock"
  autoreconf -fi
  mkdir -p build
  gzip -c i3lock.1 > build/i3lock.1.gz
  cd "${srcdir}/i3lock/build"
  ../configure \
    --prefix=${pkgdir}/usr \
    --sysconfdir=${pkgdir}/etc
  make
}

package() {
  cd "${srcdir}/i3lock/build"
  make install
  install -Dm644 i3lock.1.gz ${pkgdir}/usr/share/man/man1/i3lock.1.gz
  install -Dm644 ../LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}
