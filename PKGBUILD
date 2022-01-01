# Maintainer: Firegem <mrfiregem [at] protonail [dot] ch>
pkgname=cbqn-git
pkgver=r767.79d5731
pkgrel=1
pkgdesc="A BQN implementation in C."
arch=('x86_64' 'i686' 'aarch64' 'arm')
url="https://github.com/dzaima/CBQN"
license=('GPL3' 'custom:ISC')
depends=('glibc')
optdepends=('ttf-bqn386: BQN and APL compatible font'
            'rlwrap: Use readline in the REPL')
makedepends=('git' 'clang')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("${pkgname%-git}::git+${url}.git"
        'BQN-ref::git+https://github.com/mlochbaum/BQN.git'
        'rlwrap-shim')
md5sums=('SKIP'
         'SKIP'
         '7f5146ad32f69dc96844ee495e4f6e83')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  make PIE='-pie' LDFLAGS="${LDFLAGS}" \
    t='aur' f='-O2' c
}

check() {
  cd "${srcdir}/${pkgname%-git}"
  ./BQN "${srcdir}/BQN-ref/test/this.bqn"
}

package() {
  install -Dm755 ./rlwrap-shim "${pkgdir}/usr/bin/BQN"

  cd "${srcdir}/${pkgname%-git}"
  install -Dm755 -t "${pkgdir}/usr/share/${pkgname}" BQN
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-CBQN"

  cd "${srcdir}/BQN-ref"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-BQN"
  install -Dm644 -t "${pkgdir}/usr/share/${pkgname}" editors/inputrc
}
