# Maintainer: Zoltan Tombol <zoltan (dot) tombol (plus) aur (at) gmail (dot) com>

pkgname=varrick-git
pkgver=0.2.0.r33.gd1553d7
pkgrel=1
pkgdesc="A convenient template engine to just 'Do the thing!'"
arch=(any)
url="https://github.com/ztombol/varrick"
license=('GPL3')
depends=('bash' 'sed')
makedepends=('git' 'ruby-ronn')
checkdepends=('bats-git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+https://github.com/ztombol/${pkgname%-git}"
        "git+https://github.com/ztombol/bats-core"
        "git+https://github.com/ztombol/bats-assert")
sha512sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${srcdir}/${pkgname%-git}"
  git submodule init
  git config submodule.test/test_helper/bats-core.url \
    "${srcdir}/bats-core"
  git config submodule.test/test_helper/bats-assert.url \
    "${srcdir}/bats-assert"
  git submodule update
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  make build
}

check() {
  cd "${srcdir}/${pkgname%-git}"
  make -k check
}

package() {
  cd "${srcdir}/${pkgname%-git}"
  make DESTDIR="$pkgdir" \
       prefix='/usr' \
       libexecdir='/usr/lib' \
       install
}

# vim:set ts=2 sw=2 et:
