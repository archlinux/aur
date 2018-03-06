# Maintainer: Rafael Fontenelle <rafaelff@gnome.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Tobias Powalowski <tpowa@archlinux.org>

pkgname=lib32-talloc
pkgver=2.1.11
pkgrel=1
pkgdesc='A hierarchical pool based memory allocator with destructors'
arch=('x86_64')
url='http://talloc.samba.org/'
license=('GPL3')
source=("https://samba.org/ftp/talloc/talloc-${pkgver}.tar.gz")
depends=('lib32-glibc' 'talloc')
makedepends=('lib32-python2')
sha256sums=('639eb35556a0af999123c4d883e79be05ff9f00ab4f9e4ac2e5775f9c5eeeed3')

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

  ./configure --prefix=/usr \
     --libdir='/usr/lib32' \
     --sysconfdir=/etc/samba \
     --localstatedir=/var \
     --bundled-libraries=NONE \
     --builtin-libraries=replace \
     --enable-talloc-compat1

  make
}

package() {
  cd talloc-${pkgver}
  make DESTDIR="${pkgdir}" install
  rm -rf "${pkgdir}"/usr/{include,share}
}

# vim: ts=2 sw=2 et:
