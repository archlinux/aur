# Maintainer: yuhldr@qq.com
# Contributor: Wes Barnett <wes AT w barnett DOT us>
# Contributor: physkets <physkets // at // tutanota dot com>

_pkgname=lammps
pkgname=${_pkgname}-git
pkgver=38442.b620c52
pkgrel=1
pkgdesc="Large-scale Atomic/Molecular Massively Parallel Simulator"
url="https://lammps.sandia.gov/"
arch=('x86_64')
license=('GPL')
depends=('fftw' 'openmpi' 'ffmpeg' 'libpng')
makedepends=('cmake>=3.1' 'git' 'python-pip' 'python-build')
conflicts=('lammps')
provides=('lammps')
source=('git+https://github.com/lammps/lammps.git')
sha512sums=('SKIP')
optdepends=('clang' 'python' 'python-mpi4py')

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

  cmake \
      -D PKG_PHONON=on \
      -D PKG_KSPACE=on \
      -D PKG_MANYBODY=yes \
      -D PKG_PYTHON=yes \
    ../cmake \
    -DPKG_MOLECULE=yes \
    -DLAMMPS_EXCEPTIONS=yes \
    -DBUILD_LIB=yes \
    -DBUILD_SHARED_LIBS=yes \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX="/usr" \
    -DCMAKE_INSTALL_LIBDIR="lib" \
    -DCMAKE_INSTALL_LIBEXECDIR="/usr/lib"

  cmake --build . -j $(($(nproc) - 1))

  # phana
  cd ../tools/phonon/
  cmake -S . -B build
  cmake --build build

  # python lib
  cd ../../python/
  python -m build

}

package() {
  cd ${_pkgname}/build
  make DESTDIR="${pkgdir}" install

  mkdir -p "${pkgdir}/usr/share/examples/lammps"
  cp -r "../examples/." "${pkgdir}/usr/share/examples/lammps/"
  cp -r "../python/examples" "${pkgdir}/usr/share/examples/lammps/python/more"
  find "${pkgdir}/usr/share/examples/lammps/" -type f -exec chmod 644 '{}' +

  install -Dm644 "../tools/vim/lammps.vim" "${pkgdir}/usr/share/vim/vimfiles/syntax/lammps.vim"
  install -Dm644 "../tools/vim/filetype.vim" "${pkgdir}/usr/share/vim/vimfiles/ftdetect/lammps.vim"
  install -Dm644 "../tools/kate/lammps.xml" "${pkgdir}/usr/share/katepart5/syntax/lammps.xml"
  install -Dm755 "../tools/phonon/build/phana" "${pkgdir}/usr/bin/phana"

  # python lib
  PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps ../python/dist/*.whl
}
