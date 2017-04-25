# Maintainer: James An <james@jamesan.ca>

pkgname=git-subsplit-git
_pkgname=${pkgname%-git}
pkgver=r30.2cde593
pkgrel=1
pkgdesc="Automate and simplify the process of managing one-way read-only subtree splits."
arch=('any')
url="https://github.com/dflydev/$_pkgname"
license=('MIT')
depends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname"::"git+https://github.com/dflydev/$_pkgname.git"
        install-with-DESTDIR.patch)
md5sums=('SKIP'
         '54079a630b700001111591a6b4b82269')

pkgver() {
  cd "$_pkgname"
  (
    set -o pipefail
    git describe --long --tag 2>/dev/null | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}
prepare() {
  cd "$_pkgname"

  patch -p1 -i $srcdir/install-with-DESTDIR.patch
}

package() {
  cd "$_pkgname"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -m755 -d "$pkgdir/$(git --exec-path)"
  DESTDIR="$pkgdir" ./install.sh
}
