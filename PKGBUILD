# $Id: PKGBUILD 82124 2013-01-09 01:12:19Z stephane $
# Maintainer: Stéphane Gaudreault <stephane@archlinux.org>

#pkgbase=python-pyopencl-git
#pkgname=('python2-pyopencl-git' 'python-pyopencl-git' 'pyopencl-headers-git')
pkgname=('python-pyopencl-git')
#pkgname=('python2-pyopencl-git')
#pkgname=('pyopencl-headers-git')
pkgver=20130125
pkgrel=4
pkgdesc="A complete, object-oriented language binding of OpenCL to Python"
arch=('i686' 'x86_64')
url="http://mathema.tician.de/software/pyopencl"
license=('custom')
makedepends=('ctags' 'python2-distribute' 'python-distribute' 'libcl' 'opencl-headers' 'mesa' 'boost' 'python2-mako' 'python-mako' 'python-numpy' 'python2-numpy')
source=('LICENSE.txt')
sha1sums=('2e6966b3d9b15603ce2c3ff79eeadd63c5d066b7')

_gitroot='git://github.com/inducer/pyopencl.git'
_gitname='pyopencl_cache'

build() {
   msg 'Connecting to github GIT server....'

   if [ -d $_gitname ] ; then
     pushd $_gitname
     git pull origin
     popd
     msg 'The local files are updated.'
   else
     git clone $_gitroot $_gitname
   fi

   msg 'GIT checkout done or server timeout'

   cd $_gitname

   git submodule update --init

   cd ${srcdir}

   for build in pyopencl pyopencl-python2
   do
     [ -d $build ] && rm -rf $build
     cp -r $_gitname $build
   done

   msg 'Starting make...'

   cd "${srcdir}/pyopencl"
   python3 ./configure.py --cl-enable-gl --no-use-shipped-boost --boost-python-libname=boost_python3
   python3 setup.py build

   cd "$srcdir/pyopencl-python2"
   python2 ./configure.py --cl-enable-gl --no-use-shipped-boost
   python2 setup.py build
}

package_python-pyopencl-git() {
   depends=('libcl' 'opencl-headers' 'mesa' 'boost' 'python' 'python-numpy' 'python-mako' 'python-pytools' 'pyopencl-headers-git')
   provides=('python-pyopencl')
   conflicts=('python-pyopencl')

   cd "${srcdir}/pyopencl"
   python3 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build

   rm -fr "${pkgdir}"/usr/include

   install -D -m644 ../LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

package_python2-pyopencl-git() {
   depends=('libcl' 'opencl-headers' 'mesa' 'boost' 'python2' 'python2-numpy' 'python2-mako' 'python2-pytools' 'pyopencl-headers-git')
   provides=('python2-pyopencl')
   conflicts=('python2-pyopencl')

   cd "${srcdir}/pyopencl-python2"
   python2 setup.py install --prefix=/usr --root="${pkgdir}" --optimize=1 --skip-build

   rm -fr "${pkgdir}"/usr/include

   install -D -m644 ../LICENSE.txt "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}

package_pyopencl-headers-git() {
   provides=('pyopencl-headers')
   conflicts=('pyopencl-headers')
   cd "${srcdir}/pyopencl"
   install -dm755 "${pkgdir}"/usr/include/pyopencl

   for file in src/cl/*.{h,cl}; do
      install -m644 ${file} "${pkgdir}"/usr/include/pyopencl
   done
}
