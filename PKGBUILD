# Maintainer: Grey Christoforo <first name [at] last name [dot] net>

pkgname=arcus
pkgver=2.1.3
pkgrel=1
pkgdesc="Communication library between internal components for Ultimaker software"
url="https://github.com/Ultimaker/libArcus"
#arch=('i686' 'x86_64')
arch=('any')
license=('GPLv3')

makedepends=('cmake' 'git')
depends=('python' 'protobuf' 'python-sip')
source=(https://github.com/Ultimaker/libArcus/archive/${pkgver}.tar.gz)

md5sums=('1f405773a2a97890abbd6b499fb36afc')

prepare() {
  # this is to avoid having to install protobuf3 system-wide (which removes protobuf
  # and breaks some stuff) the need for this will go away as soon as Arch officially
  # updates to protobuf3
  git clone https://aur.archlinux.org/protobuf3.git
  cd protobuf3
  makepkg --noarchive --noconfirm
}

build() {
  cd libArcus-${pkgver}
  mkdir -p build
  cd build
  SITE_PACKAGES=$(python -c "from distutils.sysconfig import get_python_lib; print(get_python_lib())")
  PROTO_BASE="${srcdir}/protobuf3/pkg/protobuf3"
  
  LD_LIBRARY_PATH="${PROTO_BASE}/usr/lib" cmake .. \
  -DCMAKE_INSTALL_PREFIX=${pkgdir}${SITE_PACKAGES} \
  -DCMAKE_BUILD_TYPE=Release \
  -DBUILD_EXAMPLES=OFF \
  -DBUILD_STATIC=ON \
  -DProtobuf_INCLUDE_DIR="$PROTO_BASE/usr/include/" \
  -DProtobuf_LIBRARY_DEBUG="$PROTO_BASE/usr/lib/libprotobuf.so" \
  -DProtobuf_LIBRARY_RELEASE="$PROTO_BASE/usr/lib/libprotobuf.so" \
  -DProtobuf_LITE_LIBRARY_DEBUG="$PROTO_BASE/usr/lib/libprotobuf.so" \
  -DProtobuf_LITE_LIBRARY_RELEASE="$PROTO_BASE/usr/lib/libprotobuf.so" \
  -DProtobuf_PROTOC_EXECUTABLE="$PROTO_BASE/usr/bin/protoc" \
  -DProtobuf_PROTOC_LIBRARY_DEBUG="$PROTO_BASE/usr/lib/libprotoc.so" \
  -DProtobuf_PROTOC_LIBRARY_RELEASE="$PROTO_BASE/usr/lib/libprotoc.so"

  LD_LIBRARY_PATH="${PROTO_BASE}/usr/lib" make
}

package() {
  cd libArcus-${pkgver}/build
  make install
  install -Dm644 "${srcdir}/libArcus-${pkgver}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
