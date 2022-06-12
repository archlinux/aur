# Maintainer: acxz <akashpatel2008 at yahoo dot com>
pkgname=amino-git
pkgver=r1728.f8926ae
pkgrel=1
pkgdesc="Lightweight robotics utility library"
arch=('i686' 'x86_64')
url="https://www.github.com/golems/amino"
license=('BSD 3-Clause')
depends=('gcc' 'gcc-fortran' 'cblas' 'lapack' 'maxima' 'flex' 'autoconf'
         'autoconf-archive' 'automake' 'libtool' 'git' 'freeglut' 'sdl2' 'nlopt'
         'octomap')
optdepends=('blender: used to convert mesh files'
            'sbcl: robot models'
            'quicklisp: robot models'
            'povray: raytracing'
            'ffmpeg: raytracing'
            'fcl: motion planning'
            'ompl: motion planning'
            'jdk-openjdk: java bindings'
            'coin-or-clp: optimization'
            'glpk: optimization'
            'lpsolve: optimization')
_name=amino
source=("git+https://github.com/golems/${_name}.git")
md5sums=('SKIP')

pkgver() {
  cd "${_name}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "${srcdir}/${_name}"

    git submodule init && git submodule update && autoreconf -i
    ./configure

    # Applying a fix to configured makefile
    # Requires cblas along with openblas since openblas package does not support
    # blas (openblas upstream problem)
    sed -i 's/-lblas/-lblas -lcblas/g' Makefile

    make
}

package() {
    cd "${srcdir}/${_name}"
    make DESTDIR="${pkgdir}/" install
}
