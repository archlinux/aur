# Maintainer: yuhldr@qq.com
# Contributor: Wes Barnett <wes AT w barnett DOT us>
# Contributor: physkets <physkets // at // tutanota dot com>

_pkgname=lammps
pkgname=${_pkgname}-git
pkgver=patch_19Nov2024.r12.gcd16308
pkgrel=1
pkgdesc="Large-scale Atomic/Molecular Massively Parallel Simulator"
url="https://lammps.sandia.gov/"
arch=('x86_64')
license=('GPL')
depends=('fftw' 'openmpi' 'ffmpeg' 'libpng' 'python' 'qt6-charts')
makedepends=('cmake>=3.1' 'git' 'python-pip' 'python-build')
conflicts=('lammps')
provides=('lammps')
source=('git+https://github.com/lammps/lammps.git')
sha512sums=('SKIP')
optdepends=('clang' 'python' 'python-mpi4py')

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
        -D BUILD_LAMMPS_GUI=on \
        -D LAMMPS_EXCEPTIONS=on \
        -D BUILD_LIB=on \
        -D BUILD_SHARED_LIBS=on \
        -D CMAKE_BUILD_TYPE=Release \
        -D CMAKE_INSTALL_PREFIX="/usr" \
        -D CMAKE_INSTALL_LIBDIR="lib" \
        -D CMAKE_INSTALL_LIBEXECDIR="/usr/lib" \
    ../cmake

    cmake --build . -j $(($(nproc) - 1))

    # phana
    cd ../tools/phonon/
    cmake -S . -B build
    cmake --build build

    # python lib
    cd ../../python/
    rm -r dist
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
    #   install -Dm644 "../tools/kate/lammps.xml" "${pkgdir}/usr/share/katepart5/syntax/lammps.xml"
    install -Dm755 "../tools/phonon/build/phana" "${pkgdir}/usr/bin/phana"

    # python lib
    PIP_CONFIG_FILE=/dev/null pip install --isolated --root="$pkgdir" --ignore-installed --no-deps ../python/dist/*.whl

    rm ${pkgdir}/usr/lib/ld-linux-x86-64.so.2
    rm ${pkgdir}/usr/lib/libEGL.so.1
    rm ${pkgdir}/usr/lib/libEGL.so.1.1.0
    rm ${pkgdir}/usr/lib/libGLX.so.0
    rm ${pkgdir}/usr/lib/libGLX.so.0.0.0
    rm ${pkgdir}/usr/lib/libGLdispatch.so.0
    rm ${pkgdir}/usr/lib/libGLdispatch.so.0.0.0
    rm ${pkgdir}/usr/lib/libOpenGL.so.0
    rm ${pkgdir}/usr/lib/libOpenGL.so.0.0.0
    rm ${pkgdir}/usr/lib/libQt6Charts.so.6
    rm ${pkgdir}/usr/lib/libQt6Charts.so.6.8.1
    rm ${pkgdir}/usr/lib/libQt6Core.so.6
    rm ${pkgdir}/usr/lib/libQt6Core.so.6.8.1
    rm ${pkgdir}/usr/lib/libQt6DBus.so.6
    rm ${pkgdir}/usr/lib/libQt6DBus.so.6.8.1
    rm ${pkgdir}/usr/lib/libQt6Gui.so.6
    rm ${pkgdir}/usr/lib/libQt6Gui.so.6.8.1
    rm ${pkgdir}/usr/lib/libQt6OpenGL.so.6
    rm ${pkgdir}/usr/lib/libQt6OpenGL.so.6.8.1
    rm ${pkgdir}/usr/lib/libQt6OpenGLWidgets.so.6
    rm ${pkgdir}/usr/lib/libQt6OpenGLWidgets.so.6.8.1
    rm ${pkgdir}/usr/lib/libQt6Widgets.so.6
    rm ${pkgdir}/usr/lib/libQt6Widgets.so.6.8.1
    rm ${pkgdir}/usr/lib/libX11.so.6
    rm ${pkgdir}/usr/lib/libX11.so.6.4.0
    rm ${pkgdir}/usr/lib/libXau.so.6
    rm ${pkgdir}/usr/lib/libXau.so.6.0.0
    rm ${pkgdir}/usr/lib/libXdmcp.so.6
    rm ${pkgdir}/usr/lib/libXdmcp.so.6.0.0
    rm ${pkgdir}/usr/lib/libb2.so.1
    rm ${pkgdir}/usr/lib/libb2.so.1.0.4
    rm ${pkgdir}/usr/lib/libbrotlicommon.so.1
    rm ${pkgdir}/usr/lib/libbrotlicommon.so.1.1.0
    rm ${pkgdir}/usr/lib/libbrotlidec.so.1
    rm ${pkgdir}/usr/lib/libbrotlidec.so.1.1.0
    rm ${pkgdir}/usr/lib/libbz2.so.1.0
    rm ${pkgdir}/usr/lib/libbz2.so.1.0.8
    rm ${pkgdir}/usr/lib/libc.so.6
    rm ${pkgdir}/usr/lib/libcap.so.2
    rm ${pkgdir}/usr/lib/libcap.so.2.71
    rm ${pkgdir}/usr/lib/libdbus-1.so.3
    rm ${pkgdir}/usr/lib/libdbus-1.so.3.32.4
    rm ${pkgdir}/usr/lib/libdouble-conversion.so.3
    rm ${pkgdir}/usr/lib/libdouble-conversion.so.3.3.0
    rm ${pkgdir}/usr/lib/libevent_core-2.1.so.7
    rm ${pkgdir}/usr/lib/libevent_core-2.1.so.7.0.1
    rm ${pkgdir}/usr/lib/libevent_pthreads-2.1.so.7
    rm ${pkgdir}/usr/lib/libevent_pthreads-2.1.so.7.0.1
    rm ${pkgdir}/usr/lib/libexpat.so.1
    rm ${pkgdir}/usr/lib/libexpat.so.1.10.0
    rm ${pkgdir}/usr/lib/libfabric.so.1
    rm ${pkgdir}/usr/lib/libfabric.so.1.25.0
    rm ${pkgdir}/usr/lib/libfftw3.so.3
    rm ${pkgdir}/usr/lib/libfftw3.so.3.6.10
    rm ${pkgdir}/usr/lib/libfftw3_omp.so.3
    rm ${pkgdir}/usr/lib/libfftw3_omp.so.3.6.10
    rm ${pkgdir}/usr/lib/libfontconfig.so.1
    rm ${pkgdir}/usr/lib/libfontconfig.so.1.14.0
    rm ${pkgdir}/usr/lib/libfreetype.so.6
    rm ${pkgdir}/usr/lib/libfreetype.so.6.20.2
    rm ${pkgdir}/usr/lib/libgcc_s.so.1
    rm ${pkgdir}/usr/lib/libglib-2.0.so.0
    rm ${pkgdir}/usr/lib/libglib-2.0.so.0.8200.2
    rm ${pkgdir}/usr/lib/libgomp.so.1
    rm ${pkgdir}/usr/lib/libgomp.so.1.0.0
    rm ${pkgdir}/usr/lib/libgraphite2.so.3
    rm ${pkgdir}/usr/lib/libgraphite2.so.3.2.1
    rm ${pkgdir}/usr/lib/libharfbuzz.so.0
    rm ${pkgdir}/usr/lib/libharfbuzz.so.0.61010.0
    rm ${pkgdir}/usr/lib/libhwloc.so.15
    rm ${pkgdir}/usr/lib/libhwloc.so.15.8.1
    rm ${pkgdir}/usr/lib/libicudata.so.75
    rm ${pkgdir}/usr/lib/libicudata.so.75.1
    rm ${pkgdir}/usr/lib/libicui18n.so.75
    rm ${pkgdir}/usr/lib/libicui18n.so.75.1
    rm ${pkgdir}/usr/lib/libicuuc.so.75
    rm ${pkgdir}/usr/lib/libicuuc.so.75.1
    rm ${pkgdir}/usr/lib/libjpeg.so.8
    rm ${pkgdir}/usr/lib/libjpeg.so.8.3.2
    rm ${pkgdir}/usr/lib/libm.so.6
    rm ${pkgdir}/usr/lib/libmd4c.so.0
    rm ${pkgdir}/usr/lib/libmd4c.so.0.5.2
    rm ${pkgdir}/usr/lib/libmpi.so.40
    rm ${pkgdir}/usr/lib/libmpi.so.40.40.5
    rm ${pkgdir}/usr/lib/libnuma.so.1
    rm ${pkgdir}/usr/lib/libnuma.so.1.0.0
    rm ${pkgdir}/usr/lib/libopen-pal.so.80
    rm ${pkgdir}/usr/lib/libopen-pal.so.80.0.4
    rm ${pkgdir}/usr/lib/libpcre2-16.so.0
    rm ${pkgdir}/usr/lib/libpcre2-16.so.0.13.0
    rm ${pkgdir}/usr/lib/libpcre2-8.so.0
    rm ${pkgdir}/usr/lib/libpcre2-8.so.0.13.0
    rm ${pkgdir}/usr/lib/libpmix.so.2
    rm ${pkgdir}/usr/lib/libpmix.so.2.13.4
    rm ${pkgdir}/usr/lib/libpng16.so.16
    rm ${pkgdir}/usr/lib/libpng16.so.16.44.0
    rm ${pkgdir}/usr/lib/libpython3.12.so.1.0
    rm ${pkgdir}/usr/lib/libsframe.so.1
    rm ${pkgdir}/usr/lib/libsframe.so.1.0.0
    rm ${pkgdir}/usr/lib/libstdc++.so.6
    rm ${pkgdir}/usr/lib/libstdc++.so.6.0.33
    rm ${pkgdir}/usr/lib/libsystemd.so.0
    rm ${pkgdir}/usr/lib/libsystemd.so.0.39.0
    rm ${pkgdir}/usr/lib/libucm.so.0
    rm ${pkgdir}/usr/lib/libucm.so.0.0.0
    rm ${pkgdir}/usr/lib/libucp.so.0
    rm ${pkgdir}/usr/lib/libucp.so.0.0.0
    rm ${pkgdir}/usr/lib/libucs.so.0
    rm ${pkgdir}/usr/lib/libucs.so.0.0.0
    rm ${pkgdir}/usr/lib/libuct.so.0
    rm ${pkgdir}/usr/lib/libuct.so.0.0.0
    rm ${pkgdir}/usr/lib/libudev.so.1
    rm ${pkgdir}/usr/lib/libudev.so.1.7.9
    rm ${pkgdir}/usr/lib/libxcb.so.1
    rm ${pkgdir}/usr/lib/libxcb.so.1.1.0
    rm ${pkgdir}/usr/lib/libxkbcommon.so.0
    rm ${pkgdir}/usr/lib/libxkbcommon.so.0.0.0
    rm ${pkgdir}/usr/lib/libz.so.1
    rm ${pkgdir}/usr/lib/libz.so.1.3.1
    rm ${pkgdir}/usr/lib/libzstd.so.1
    rm ${pkgdir}/usr/lib/libzstd.so.1.5.6

}
