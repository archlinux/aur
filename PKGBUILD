# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

_pkgname=aalib
pkgname=lib32-$_pkgname
pkgver=1.4rc5
pkgrel=5
pkgdesc="A portable ASCII art graphic library (32 bit)"
arch=('x86_64')
url="http://aa-project.sourceforge.net/aalib/"
license=('LGPL')
depends=('lib32-gpm' 'lib32-libx11' "$_pkgname")
makedepends=('lib32-libxt')
source=(https://downloads.sourceforge.net/sourceforge/aa-project/${_pkgname}-${pkgver}.tar.gz
        aclocal-fixes.patch
        aalib-m4.patch
        aalib-c99.patch
        aalib-free-offset-pointer.patch
        aalib-aalinuxkbd-return.patch
        aalib-key-down-OOB.patch
        aalib-opaque-ncurses-fix.patch
        aalib-fix-aarender.patch
        aalib-mouse.patch
)
sha512sums=('3e4506eccce3b81ccbbb79a4a1b90abd39e2259e6043fde90f70b9ca279bd4c37758a047167267b97c4ec92f64fb17c7c8f548114f0d0c6e78ddb9463b5f1299'
            'aa98b2226c2dd15c13561b28b5558ed459e9065c2339222df7c3002ea17a9b81711e6ff4f59d66ad817d96461dd8b5411c87b049306c875f295fdb8d0c9425c7'
            'b9809d99e63c07c1cd778fd5d35023f38620c68019a8d2ee737a6d34fb8698e4b3592cf919700432ee7445006f2497b2f45e0d8e99ff918f7d1f10b3a85f9406'
            '166c98ae5752b97f8c74e5f6924bce19cf68f654a1c3fc7774c919525d4c46a623aac043bbecb150d4beeb48d62e28ba0ba957698681ade8c6e2357439aa877b'
            '57d92c401057cd5ba8e034378ab137d1eff777dfaf51bde4281bb4882459b2e47d374f20b7520ca0b0d17371cb0942de75d9faca16a56aab7f47dfa0ac7b3c72'
            '7a68976ff4c3dbf45f21fc6b3c455945336171c686e6a5b80f111072025b50b4a1cd63f8253331add3a187a89247e40ebc9430952501c38257df2d26019161a7'
            'e3a79459024e25180b5407b92031c1b675659038289daff5a62485a01dc79afd8223652f9bd3e521a975158ecaa8210e35e536dfe3719259f2631a87d83e19b7'
            'c0e9bb8973fb90cefc151fe015886787e1fdf0df781356478812aee161857ca5f81f87694dbe9323c3a7680391e715d4913c5d30cf789b3fd47447fcfdae5f17'
            '4e30144ce0df3e1f063fc1bef34690ffc88719f3f52fa62f25f4d2e28a22b59713b5ea23f14c07f0fec5b3988a093572b3e9886ef052cbba48a028f84eb84588'
            'f7560515c7253e213bcb0dd6636019fc8e72148d4a10add7b8b1b2174fbf9cc012106c75e9d29848895997f30462c8f3acf9746b0313a8d695ef84644543f386')

prepare() {
  cd ${_pkgname}-1.4.0
  patch -p0 -i "${srcdir}/aclocal-fixes.patch"

  # Fix --with-aalib-prefix argument
  # https://sourceforge.net/p/aa-project/patches/9/
  # https://bugs.archlinux.org/task/53482
  patch -Np0 -i ../aalib-m4.patch

  # Fix builtin-declaration-mismatch compiler warnings
  # https://sourceforge.net/p/aa-project/bugs/10/
  patch -Np1 -i ../aalib-c99.patch

  # Fix free-nonheap-object compiler warning
  patch -Np1 -i ../aalib-free-offset-pointer.patch

  # Fix aggressive-loop-optimizations compiler warning
  patch -Np1 -i ../aalib-key-down-OOB.patch

  # Fix 'return' with no value compiler warning
  patch -Np1 -i ../aalib-aalinuxkbd-return.patch

  # Fix build for ncurses built with opaque-curses option
  patch -Np1 -i ../aalib-opaque-ncurses-fix.patch

  # Fix rendering with custom aspect ratio
  patch -Np1 -i ../aalib-fix-aarender.patch

  # Fix typo for KEY_MOUSE condition
  patch -Np1 -i ../aalib-mouse.patch

  autoreconf -fi
}

build() {
  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd ${_pkgname}-1.4.0
  ./configure --prefix=/usr --mandir=/usr/share/man --infodir=/usr/share/info --libdir=/usr/lib32
  make
}

package() {
  cd ${_pkgname}-1.4.0
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{bin,include,share}
}
