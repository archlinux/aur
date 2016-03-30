# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=lib32-talloc
pkgver=2.1.6
pkgrel=1
pkgdesc='A hierarchical pool based memory allocator with destructors'
arch=('x86_64')
url='http://talloc.samba.org/'
license=('GPL3')
source=("http://samba.org/ftp/talloc/talloc-${pkgver}.tar.gz")
depends=('lib32-glibc' 'talloc')
makedepends=('gcc-multilib' 'lib32-python2')
sha256sums=('3b8e1a50bacb359d99942e0dd9941cef779ae4b5eb20f138873bd8270cb1d47b')

prepare() {
  cd talloc-${pkgver}

  sed -i 's/python/python2/g' buildtools/bin/waf
}

build() {
  cd talloc-${pkgver}

  export CC='gcc -m32'
  export CXX='g++ -m32'
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'
  export PYTHON='/usr/bin/python2-32'
  export PYTHON_CONFIG='/usr/bin/python2-32-config'

  ./configure \
    --prefix='/usr' \
    --libdir='/usr/lib32' \
    --localstatedir='/var'\
    --sysconfdir='/etc/samba' \
    --enable-talloc-compat1
  make
}

package() {
  cd talloc-${pkgver}

  make DESTDIR="${pkgdir}" install

  rm -rf "${pkgdir}"/usr/{include,share}
}

# vim: ts=2 sw=2 et:
