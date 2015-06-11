# Maintainer:  jyantis <yantis@yantis.net>

pkgname=caffe-git
pkgver=r3035.543afd3
pkgrel=2
pkgdesc='A fast framework for deep learning built in C++ for speed with a Python 2 interface'
arch=(x86_64)
url='https://github.com/BVLC/caffe'
license=('custom')

# if using an AWS EC2 make sure to use the community repo for cuda and not the ec2 repo. 
depends=('cuda'
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

source=('git+https://github.com/BVLC/caffe.git'
        'classify-print-results.py'
        'Makefile.config')
makedepends=('git' 'python2-setuptools' 'gcc-fortran')
provides=('caffe' 'pycaffe' 'python2-pycaffe' )
conflicts=('caffe' 'pycaffe' 'python2-pycaffe' 'pycaffe-git' 'python2-pycaffe-git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd caffe
  set -o pipefail
  _gitversion=$( git describe --long | sed -r 's/([^-]*-g)/r\1/;s/-/./g' ||
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" )
  printf "%s" $_gitversion
}

build() {
  # You can modify this file and do some stuff like turn off using the GPU etc
  cp Makefile.config caffe

  # Modified classify.py for testing that will output results
  cp classify-print-results.py caffe/python/

  cd caffe

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
    colormake all
    colormake pycaffe
  else
    make all
    make pycaffe
  fi

  msg "Downloading the ImageNet Caffe model and labels" 
  python2 scripts/download_model_binary.py models/bvlc_reference_caffenet # 232 MB
  sh data/ilsvrc12/get_ilsvrc_aux.sh # 17 MB

  msg "Downloading the mnist data"
  sh data/mnist/get_mnist.sh #10 MB
}

# check() {
#   cd caffe

#   # Unrem these next two lines to run the 838 tests
#   # make test
#   # make runtest

#   # A simple test to make sure its working (Attempt to classify a picture of a cat)
#   # Expected result: [('tabby', '0.27933'), ('tiger cat', '0.21915'), ('Egyptian cat', '0.16064'), ('lynx', '0.12844'), ('kit fox', '0.05155')]
#   python2 python/classify-print-results.py --print_results examples/images/cat.jpg foo
#   msg "Tested that everything works.. you should see some cat type classifiations above this message"
# }

package() {
  cd caffe

  # We don't need anything related to git in the package
  rm -rf .git*

  # Setup Python by hand since no setup.py 
  mkdir -p $pkgdir/usr/lib/python2.7/site-packages/caffe/
  cp -R python/caffe/* $pkgdir/usr/lib/python2.7/site-packages/caffe/

  # Add missing __init__.py file to ensure that the modules are detected.
  find "$pkgdir/usr/lib/python2.7/site-packages/caffe" -type d -exec touch '{}'/__init__.py \;

  # Still leaving a copy of the python code in the main caffe directory since it might be useful for some
  # Though because of that namcap will give this error:
  # caffe-git E: ELF file ('opt/caffe/python/caffe/_caffe.so') outside of a valid path.

  # Install shared libraries
  mkdir -p $pkgdir/usr/lib/
  install -Dm644 .build_release/lib/* "${pkgdir}/usr/lib/"

  ### Install all the execulables ###
  mkdir -p $pkgdir/usr/bin/

  # Primary executable
  install -D -m755 .build_release/tools/caffe.bin "$pkgdir/usr/bin/caffe"

  # Conversion executables 
  install -D -m755 .build_release/examples/cifar10/convert_cifar_data.bin "$pkgdir/usr/bin/convert_cifar_data"
  install -D -m755 .build_release/examples/mnist/convert_mnist_data.bin "$pkgdir/usr/bin/convert_mnist_data"
  install -D -m755 .build_release/examples/siamese/convert_mnist_siamese_data.bin "$pkgdir/usr/bin/convert_mnist_siamese_data"

  # Depreciated executables. All in caffe executable now but included here for backwards compatiblity
  install -D -m755 .build_release/tools/finetune_net.bin "$pkgdir/usr/bin/finetune_net"
  install -D -m755 .build_release/tools/train_net.bin "$pkgdir/usr/bin/train_net"
  install -D -m755 .build_release/tools/device_query.bin "$pkgdir/usr/bin/device_query"
  install -D -m755 .build_release/tools/net_speed_benchmark.bin "$pkgdir/usr/bin/net_speed_benchmark"
  install -D -m755 .build_release/tools/compute_image_mean.bin "$pkgdir/usr/bin/compute_image_mean"
  install -D -m755 .build_release/tools/convert_imageset.bin "$pkgdir/usr/bin/convert_imageset"
  install -D -m755 .build_release/tools/test_net.bin "$pkgdir/usr/bin/test_net"
  install -D -m755 .build_release/tools/upgrade_net_proto_text.bin "$pkgdir/usr/bin/upgrade_net_proto_text"
  # install -D -m755 .build_release/tools/dump_network.bin "$pkgdir/usr/bin/dump_network"
  install -D -m755 .build_release/tools/extract_features.bin "$pkgdir/usr/bin/extract_features"

  # clean up before copying over
  rm -r .build_release
  rm -r build

  mkdir -p $pkgdir/opt/caffe
  cp -r . $pkgdir/opt/caffe

  # Install BSD2 License (not in common licenses so lets make it custom)
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Install Documentation
  install -D -m644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}

# vim:set ts=2 sw=2 et:
