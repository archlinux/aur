# Maintainer: Nichlas Severinsen <ns@nsz.no>
# Contributor: James An <james@jamesan.ca>

pkgname=libfvde-git
_pkgname=${pkgname%-git}
pkgver=20220915.r5.g6cc326a
pkgrel=1
pkgdesc='Library and tools to access FileVault Drive Encryption (FVDE) encrypted volumes'
arch=('any')
url="https://github.com/libyal/$_pkgname/wiki"
license=('LGPL3')
depends=('libxml2' 'openssl')
makedepends=('git')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=()
install=
source=("$_pkgname"::"git+https://github.com/libyal/$_pkgname.git")
md5sums=('SKIP')

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

    make DESTDIR="$pkgdir" install
}
