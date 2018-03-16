# Maintainer: James An <james@jamesan.ca>

pkgname=libfvde-git
_pkgname=${pkgname%-git}
pkgver=20180108.r0.g3584a32
pkgrel=1
pkgdesc='Library and tools to access FileVault Drive Encryption (FVDE) encrypted volumes'
arch=('i686' 'x86_64' 'any')
url="https://github.com/libyal/$_pkgname/wiki"
license=('LGPL3')
depends=('libxml2' 'openssl')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=()
install=
source=("$_pkgname"::"git+https://github.com/libyal/$_pkgname.git"
        'libfvalue_string.patch')
md5sums=('SKIP'
         '7dd39c62a7dc74dc757935c2a669bbb6')

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

  ./synclibs.sh
  patch -p1 < ../libfvalue_string.patch
}

build() {
  cd "$_pkgname"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

check() {
    cd "$_pkgname"

    make -k check
}

package() {
    cd "$_pkgname"

    make DESTDIR="$pkgdir/" install
}
