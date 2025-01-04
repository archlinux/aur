# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_name="gts"
pkgname="lib32-${_name}"
pkgver=0.7.6.121130
pkgrel=1
pkgdesc="Provides useful functions to deal with 3D surfaces meshed with interconnected triangles (32-bit)"
arch=('x86_64')
url="https://${_name}.sourceforge.net"
license=('LGPL-3.0-or-later')
depends=("${_name}" 'lib32-glib2' 'lib32-glibc')
provides=("lib${_name}.so") # lib${_name}-0.7.so
_pkgsrc="${_name}-snapshot-121130"
source=("${_pkgsrc}.tar.gz::https://gts.sourceforge.net/tarballs/${_pkgsrc}.tar.gz")
sha256sums=('c23f72ab74bbf65599f8c0b599d6336fabe1ec2a09c19b70544eeefdc069b73b')

# prepare() {
#   cd "${srcdir}/${_pkgsrc}/test"
#   chmod +x */*.sh
# }

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}/${_pkgsrc}"
  libtoolize
  autoreconf -vfi
  ./configure \
    --prefix='/usr' \
    --program-suffix="-32" \
    --lib{exec,}dir='/usr/lib32' \
    --build=i686-pc-linux-gnu
  make
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}
