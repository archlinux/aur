# Maintainer: jerry73204 <jerry73204@gmail.com>
# Co-maintainer: circle <az6980522@gmail.com>
pkgname=ncsdk
pkgver=1.12.00.01
pkgrel=2
pkgdesc='Software Development Kit for the Intel® Movidius™ Neural Compute Stick'
arch=('x86_64')
url='https://github.com/movidius/ncsdk/'
install='ncsdk.install'
license=('custom:Proprietary')
depends=(
  'python'
  'cython'
  'opencv'
  'tensorflow'
  'caffe'
  'python-markdown'
  'python-pillow'
  'python-pyaml'
  'python-graphviz'
  'python-h5py'
  'python-lxml'
  'python-matplotlib'
  'python-numpy'
  'python-protobuf'
  'python-dateutil'
  'python-scikit-image'
  'python-scipy'
  'python-six'
  'python-networkx'
  'python2-enum34'
)
makedepends=('python' 'python-pip' 'unzip')
options=('strip')
source=("https://github.com/movidius/ncsdk/archive/v${pkgver}.tar.gz"
        "http://ncs-forum-uploads.s3.amazonaws.com/ncsdk/ncsdk_01_12/NCSDK-${pkgver}.tar.gz"
        '97-movidius.rules')
sha256sums=('aceca6ffa87c87c2b29f5a89ed97a96f0b0238ff16d9c45e61e3e891a63c6386'
            'eb00ec5c9de5fbffd3f191fd376715c91f0a8f1ed120ea1d8f8e8f80a42ff3d0'
            '1a18a8b0a333d0b469202a135a285549a3b26e6836a94901fca6f254d75d80ec')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  # create directories
  # install_dir=${pkgdir}/opt/movidius

  install -dm755 ${pkgdir}/usr/bin
  install -dm755 ${pkgdir}/usr/include
  install -dm755 ${pkgdir}/usr/lib/mvnc

  # install config file
  install -Dm644 ncsdk.conf ${pkgdir}/etc/ncsdk.conf

  # install toolkit
  sdk_dir="$srcdir/NCSDK-${pkgver}/ncsdk-x86_64"
  cp -dr --no-preserve=ownership ${sdk_dir}/tk ${pkgdir}/usr/bin/ncsdk
  ln -s ncsdk/mvNCCompile.py ${pkgdir}/usr/bin/mvNCCompile
  ln -s ncsdk/mvNCCheck.py ${pkgdir}/usr/bin/mvNCCheck
  ln -s ncsdk/mvNCProfile.py ${pkgdir}/usr/bin/mvNCProfile

  install -m644 ${sdk_dir}/fw/MvNCAPI.mvcmd ${pkgdir}/usr/lib/mvnc/MvNCAPI.mvcmd

  # install C api
  install -m644 ${sdk_dir}/api/c/mvnc.h ${pkgdir}/usr/include/mvnc.h

  install -m644 ${sdk_dir}/api/c/mvnc_deprecated.h ${pkgdir}/usr/include/mvnc_deprecated.h
  install -m644 ${sdk_dir}/api/c/libmvnc.so.0 ${pkgdir}/usr/lib/mvnc/libmvnc.so.0

  ln -s mvnc/libmvnc.so.0 ${pkgdir}/usr/lib/libmvnc.so.0
  ln -s mvnc/libmvnc.so.0 ${pkgdir}/usr/lib/libmvnc.so

  # install Python api
  cd ${sdk_dir}/api
  python setup.py install --root="$pkgdir/" --optimize=1
  python2 setup.py install --root="$pkgdir/" --optimize=1

  # install udev rules
  install -dm755 ${pkgdir}/usr/lib/udev/rules.d
  install -m644 ${srcdir}/97-movidius.rules ${pkgdir}/usr/lib/udev/rules.d/97-movidius.rules

  # install license and version file
  install -Dm644 ${sdk_dir}/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 $srcdir/NCSDK-${pkgver}/version.txt $pkgdir/usr/share/licenses/$pkgname/version.txt

  # install examples
  cd "$srcdir/${pkgname}-${pkgver}"
  install -dm755 $pkgdir/usr/share/$pkgname
  cp -dr --no-preserve=ownership examples/ $pkgdir/usr/share/ncsdk
}
