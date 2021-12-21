# Maintainer: Firegem <mrfiregem [at] protonmail [dot] ch>
pkgname=cxbqn
pkgver=0.8.2
pkgrel=1
pkgdesc='BQN virtual machine.'
arch=('x86_64')
url='https://github.com/ashermancinelli/cxbqn'
license=('GPL3')
conflicts=('cbqn'{,-git} "${pkgname}-git")
depends=('gcc-libs' 'glibc' 'readline')
makedepends=('clang' 'cmake' 'git')
optdepends=('ttf-bqn386: BQN and APL-compatible font')
source=("${pkgname}-${pkgver}::git+${url}#tag=v${pkgver}"
        'CMakeLists.txt.patch')
sha256sums=('SKIP'
            '2863d73f44562e340d30c00d0660526f6c07170ecbcb1f66ae19bddfd043a063')

prepare() {
  cd "${pkgname}-${pkgver}"
  patch --strip=1 < ../CMakeLists.txt.patch
}

build() {
  mkdir "${pkgname}-${pkgver}/build"
  cd "${pkgname}-${pkgver}/build"
  cmake -DCXBQN_READLINE=ON ..
  make -j12
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
  install -Dm755 build/BQN "${pkgdir}/usr/bin/bqn"

  cd ext/bqn
  install -Dm644 community/README.md "${pkgdir}/usr/share/doc/${pkgname}/community.md"
  install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" doc/*.md
  install -Dm644 editors/README.md "${pkgdir}/usr/share/doc/${pkgname}/editors.md"
  mv tutorial "${pkgdir}/usr/share/doc/${pkgname}"

  install -Dm644 -t "${pkgdir}/usr/share/${pkgname}" editors/{inputrc,XCompose}
  install -Dm644 -t "${pkgdir}/usr/share/X11/xkb/symbols" editors/bqn
}
