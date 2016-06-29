# Maintainer: Cody P Schafer <archlinux at codyps.com>
_ipn=hgettext
_bpn=haskell-${_ipn}
pkgname=${_bpn}
pkgver=0.1.30
pkgrel=1
pkgdesc="bindings to libintl.h (gettext, bindtextdomain)"
arch=(x86_64)
url="https://github.com/vasylp/hgettext"
license=('custom:BSD3')
groups=()
depends=(ghc haskell-src-exts haskell-uniplate)
makedepends=(git)
provides=(${_bpn})
conflicts=(${_bpn})
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://hackage.haskell.org/packages/archive/${_ipn}/${pkgver}/${_ipn}-${pkgver}.tar.gz")
md5sums=('6b36a5c86e13de18c7daef124d9e9a71')

build() {
  cd "$srcdir/${_ipn}-${pkgver}"
  runhaskell Setup configure -O -p --enable-split-objs --enable-shared \
    --prefix=/usr --docdir=/usr/share/doc/${pkgname} \
    --libsubdir=\$compiler/site-local/\$pkgid
  runhaskell Setup build
  runhaskell Setup haddock
  runhaskell Setup register --gen-script
  runhaskell Setup unregister --gen-script
  sed -i -r -e "s|ghc-pkg.*update[^ ]* |&'--force' |" register.sh
  sed -i -r -e "s|ghc-pkg.*unregister[^ ]* |&'--force' |" unregister.sh
}

_ghcver_set() {
  local _i
  _ghcver=`pacman -Q ghc | cut -f2 -d\  | cut -f1 -d-`
  depends[0]="ghc=$_ghcver"
}

package() {
  _ghcver_set
  cd "$srcdir/${_ipn}-${pkgver}"

  install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
  install -D -m744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"
  install -dm755 ${pkgdir}/usr/share/doc/ghc/html/libraries
  ln -s /usr/share/doc/${pkgname}/html ${pkgdir}/usr/share/doc/ghc/html/libraries/${_ipn}
  runhaskell Setup copy --destdir=${pkgdir}
}

# vim:set ts=2 sw=2 et:
