# Maintainer: yuhldr@qq.com
# Contributor: Wes Barnett <wes AT w barnett DOT us>
# Contributor: physkets <physkets // at // tutanota dot com>

_pkgname=lammps
pkgname=${_pkgname}-git
pkgver=34715.7fbb609
pkgrel=1
pkgdesc="Large-scale Atomic/Molecular Massively Parallel Simulator"
url="https://lammps.sandia.gov/"
arch=('x86_64')
license=('GPL')
depends=('fftw' 'openmpi' 'ffmpeg' 'libpng' 'python')
makedepends=('cmake>=3.1')
conflicts=('lammps')
provides=('lammps')
source=('git+https://github.com/lammps/lammps.git')
sha512sums=('SKIP')
optdepends=()

prepare() {
  cd ${_pkgname}
  filepath=$(echo $(cd ../../ && pwd))/my_pair

  if [ -d "$filepath"  ] && [ "`ls -A $filepath`" != "" ];then
    msg2 ""
    msg2 "*******  Custom potential energy has been copied  *******"
    msg2 "*******  自定义势能已经复制  *******"
    cp "$filepath"/* ./src/
  else
    mkdir -p "$filepath"
    msg2 "Before installation, you can add custom potential energy in $filepath"
    msg2 "安装前，可以在 $filepath 添加自定义势能"
  fi
  msg2 "3"
  sleep 1
  msg2 "2"
  sleep 1
  msg2 "1"
  sleep 1

  rm -rf build
  mkdir -p build
}

build() {
  cd ${_pkgname}/build

  # Currently, `basic.cmake`, which contains `KSPACE MANYBODY MOLECULE RIGID`
  # `-C ../cmake/presets/basic.cmake` Can be deleted
  # Add packages here by using -D PKG_<NAME>=on
  # See manual for list of packages
  # See https://docs.lammps.org/Build_package.html

  # 当前使用默认 `basic.cmake` 其中包含 KSPACE MANYBODY MOLECULE RIGID
  # 可在 `../cmake/presets/basic.cmake` 文件中查看
  # `-C ../cmake/presets/basic.cmake` 可删除
  # 然后根据lammps文档: https://docs.lammps.org/Build_package.html 手动添加你需要的包
  # 用 -D PKG_包名=on 添加到 ../cmake \ 前面即可，例如：

  # -D BUILD_SHARED_LIBS=on \
  # -D LAMMPS_EXCEPTIONS=on \
  # -D PKG_PYTHON=on \
  # -D PKG_PHONON=on \

  cmake \
    -C ../cmake/presets/basic.cmake \
      -D BUILD_SHARED_LIBS=on \
      -D LAMMPS_EXCEPTIONS=on \
      -D PKG_PYTHON=on \
      -D PKG_PHONON=on \
    ../cmake \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="$pkgdir/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DCMAKE_INSTALL_LIBEXECDIR="$pkgdir/usr/lib"

  msg2 ""
  msg2 "*******  All cores will be used to speed up the compilation. During this period, the computer will jam. Please wait...  *******"
  msg2 "*******  将使用所有核心加快编译，期间电脑将会卡顿，请等待  *******"
  msg2 "5"
  sleep 1
  msg2 "4"
  sleep 1
  msg2 "3"
  sleep 1
  msg2 "2"
  sleep 1
  msg2 "1"
  sleep 1

  cmake --build . -j
}

package() {
  cd ${_pkgname}/build

  cmake --install .

}
