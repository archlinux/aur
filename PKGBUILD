# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
pkgname=luxcorerender-git
pkgver=2.2alpha1.r11.gb1b91b90f
pkgrel=1
pkgdesc="LuxCoreRender: a physically correct, unbiased rendering engine."
arch=('x86_64')
url="https://www.luxcorerender.org/"
license=('Apache')
depends=(openimageio boost-libs blosc embree glfw-x11 gtk3 oidn opencl-icd-loader)
optdepends=("opencl-driver: for gpu acceleration"
            "pyside2: for pyluxcoretools gui")
makedepends=(boost git doxygen cmake pyside2-tools opencl-headers)
conflicts=(luxrays-hg luxcorerender)
provides=(luxrays luxcorerender)
options=('!buildflags')
source=("git+https://github.com/LuxCoreRender/LuxCore.git"
        "python.patch"
        "glfw.patch"
        "boost016900_serialization.patch"
        )
md5sums=('SKIP'
         '8e2fd7337fe6afaf5b2801426837f600'
         'e2a20172b7b7ac92a7002b6218afe327'
         '52f097678654151e2b5427d271a7e69d')

pkgver() {
  cd ${srcdir}/LuxCore
#  git describe --long --tags | sed 's/^luxcorerender_v//;s/beta/\.beta/;;s/\([^-]*-g\)/r\1/;s/-/./g'
  printf "%s.r%d.g%s" "2.2alpha1" $(git rev-list --count luxcorerender_v2.2alpha1..HEAD) $(git log --pretty=format:'%h' -n 1)
} 


prepare() {
  cd ${srcdir}/LuxCore
  git apply -v ${srcdir}/*.patch
}

build() {
  cd ${srcdir}/LuxCore
  mkdir -p build && cd build
  ((TRAVIS)) && {
    suppress_warnings="-Wno-implicit-fallthrough -Wno-class-memaccess"
    CFLAGS="$CFLAGS $suppress_warnings"
    CXXFLAGS="$CXXFLAGS $suppress_warnings"
  }
  msg "cflags=\"$CFLAGS\""
  msg "cxxflags=\"$CXXFLAGS\""

  cmake -DPYTHON_V=3 ..
  make
}

package() {
  cd ${srcdir}/LuxCore/build

  install -d -m755 ${pkgdir}/usr/{bin,include,lib}
  install -m755 bin/* ${pkgdir}/usr/bin
  install -m644 lib/* ${pkgdir}/usr/lib
  cp -a ../include ${pkgdir}/usr
  for file in ${pkgdir}/usr/include/*/*.in; do mv $file ${file%.in}; done

  # install pyluxcore to the Python search path
  #  _pypath=`pacman -Ql python | sed -n '/\/usr\/lib\/python[^\/]*\/$/p' | cut -d" " -f 2`
  _pypath=`python -c 'import sys;print("/usr/lib/python{}.{}".format(sys.version_info.major,sys.version_info.minor))'`
  install -d -m755 ${pkgdir}/${_pypath}
  mv ${pkgdir}/usr/lib/pyluxcore.so ${pkgdir}/${_pypath}
}

# vim:set ts=2 sw=2 et:
