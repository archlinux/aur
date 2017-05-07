# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: jtts <jussaar@mbnet.fi>
# Contributor: Tom Gundersen <teg@jklm.no>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>
# Contributor: Franco Tortoriello <franco.tortoriello@gmail.com>
# Contributor: josephgbr <rafael.f.f1@gmail.com>

pkgname=lib32-libtirpc
pkgver=1.0.1
pkgrel=2
pkgdesc='Transport Independent RPC library (SunRPC replacement)'
arch=('x86_64')
url='http://libtirpc.sourceforge.net/'
license=('BSD')
depends=('lib32-krb5' 'libtirpc')
makedepends=('gcc-multilib')
source=("https://downloads.sourceforge.net/sourceforge/libtirpc/libtirpc-${pkgver}.tar.bz2"
        'add_missing_rwlock_unlocks_in_xprt_register.diff'
        CVE-2017-8779.patch)
sha256sums=('5156974f31be7ccbc8ab1de37c4739af6d9d42c87b1d5caf4835dda75fcbb89e'
            '8bcdbd700ec6f8b5f87881251f9851174df233975d95a8dfdf7359f057fb3b80'
            '091d3ff2b53a3ef9b20c61af19192434f652e528070fd57c706bce2988de0279')

prepare() {
  cd libtirpc-${pkgver}

  patch -Np1 -i ../add_missing_rwlock_unlocks_in_xprt_register.diff
  # http://seclists.org/oss-sec/2017/q2/209
  patch -Np1 -i ../CVE-2017-8779.patch
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
