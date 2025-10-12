# Maintainer: yuhldr@qq.com
# Contributor: Wes Barnett <wes AT w barnett DOT us>
# Contributor: physkets <physkets // at // tutanota dot com>

_pkgname=lammps
pkgname=${_pkgname}-git
pkgver=patch_10Sep2025.r24.gccca772
pkgrel=1
pkgdesc="Large-scale Atomic/Molecular Massively Parallel Simulator"
url="https://lammps.sandia.gov/"
arch=('x86_64')
license=('GPL')
depends=('fftw' 'openmpi' 'ffmpeg' 'libpng' 'python')
makedepends=('cmake>=3.1' 'git' 'python-pip' 'python-build')
conflicts=('lammps')
provides=('lammps')
source=('git+https://github.com/lammps/lammps.git')
sha512sums=('SKIP')
optdepends=('clang' 'python-mpi4py')

pkgver() {
    # https://wiki.archlinux.org/title/VCS_package_guidelines#Git
    cd $srcdir/${_pkgname}
    ( set -o pipefail
      git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
      printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    )
}

prepare() {
    cd ${_pkgname}

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
        -D PKG_MOLECULE=on \
        -D PKG_PYTHON=on \
        -D PKG_PHONON=on \
        -D PKG_KSPACE=on \
        -D PKG_MANYBODY=on \
        -D LAMMPS_EXCEPTIONS=on \
        -D BUILD_LIB=on \
        -D BUILD_SHARED_LIBS=on \
        -D CMAKE_BUILD_TYPE=Release \
        -D CMAKE_INSTALL_PREFIX="/usr" \
        -D CMAKE_INSTALL_LIBDIR="lib" \
        -D CMAKE_INSTALL_LIBEXECDIR="/usr/lib" \
    ../cmake

        # -D BUILD_LAMMPS_GUI=on \

    cmake --build . -j $(($(nproc) - 1))

    # python lib
    cd ../python/
    rm -rf dist
    python -m build

    # phana
    # cd ../tools/phonon/
    # cmake -S . -B build
    # cmake --build build
}

package() {
    cd ${_pkgname}/build
    make DESTDIR="${pkgdir}" install

    # mkdir -p "${pkgdir}/usr/share/examples/lammps"
    # cp -r "../examples/." "${pkgdir}/usr/share/examples/lammps/"
    # cp -r "../python/examples" "${pkgdir}/usr/share/examples/lammps/python/more"
    # find "${pkgdir}/usr/share/examples/lammps/" -type f -exec chmod 644 '{}' +

    install -Dm644 "../tools/vim/lammps.vim" "${pkgdir}/usr/share/vim/vimfiles/syntax/lammps.vim"
    install -Dm644 "../tools/vim/filetype.vim" "${pkgdir}/usr/share/vim/vimfiles/ftdetect/lammps.vim"

    # install -Dm755 "../tools/phonon/build/phana" "${pkgdir}/usr/bin/phana"

    # python lib
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps ../python/dist/*.whl

}
