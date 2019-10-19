# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# shellcheck disable=SC2034
_name="luxcorerender"
_ver_tag="luxcorerender_v2.2"
{ IFS='.'; read _ver_major _ver_minor; ((_ver_minor++)); unset IFS; } <<<${_ver_tag#luxcorerender_v}
pkgname=${_name}-git
pkgver=2.3.r109.g537cedd54
epoch=2
pkgrel=1
pkgdesc="Physically correct, unbiased rendering engine."
arch=('x86_64')
url="https://www.luxcorerender.org/"
license=('Apache')
depends=(oidn openimageio boost-libs blosc embree glfw gtk3 opencl-icd-loader)
optdepends=("opencl-driver: for gpu acceleration"
            "pyside2: for pyluxcoretools gui")
makedepends=(boost git doxygen cmake pyside2-tools opencl-headers)
conflicts=(luxrays-hg luxcorerender)
provides=(luxrays luxcorerender=${epoch}:${_ver_major}.${_ver_minor})
options=('!buildflags')
source=("${_name}::git+https://github.com/LuxCoreRender/LuxCore.git${_fragment}"
        "python.patch"
        "glfw.patch"
        "boost016900_serialization.patch"
        )
sha256sums=('SKIP'
            '92bf04a12ce6a1f559eb3b129e324e0349e3b9f8da1976dae6e16704a031b359'
            '4e04c3eb653f00d2389aff8e7fda2d244e258cbca3a22e32c13388a3984e4bb1'
            '495d183aef045e53ec8c53aa08cdcc082fb4e69ccb0857693cb0cf2684db0760')

pkgver() {
  cd ${srcdir}/${_name}
  [ -v _ver_tag ] && printf %d.%d.r%s.g%s $_ver_major $_ver_minor $(git rev-list ${_ver_tag}..HEAD --count) $(git log --pretty=format:'%h' -n 1) \
                  || git describe --long --tags | sed 's/^luxcorerender_v//;s/beta/\.beta/;;s/\([^-]*-g\)/r\1/;s/-/./g'
}


prepare() {
  cd ${srcdir}/${_name}
  git apply -v ${srcdir}/*.patch
}

build() {
  _pyver=$(python -c "from sys import version_info; print(\"%d%d\" % (version_info[0],version_info[1]))")
  mkdir -p ${srcdir}/build && cd ${srcdir}/build
  cmake -DPYTHON_V=${_pyver} ${srcdir}/${_name}
  make
}

package() {
  cd ${srcdir}/build

  install -d -m755 ${pkgdir}/usr/{bin,include,lib}
  install -m755 bin/* ${pkgdir}/usr/bin
  install -m644 lib/* ${pkgdir}/usr/lib
  cp -a ${srcdir}/${_name}/include ${pkgdir}/usr
  for file in ${pkgdir}/usr/include/*/*.in; do mv $file ${file%.in}; done

  # install pyluxcore to the Python search path
  #  _pypath=`pacman -Ql python | sed -n '/\/usr\/lib\/python[^\/]*\/$/p' | cut -d" " -f 2`
  _pypath=`python -c 'import sys;print("/usr/lib/python{}.{}".format(sys.version_info.major,sys.version_info.minor))'`
  install -d -m755 ${pkgdir}/${_pypath}
  mv ${pkgdir}/usr/lib/pyluxcore.so ${pkgdir}/${_pypath}
}

# vim:set ts=2 sw=2 et:
