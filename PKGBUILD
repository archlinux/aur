# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: jtts <jussaar@mbnet.fi>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Franco Tortoriello <franco.tortoriello@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=lib32-libtirpc
pkgver=0.3.2
pkgrel=1
pkgdesc='Transport Independent RPC library (SunRPC replacement)'
arch=('x86_64')
url='http://libtirpc.sourceforge.net/'
license=('BSD')
depends=('lib32-krb5' 'libtirpc')
makedepends=('gcc-multilib')
source=("http://downloads.sourceforge.net/sourceforge/libtirpc/libtirpc-${pkgver}.tar.bz2"
        'fix_missing_rpc_get_default_domain.patch')
sha256sums=('2008a379f37f2c5d5a87a568b06707422cc3e4f5da305f7fb71f3f4c6d473ffc'
            'fb731fc2d6617e97ef87c6cc5b4bc95b8153d4e0a85f9a5a4b64d3dc94741c05')

prepare() {
  cd libtirpc-${pkgver}

  patch -Np1 -i ../fix_missing_rpc_get_default_domain.patch
}

build() {
  cd libtirpc-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --sysconfdir='/etc'
  make
}

package() {
  cd libtirpc-${pkgver}

  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/{etc,usr/{include,share}}

  install -dm 755 "${pkgdir}"/usr/share/licenses
  ln -s libtirpc "${pkgdir}"/usr/share/licenses/${pkgname}
}

# vim: ts=2 sw=2 et:
