# Maintainer: Cody P Schafer <archlinux at codyps.com>
# Maintainer: Daniel Nagy <danielnagy at gmx de>
# Contributor: Martin Harvan <martinhrvn@gmail.com>

_hkgname=gio
pkgname=haskell-${_hkgname}
pkgver=0.13.3.0
pkgrel=1
pkgdesc="Binding to the GIO."
url="http://hackage.haskell.org/package/${_hkgname}"
license=('LGPL-2.1')
arch=('i686' 'x86_64')
makedepends=('haskell-gtk2hs-buildtools')
depends=('ghc'
    'haskell-array'
    'haskell-bytestring'
    'haskell-containers'
    'haskell-glib'
    'haskell-mtl'
    'glib2'
)
options=(!emptydirs)
source=(http://hackage.haskell.org/packages/archive/${_hkgname}/${pkgver}/${_hkgname}-${pkgver}.tar.gz)
md5sums=('8d3c4d06a275ab4e464de0e70128f44e')

build() {
    cd ${srcdir}/${_hkgname}-${pkgver}
    runhaskell Setup configure -O -p --enable-split-objs --enable-shared \
       --prefix=/usr --docdir=/usr/share/doc/${pkgname} --libsubdir=\$compiler/site-local/\$pkgid
    runhaskell Setup build
    runhaskell Setup haddock
    runhaskell Setup register   --gen-script
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
    _update_deps haskell-mtl

    cd ${srcdir}/${_hkgname}-${pkgver}
    install -D -m744 register.sh   ${pkgdir}/usr/share/haskell/${pkgname}/register.sh
    install    -m744 unregister.sh ${pkgdir}/usr/share/haskell/${pkgname}/unregister.sh
    install -d -m755 ${pkgdir}/usr/share/doc/ghc/html/libraries
    ln -s /usr/share/doc/${pkgname}/html ${pkgdir}/usr/share/doc/ghc/html/libraries/${_hkgname}
    runhaskell Setup copy --destdir=${pkgdir}
}
