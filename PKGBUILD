# Maintainer:  palkeo <contact@palkeo.com>

pkgname=apollo-git
pkgver=r3125.c9e7761
pkgrel=1
pkgdesc='Framework for deep learning in python build on top of Caffe'
arch=(x86_64)
url='https://github.com/Russell91/apollo'
license=('custom')

depends=(
         'cuda'
         'opencv'
         'openblas-lapack'
         'google-glog'
         'gflags'
         'liblmdb'
         'cython2'
         'ipython2'
         'python2-pillow'
         'python2-numpy'
         'python2-yaml'
         'python2-numpy'
         'python2-scipy'
         'python2-scikit-image'
         'python2-scikit-learn'
         'python2-matplotlib'
         'python2-h5py'
         'python2-leveldb-svn'
         'python2-networkx'
         'python2-nose'
         'python2-pandas'
         'python2-dateutil'
         'python2-protobuf'
         'python2-gflags'
         'python2-pandas'
         'boost'
         'boost-libs'
         'bc'
)
conflicts=('caffe')

source=('git+https://github.com/Russell91/apollo.git'
        'Makefile.config'
        'Makefile')

makedepends=('git' 'python2-setuptools')
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

build() {
  cp Makefile Makefile.config apollo/

  cd apollo

  # Patch any #!/usr/bin/python to #!/usr/bin/python2
  for file in $(find . -name '*.py' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done
 # Do the same for python examples
  for file in $(find . -name '*.py.example' -print); do
    sed -r -i 's_^#!.*/usr/bin/python(\s|$)_#!/usr/bin/python2_' $file
    sed -r -i 's_^#!.*/usr/bin/env(\s)*python(\s|$)_#!/usr/bin/env python2_' $file
  done

  # If the user has colormake installed then use that instead of make.
  if hash colormake 2>/dev/null; then
    colormake apollo
  else
    make apollo
  fi

}

package() {
  cd apollo

  # We don't need anything related to git in the package
  rm -rf .git*

  # Setup Python by hand since no setup.py 
  mkdir -p $pkgdir/usr/lib/python2.7/site-packages/apollo/
  cp python/caffe/proto/caffe_pb2.py $pkgdir/usr/lib/python2.7/site-packages/apollo/
  cp -R apollo/* $pkgdir/usr/lib/python2.7/site-packages/apollo/

  # Install shared libraries
  mkdir -p $pkgdir/usr/lib/
  install -Dm644 .build_release/lib/* "${pkgdir}/usr/lib/"

}

# vim:set ts=2 sw=2 et:

