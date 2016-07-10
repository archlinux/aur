# Maintainer: James An <james@jamesan.ca>

pkgname=git-subrepo-git
_pkgname=${pkgname%-git}
pkgver=0.3.0.r72.g1e79595
pkgrel=1
pkgdesc="Git command is an improvement from git-submodule and git-subtree."
arch=('any')
url="https://github.com/ingydotnet/$_pkgname"
license=('GPL')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname"::"git+$url.git"
        make-destdir.patch)
md5sums=('SKIP'
         'ee9d7137bb4fe4b0cc7da8f669e26ddf')

pkgver() {
  cd "$_pkgname"
  (
    set -o pipefail
    git describe --long --tag | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd "$_pkgname"

  patch -p1 < ../make-destdir.patch
}

check() {
  cd "$_pkgname"

  make test
}

package() {
  cd "$_pkgname"

  make DESTDIR="$pkgdir" PREFIX=/usr install
}
