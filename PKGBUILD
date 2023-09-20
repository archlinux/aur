# Maintainer: Nikolaos Bezirgiannis

pkgname=blst-git
pkgver=0.3.11.r10.g9c87d4a
pkgrel=1
pkgdesc='Multilingual BLS12-381 signature library'
arch=('aarch64' 'x86_64')
url='https://github.com/supranational/blst'
license=('Apache')
depends=('glibc')
makedepends=('git')
provides=("blst=$pkgver")
conflicts=('blst')
source=("git+https://github.com/supranational/blst.git")
options=('staticlibs')
sha256sums=('SKIP')


pkgver() {
  cd "blst"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
cd "blst"
./build.sh -shared
}

package() {
cd "blst"
install -Dm755 -t "${pkgdir}/usr/lib" libblst.so
install -Dm644 -t "${pkgdir}/usr/lib" libblst.a
install -Dm644 -t "${pkgdir}/usr/include" bindings/*.h
install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/blst/LICENSE"

mkdir -p ${pkgdir}/usr/lib/pkgconfig
cat <<EOF > ${pkgdir}/usr/lib/pkgconfig/libblst.pc
prefix=/usr
exec_prefix=\${prefix}
libdir=\${exec_prefix}/lib
includedir=\${prefix}/include

Name: libblst
Description: ${pkgdesc}
URL: ${url}
Version: ${pkgver}

Cflags: -I\${includedir}
Libs: -L\${libdir} -lblst
Libs.private:
EOF
}
