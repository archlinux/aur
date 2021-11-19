# Maintainer: Firegem <mrfiregem [at] protonail [dot] ch>
pkgname=cbqn-git
pkgver=r686.2baa9ac
pkgrel=2
pkgdesc="A BQN implementation in C."
arch=('x86_64')
url="https://github.com/dzaima/CBQN"
license=('GPL3')
depends=('glibc')
optdepends=('rlwrap: Better REPL'
            'ttf-bqn386: BQN and APL compatible font')
makedepends=('git' 'make' 'clang')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git"
        'makefile.patch')
md5sums=('SKIP'
         'f23b43c3c37457cdb830eb7794ee945f')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname%-git}"
  patch --forward --strip=1 --input="${srcdir}/makefile.patch"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make PIE='-pie'
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -Dm755 BQN "${pkgdir}/usr/bin/bqn"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
