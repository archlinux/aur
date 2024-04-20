# Maintainer: Yufan You <ouuansteve at gmail>

pkgname=xss-lock-locked-hint
pkgver=0.3.0.r8.g7b0b4dc
pkgrel=3
pkgdesc="Use external locker as X screen saver. Fork with support for logind's SetLockedHint."
arch=('x86_64')
url="https://github.com/xdbob/xss-lock/tree/locked_hint"
license=('MIT')
depends=('glib2' 'xcb-util')
makedepends=('cmake' 'git' 'python-docutils')
optdepends=('bash-completion: for bash completion')
provides=('xss-lock')
conflicts=('xss-lock')
source=("$pkgname::git+https://github.com/xdbob/xss-lock#branch=locked_hint"
        '0016-Do-not-core-dump-when-exiting-due-to-loss-of-X-conne.patch')
sha256sums=('SKIP' '4063c3624f78fa592e1e36975acd43746d06866c00f8ab9500d3b578c538fc93')

pkgver() {
  cd "$pkgname"
  git describe | sed 's/^v//; s/-/.r/; s/-/./'
}

prepare() {
  cd "$pkgname"
  patch -Np1 < "$srcdir/0016-Do-not-core-dump-when-exiting-due-to-loss-of-X-conne.patch"
}

build() {
  cd "$pkgname"
  cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
