# Maintainer: Alad Wenter <https://wiki.archlinux.org/index.php/Special:EmailUser/Alad>
# Contributor: Raymond Wagenmaker <raymondwagenmaker@gmail.com>
pkgname=xss-lock-git
pkgver=v0.3.0.4.g1e158fb
pkgrel=1
pkgdesc="Use external locker as X screen saver"
arch=(i686 x86_64)
url="https://bitbucket.org/raymonad/xss-lock"
license=('MIT')
depends=('xcb-util' 'systemd')
makedepends=('cmake' 'python-docutils' 'git')
optdepends=('bash-completion: for bash completion')
source=("$pkgname::git+https://bitbucket.org/raymonad/${pkgname%-git}.git"
       'ignore-blank.patch')
md5sums=('SKIP'
         'b12e5dd8463d6300ebe3a2b525a12926')
provides=('xss-lock')
conflicts=('xss-lock')

pkgver() {
  cd "$pkgname"
  local ver="$(git describe --long)"
  printf "%s" "${ver//-/.}"
}

prepare() {
  cd "$pkgname"/src
  patch -p0 < "$srcdir"/ignore-blank.patch
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

# vim:set ts=2 sw=2 et:
