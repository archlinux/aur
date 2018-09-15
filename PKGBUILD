# Maintainer: James An <james@jamesan.ca>

pkgname=ksplice-git
_pkgname=${pkgname%-git}
pkgver=v0.9.9.1.r34.g8a03c0e
pkgrel=1
pkgdesc='Patch kernel without rebooting'
arch=('x86_64')
url="https://$_pkgname.com"
license=('GPL')
depends=()
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname"::"git+https://github.com/jirislaby/$_pkgname.git"
        python2.patch)
md5sums=('SKIP'
         '25e8103b65ccfd3af8f29e850fdfce80')

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

  patch -p1 < ../python2.patch
}

build() {
  cd "$_pkgname"

  ./configure --prefix=/usr --libexecdir=/usr/lib/ksplice-git --sbindir=/usr/bin
  make
}

package() {
    cd "$_pkgname"

    make DESTDIR="$pkgdir/" install
}
