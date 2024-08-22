# Maintainer: a821 at mail de
# Contributor: Matt Coffin <mcoffin13@gmail.com>

pkgname=bzip2-git
pkgver=r181.66c46b8
pkgrel=2
pkgdesc="A high-quality data compression program (future branch)"
arch=('x86_64')
url="https://gitlab.com/bzip2/bzip2"
license=('custom')
depends=('bash' 'glibc')
makedepends=('perl' 'git' 'meson' 'ninja')
checkdepends=('python-pytest')
provides=('bzip2' 'libbz2.so=1.0')
conflicts=('bzip2')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  arch-meson --buildtype release -Ddocs=disabled build $pkgname
  ninja -C build
}

check() {
  meson test -C build --print-errorlogs
}

package() {
  DESTDIR="${pkgdir}" ninja -C build install

  install -D -m644 "$pkgname/COPYING" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  cd "$pkgdir/usr/lib"
  if [ ! -e libbz2.so.1.0 ]; then
    ln -s libbz2.so.1 libbz2.so.1.0
  fi
}
