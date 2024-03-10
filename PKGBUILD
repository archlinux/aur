# Maintainer: Lucas Gabriel <g at 11xx dot org>

_hkgname=mpd-current-json
pkgname=${_hkgname}
pkgver=1.2.0.0
pkgrel=7
pkgdesc="Print current MPD song and status as JSON"
url="https://codeberg.org/useless-utils/mpd-current-json"
license=("Unlicense")
arch=('x86_64')
depends=('ghc-libs' 'haskell-aeson' 'haskell-aeson-pretty' 'haskell-libmpd' 'haskell-optparse-applicative')
makedepends=('ghc' 'uusi')
source=("https://hackage.haskell.org/packages/archive/$_hkgname/$pkgver/$_hkgname-$pkgver.tar.gz")
sha256sums=('fac07e84afd75ea72b4d6bea12d15586daffa0841c42fbeb41f33e5e47e90046')

# From https://gitlab.archlinux.org/archlinux/packaging/packages/arch-hs/-/blob/main/PKGBUILD?ref_type=heads
# The use of `${1}' is for generating/installing completion for multiple executables with a suffixed name.
_gen_comp(){
  LD_LIBRARY_PATH="$PWD/dist/build" dist/build/${_hkgname}${1}/${_hkgname}${1} --bash-completion-script "/usr/bin/${_hkgname}${1}" > bash${1}
  LD_LIBRARY_PATH="$PWD/dist/build" dist/build/${_hkgname}${1}/${_hkgname}${1} --zsh-completion-script  "/usr/bin/${_hkgname}${1}" > zsh${1}
  LD_LIBRARY_PATH="$PWD/dist/build" dist/build/${_hkgname}${1}/${_hkgname}${1} --fish-completion-script "/usr/bin/${_hkgname}${1}" > fish${1}
}

_install_comp(){
  install -D -m644 bash${1} "$pkgdir/usr/share/bash-completion/completions/${_hkgname}${1}"
  install -D -m644 zsh${1}  "$pkgdir/usr/share/zsh/site-functions/_${_hkgname}${1}"
  install -D -m644 fish${1} "$pkgdir/usr/share/fish/vendor_completions.d/${_hkgname}${1}.fish"
}

prepare() {
  uusi $_hkgname-$pkgver/$_hkgname.cabal
  # remvoe type definition of KeyValue that conflicts with `aeson <2.2'
  sed -i '/(.=?) :: (KeyValue e a, ToJSON v) => Key -> Maybe v -> Maybe a/d' $_hkgname-$pkgver/lib/Network/MPD/Parse.hs
}

build() {
  cd $_hkgname-$pkgver

  runhaskell Setup configure -O --enable-shared --enable-executable-dynamic --disable-library-vanilla \
    --prefix=/usr --docdir=/usr/share/doc/$pkgname --datasubdir=$pkgname --enable-tests \
    --dynlibdir=/usr/lib --libsubdir=\$compiler/site-local/\$pkgid \
    --ghc-option=-optl-Wl\,-z\,relro\,-z\,now \
    --ghc-option='-pie'

  runhaskell Setup build
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh

  _gen_comp
}

package() {
  cd $_hkgname-$pkgver

  install -D -m744 register.sh "$pkgdir"/usr/share/haskell/register/$pkgname.sh
  install -D -m744 unregister.sh "$pkgdir"/usr/share/haskell/unregister/$pkgname.sh
  runhaskell Setup copy --destdir="$pkgdir"
  install -D -m644 UNLICENSE -t "$pkgdir"/usr/share/licenses/$pkgname/
  rm -f "$pkgdir"/usr/share/doc/$pkgname/UNLICENSE

  _install_comp
}
