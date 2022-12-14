pkgname=plask-git
pkgver=2022.12.12
pkgrel=1
pkgdesc="Photonic LAser Simulation Kit: a comprehensive tool for numerical
analysis of broad range of physical phenomena in photonic devices"
url="https://plask.app"
arch=('x86_64')
license=('GPL3')
depends=('boost-libs' 'expat' 'openmp' 'intel-oneapi-mkl' 'lapack' 'qt5-declarative' 'qt5-tools'
         'python-numpy' 'python-matplotlib' 'python-lxml' 'python-yaml' 'pyside2' 'libx11')
makedepends=('git' 'sed' 'gcc' 'cmake' 'eigen' 'boost' 'doxygen' 'python-sphinx')
optdepends=('python-h5py: for saving results to files'
            'python-scipy: for scientific tools'
            'python-jedi: for Python hints in GUI'
            'python-paramiko: for remote computation launching'
            'ipython: for interactive shell')
source=("plask::git+https://github.com/PhotonicsTUL/PLaSK.git")
sha256sums=('SKIP')

pkgver() {
    cd plask
    git show -s --pretty=format:%ad --date=short | sed s/-/./g
}

build() {
    LD_LIBRARY_PATH="/opt/intel/oneapi/compiler/2022.1.0/linux/compiler/lib/intel64_lin:/opt/intel/oneapi/mkl/latest/lib/intel64"
    export LD_LIBRARY_PATH
    cmake -B build -S plask \
        -DCMAKE_BUILD_TYPE=None \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DSHOW_EXTENDED_WARNINGS=OFF \
        -DBUILD_QTHELP=ON \
        -DBUILD_GUI_TESTING=OFF \
        -DBUILD_PYTHON_MODULE=ON \
        -DINSTALL_PYTHON_PTH=ON \
        -DBLA_VENDOR=Intel10_64_dyn \
        -DZSH_COMPLETIONS_PATH=/usr/share/zsh/site-functions \
        -Wno-dev
    cmake --build build
}

check() {
    ctest --test-dir build --output-on-failure --timeout 600
}

package() {
  DESTDIR="$pkgdir" cmake --install build
  rm "$pkgdir/usr/share/doc/plask/changelog.Debian.gz"
  python -m compileall "$pkgdir/usr/lib/plask"
  python -O -m compileall "$pkgdir/usr/lib/plask"
}

