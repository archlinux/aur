# Maintainer: Cody P Schafer <archlinux at codyps.com>
_ipn=hgettext
_bpn=haskell-${_ipn}
pkgname=${_bpn}
pkgver=0.1.30
pkgrel=3
pkgdesc="bindings to libintl.h (gettext, bindtextdomain)"
arch=(x86_64)
url="https://github.com/vasylp/hgettext"
license=('custom:BSD3')
groups=()
depends=(ghc haskell-src-exts haskell-uniplate haskell-setlocale)
makedepends=(git)
provides=(${_bpn})
conflicts=(${_bpn})
replaces=()
backup=()
options=(!emptydirs)
install=
source=(
  "http://hackage.haskell.org/packages/archive/${_ipn}/${pkgver}/${_ipn}-${pkgver}.tar.gz"
  "file://0001-update-to-support-haskell-src-exts-1.18.patch"
)
md5sums=('6b36a5c86e13de18c7daef124d9e9a71'
         'd76683ac658490d60b880e6ee7928fe9')

prepare() {
  cd "$srcdir/${_ipn}-${pkgver}"
  patch -Np1 -i "$srcdir/0001-update-to-support-haskell-src-exts-1.18.patch"
}

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

_update_deps() {
    _ver=`pacman -Q $1 | cut -f2 -d\  | cut -f1 -d-`
    for i in `seq 0 $(expr ${#depends[@]} - 1)`; do
        if [ ${depends[$i]} == $1 ]; then
            depends[$i]="$1=${_ver}"
        fi
    done
}

package() {
  _update_deps ghc
  _update_deps haskell-src-exts

  cd "$srcdir/${_ipn}-${pkgver}"

  install -D -m744 register.sh   "${pkgdir}/usr/share/haskell/register/${pkgname}.sh"
  install -D -m744 unregister.sh "${pkgdir}/usr/share/haskell/unregister/${pkgname}.sh"
  install -dm755 ${pkgdir}/usr/share/doc/ghc/html/libraries
  ln -s /usr/share/doc/${pkgname}/html ${pkgdir}/usr/share/doc/ghc/html/libraries/${_ipn}
  runhaskell Setup copy --destdir=${pkgdir}
}

# vim:set ts=2 sw=2 et:
