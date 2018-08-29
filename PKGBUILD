# Maintainer: Han Luo <han dot luo at gmail dot com>
pkgname=mutationpp-git
provides=("${pkgname%-git}")
_pkgname=${pkgname%-git}
pkgver=r643.b100af0
pkgrel=1
#_config=linux-c-debug
pkgdesc="MUlticomponent Thermodynamic And Transport properties for partially IONized gases in C++"
arch=('i686' 'x86_64')
url="https://sync.vki.ac.be/mpp/mutationpp"
license=('GPL3')
depends=('eigen' 'gcc-libs')
checkdepends=('eigen')
makedepends=('python2' 'git' 'gcc' 'cmake')
source=("$_pkgname::git+https://sync.vki.ac.be/mpp/mutationpp.git")
sha256sums=('SKIP')
export MAKEFLAGS="-j"$(cat /proc/cpuinfo | awk '/^processor/{print $3}' | wc -l)

pkgver() {
  cd $_pkgname
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

prepare() {
  #  sed -i "s|\.\./install|/usr|" ${_pkgname}/CMakeLists.txt #change install location
  sed -i 's|^\(SET (CMAKE_INSTALL_PREFIX\).*$|\1 /usr CACHE PATH|' \
    ${_pkgname}/CMakeLists.txt #change install location

}

build() {
  # eigen32
  # cd $srcdir/${_pkgname}/thirdparty/eigen
  # mkdir -p build
  # cd build
  # cmake ../ -DCMAKE_INSTALL_PREFIX=/usr

  mkdir -p $srcdir/build
  cd $srcdir/build
  cmake ../${_pkgname}
  make $MAKEFLAGS
}

package() {
  # eigen32
  # cd $srcdir/$_pkgname/thirdparty/eigen/build
  # make $MAKEFLAGS DESTDIR="$pkgdir" install


  cd $srcdir/build
  make $MAKEFLAGS DESTDIR="$pkgdir" install

  # mutationpp data
  mkdir -p ${pkgdir}/opt/mutationpp/data
  cp -r $srcdir/$_pkgname/data ${pkgdir}/opt/mutationpp/

  mkdir -p ${pkgdir}/etc/profile.d
  cat > ${pkgdir}/etc/profile.d/mutationpp.sh << EOF
export MPP_DATA_DIRECTORY=/opt/mutationpp/data
export MPP_DIRECTORY=/usr
EOF
  chmod +x ${pkgdir}/etc/profile.d/mutationpp.sh

  # pkgconfig
  # ! not test, use as own risk
  install -d -m755 ${pkgdir}/usr/share/pkgconfig
  cat > ${pkgdir}/usr/share/pkgconfig/mutationpp.pc << EOF
prefix=/usr
exec_prefix=\${prefix}

Name: Mutation++
Description: ${pkgdesc}
Requires: eigen3
Version: ${pkgver}
Libs: -L\${prefix}/lib -lmutation++
Cflags: -I\${prefix}/include/mutation++
EOF
}
