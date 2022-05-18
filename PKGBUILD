# Maintainer: Leela Ross <leela@leela-ross.com>
# Maintainer: Ethan Skinner <aur@etskinner.com>
# Maintainer: Dotz0cat <Dotz0cat@gmail.com>
pkgname=znc-push-git
pkgver=1.1.0.r0.b203070
pkgrel=1
pkgdesc="A module for ZNC that sends notifications to push notification services"
arch=('i686' 'x86_64' 'armv6h' 'armv7h' 'aarch64')
url="https://noswap.com/projects/znc-push"
license=('MIT')
depends=('znc')
makedepends=('git' 'python' 'cmake')
source=("${pkgname}::git+https://github.com/jreese/znc-push.git")
md5sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname}"
  printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g;s/^v//')"
}

build() {
  cd "$srcdir/${pkgname}"
  sed 's:-DPUSHVERSION=[\]"$(version)[\]":-DPUSHVERSION=\\"\\\\\\"$(version)\\\\\\"\\":' Makefile > Makefile.tmp
  mv Makefile.tmp Makefile
  make curl=yes
}

package() {
  cd "$srcdir/${pkgname}"
  install -Dm755 push.so "$pkgdir/usr/lib/znc/push.so"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
