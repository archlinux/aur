# Maintainer:  Michael Stergianis <michaelstergianis at gmail dot com>
#
# A thanks to Daniel Bermond for some inspiration (code) in the PKGBUILD
pkgname=caffe-cmake-git
pkgver=1.0.r50.gc430690aa
pkgrel=2
epoch=
pkgdesc="A deep learning framework made with expression, speed, and modularity in mind. Uses cmake to build giving great flexibility."
arch=('x86_64')
url="http://caffe.berkeleyvision.org/"
license=('BSD')
depends=(
    # official repositories:
        'boost-libs' 'protobuf' 'google-glog' 'gflags' 'hdf5' 'opencv' 'leveldb'
        'lmdb' 'cuda' 'cudnn' 'python' 'boost' 'cython' 'python-numpy' 'python-scipy'
        'python-matplotlib' 'ipython' 'python-h5py' 'python-networkx' 'python-nose'
        'python-pandas' 'python-dateutil' 'python-protobuf' 'python-gflags'
        'python-yaml' 'python-pillow' 'python-six'
    # AUR:
        # required:
            'openblas-lapack'
        # not required:
            # 'nccl'
        #python:
            'python-leveldb' 'python-scikit-image' 'python-pydotplus'
    # NOTE:
    # python-pydotplus (or python-pydot) is required by python executable draw_net.py
    # https://github.com/BVLC/caffe/blob/691febcb83d6a3147be8e9583c77aefaac9945f8/python/caffe/draw.py#L7-L22
)
makedepends=('git' 'gcc6' 'doxygen' 'texlive-core' 'cmake')
provides=('caffe')
conflicts=('caffe' 'caffe-cpu' 'caffe-cpu-git' 'caffe-dr-git' 'caffe-mnc-dr-git'
           'caffe2' 'caffe2-git' 'caffe2-cpu' 'caffe2-cpu-git')
source=("${pkgname}"::"git+https://github.com/BVLC/caffe.git")
md5sums=('SKIP')

pkgver() {
    cd "$pkgname"
    
    # git, tags available
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$pkgname"

  # give the user options as to how they will install
  # COMMENT if you do not wish to edit the configuration
  $EDITOR CMakeLists.txt
}

build() {
  cd "${srcdir}/$pkgname"
  mkdir "build"
  cd build
  cmake -DBLAS=open ..
  ## UNCOMMENT if you wish to have a parallelized build. Race conditions may arise.
  # make -j4 all
  make all
}

# uncomment this block if you want to run the checks/tests
#check() {
#    cd "$pkgname"
#    msg2 "Building target 'test'..."
#    make test
#    msg2 "Making target 'runtest'..."
#    make runtest
#}

package() {
  cd "${srcdir}/$pkgname/build"
  make install

  # move python files over
  cd "${srcdir}/$pkgname/build/install"
  mkdir -p usr
  mkdir -p "${pkgdir}/usr/lib/python3.6/site-packages/"
  cd "${srcdir}/$pkgname/build/install/python"
  mv caffe/ "${pkgdir}/usr/lib/python3.6/site-packages/"
  mkdir -p "${pkgdir}/usr/share/Caffe/python/examples/"
  mv *.py "${pkgdir}/usr/share/Caffe/python/examples/"

  # remove python folder
  cd "${srcdir}/$pkgname/build/install"
  /usr/bin/rm -rf python

  # move everything else over
  cd "${srcdir}/$pkgname/build/install"
  mv share/ usr/
  mv bin/ usr/
  mv lib64 usr/lib
  cp * -r "${pkgdir}"
}

# vim:set ts=2 sw=2 et:
