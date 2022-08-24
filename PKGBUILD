# Maintainer: Mateusz Galazyn <carbolymer@gmail.com>

_hackage_name=prune-juice
pkgname="haskell-${_hackage_name}-git"
pkgver=0.7.2.r100.639d4d5
pkgrel=1
pkgdesc="Prune unused Haskell dependencies from a Haskell project."
arch=(any)
url="https://github.com/dfithian/prune-juice"
license=('MIT')
makedepends=('git' 'patch' 'cabal-install')
source=("git+${url}.git"
        version-bounds.patch)
sha256sums=('SKIP'
            '15efda6e02f8a5206bff427b7bc188878033139cd9962aa3794a39c86260c160')

pkgver() {
  cd "$srcdir/$_hackage_name"
  printf "%s.r%s.%s" "$(grep '^version:' prune-juice.cabal | awk '{print $2}')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  echo "Patching version bounds in cabal file...."
  cd "${srcdir}/${_hackage_name}"
  patch -i ${srcdir}/version-bounds.patch
}

build() {
  echo "trying to use $(ghc --version)"
  cd "${srcdir}/${_hackage_name}"

  cabal build -O2 -j
}

package() {
  cd "${srcdir}/${_hackage_name}"
  install -D -m 644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  cabal install exe:prune-juice --install-method=copy --installdir="${pkgdir}/usr/bin"
  # stack --local-bin-path "${pkgdir}/usr/bin/" install
}
