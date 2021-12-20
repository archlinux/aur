# Maintainer: Firegem <mrfiregem [at] protonail [dot] ch>
pkgname=cbqn-git
pkgver=r752.3d5a92c
pkgrel=1
pkgdesc="A BQN implementation in C."
arch=('x86_64')
url="https://github.com/dzaima/CBQN"
license=('GPL3' 'custom:ISC')
depends=('glibc' 'rlwrap')
optdepends=('ttf-bqn386: BQN and APL compatible font')
makedepends=('git' 'clang')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git"
        "bqn-ref::git+https://github.com/mlochbaum/BQN.git"
        'makefile.patch'
        'rlwrap-shim')
md5sums=('SKIP'
         'SKIP'
         '4fd2c4b8b11b0f234482d3fa8056c039'
         '02cb8cb1a3f5832526614237a04de4de')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "${srcdir}/${pkgname%-git}"
  patch --forward --strip=1 --input="${srcdir}/makefile.patch"
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  make PIE='-pie' o3
  ./BQN genRuntime "${srcdir}/bqn-ref"
  make PIE='-pie' o3
}

check() {
  cd "${srcdir}/${pkgname%-git}"
  ./BQN "${srcdir}/bqn-ref/test/this.bqn"
}

package() {
  install -Dm755 ./rlwrap-shim "${pkgdir}/usr/bin/bqn"

  cd "${srcdir}/${pkgname%-git}"
  install -Dm755 ./BQN "${pkgdir}/usr/share/${pkgname}/bqn"
  install -Dm644 ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-cbqn"

  cd "$srcdir/bqn-ref"
  install -Dm644 ./LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-bqn"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}/" ./tutorial/*.{md,bqn}
  install -Dm644 -t "${pkgdir}/usr/share/${pkgname}" ./editors/inputrc
}
