# Maintainer: s3lph <account-arch-aur-gzxkqqna at kernelpanic dot lol>
# Contributor: Lukas Tobler <luk4s.tobler@gmail.com>

pkgname=i3lock-lixxia-git
pkgver=r297.a27257f
pkgrel=1
pkgdesc="An improved screenlocker based upon XCB and PAM (Lixxia fork)"
arch=('i686' 'x86_64')
url="https://github.com/Lixxia/i3lock"
license=('MIT')
groups=('i3')
depends=('xcb-util-image' 'libev' 'cairo' 'libxkbcommon-x11' 'pam')
makedepends=('autoconf' 'git' 'gzip' 'make')
provides=('i3lock')
conflicts=('i3lock')
backup=("etc/pam.d/i3lock")
source=("git://github.com/Lixxia/i3lock.git")
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
