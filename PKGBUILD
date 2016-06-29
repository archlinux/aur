# Maintainer: Cody P Schafer <archlinux at codyps.com>
_ipn=pcap
_bpn=haskell-${_ipn}
pkgname=${_bpn}
pkgver=0.4.5.2
pkgrel=1
pkgdesc="A system-independent interface for user-level packet capture"
arch=(x86_64)
url="https://github.com/bos/pcap"
license=('custom:BSD3')
groups=()
depends=(ghc)
makedepends=(git)
provides=(${_bpn})
conflicts=(${_bpn})
replaces=()
backup=()
options=(!emptydirs)
install=
source=("http://hackage.haskell.org/packages/archive/${_ipn}/${pkgver}/${_ipn}-${pkgver}.tar.gz")
md5sums=('492b7ecc53d0ac3599845ab8ac553997')

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
  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
  rm -f ${pkgdir}/usr/share/doc/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
