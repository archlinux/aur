# Maintainer: James An <james@jamesan.ca>

pkgname=dupd-git
_pkgname=${pkgname%-git}
pkgver=1.3.r83.ged1888f
pkgrel=1
pkgdesc="CLI utility to find duplicate files"
arch=('i686' 'x86_64' 'any')
url="http://www.virkki.com/$_pkgname"
license=('GPL3')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname"::"git+https://github.com/jvirkki/$_pkgname.git"
        "libbloom"::"git+https://github.com/jvirkki/libbloom.git"
        test.patch)
md5sums=('SKIP'
         'SKIP'
         '5228e790f359376d51a9348cb72092eb')

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

  patch -p1 -i ../test.patch
}

build() {
  cd libbloom && make && cd ..
  cd "$_pkgname"

  make
}

check() {
  cd "$_pkgname"
  mv tests/{,~}test.72

  make test
}

package() {
    cd "$_pkgname"

    install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
