# Maintainer: berberman <hatsue@typed.icu>

pkgname=arch-hs-git
pkgver=r53.a45e464
pkgrel=1
pkgdesc="Generating PKGBUILD for hackage packages."
arch=('x86_64')
url="https://github.com/berberman/arch-hs"
license=('MIT')
depends=('ghc-libs' 'haskell-aeson' 'haskell-req' 'haskell-hackage-db' 'haskell-megaparsec' 'haskell-algebraic-graphs' 'haskell-conduit' 'haskell-tar-conduit' 'haskell-conduit-extra' 'haskell-split' 'haskell-neat-interpolation' 'haskell-microlens' 'haskell-microlens-th' 'haskell-polysemy' 'haskell-colourista' 'haskell-optparse-applicative')
makedepends=('ghc' 'git')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}") 
source=(${pkgname%-git}::git+https://github.com/berberman/arch-hs.git)
md5sums=('SKIP')


pkgver() {
	cd "$srcdir/${pkgname%-git}"        
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/${pkgname%-git}"
  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir=/usr/share/doc/$pkgname \
    --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
    --ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
    --ghc-option='-pie'

  runhaskell Setup build
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
  
  LD_LIBRARY_PATH=$PWD/dist/build dist/build/arch-hs/arch-hs --bash-completion-script "/usr/bin/arch-hs" > bash
  LD_LIBRARY_PATH=$PWD/dist/build dist/build/arch-hs/arch-hs --zsh-completion-script  "/usr/bin/arch-hs" > zsh
  LD_LIBRARY_PATH=$PWD/dist/build dist/build/arch-hs/arch-hs --fish-completion-script "/usr/bin/arch-hs" > fish

  LD_LIBRARY_PATH=$PWD/dist/build dist/build/arch-hs-diff/arch-hs-diff --bash-completion-script "/usr/bin/arch-hs-diff" > bash-diff
  LD_LIBRARY_PATH=$PWD/dist/build dist/build/arch-hs-diff/arch-hs-diff --zsh-completion-script  "/usr/bin/arch-hs-diff" > zsh-diff
  LD_LIBRARY_PATH=$PWD/dist/build dist/build/arch-hs-diff/arch-hs-diff --fish-completion-script "/usr/bin/arch-hs-diff" > fish-diff
}

package() {
  cd "$srcdir/${pkgname%-git}"
  install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
  install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
  runhaskell Setup copy --destdir="$pkgdir"
  install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  rm -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE"
  
  install -D -m644 bash "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -D -m644 zsh  "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
  install -D -m644 bash "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
  
  install -D -m644 bash-diff "$pkgdir/usr/share/bash-completion/completions/arch-hs-diff-git"
  install -D -m644 zsh-diff  "$pkgdir/usr/share/zsh/site-functions/_arch-hs-diff-git"
  install -D -m644 bash-diff "$pkgdir/usr/share/fish/vendor_completions.d/arch-hs-diff-git.fish"
} 
