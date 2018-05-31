# Maintainer: jerry73204 <jerry73204@gmail.com>
# Co-maintainer: circle <az6980522@gmail.com>
pkgname=ncsdk
pkgver=2.04.00.06
pkgrel=1
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
  'python-pygraphviz'
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
        "https://downloadmirror.intel.com/27738/eng/NCSDK-${pkgver}.tar.gz")
sha256sums=('d2ec76479e20d5e4a458011648f1d908c9237d292bf920955514b63d081f4f53'
            'c65d03b2f3769a7a0d2b74e55940f97772d3271b5eeeb6400f55b8dfdd380eb8')

package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  # create directories
  install -dm755 ${pkgdir}/usr/bin
  install -dm755 ${pkgdir}/usr/include
  install -dm755 ${pkgdir}/usr/lib/mvnc

  # install toolkit
  sdk_dir="$srcdir/NCSDK-${pkgver}/ncsdk-x86_64"
  cp -dr --no-preserve=ownership ${sdk_dir}/tk ${pkgdir}/usr/bin/ncsdk
  ln -s ncsdk/mvNCCompile.py ${pkgdir}/usr/bin/mvNCCompile
  ln -s ncsdk/mvNCCheck.py ${pkgdir}/usr/bin/mvNCCheck
  ln -s ncsdk/mvNCProfile.py ${pkgdir}/usr/bin/mvNCProfile

  install -m644 ${sdk_dir}/fw/MvNCAPI-ma2450.mvcmd ${pkgdir}/usr/lib/mvnc/MvNCAPI-ma2450.mvcmd

  # install C api
  install -m644 ${sdk_dir}/api/c/mvnc.h ${pkgdir}/usr/include/mvnc.h

  install -m644 ${sdk_dir}/api/c/libmvnc.so.0 ${pkgdir}/usr/lib/mvnc/libmvnc.so.0
  install -m644 ${sdk_dir}/api/c/libmvnc_highclass.so.0 ${pkgdir}/usr/lib/mvnc/libmvnc_highclass.so.0

  ln -s mvnc/libmvnc.so.0 ${pkgdir}/usr/lib/libmvnc.so.0
  ln -s mvnc/libmvnc.so.0 ${pkgdir}/usr/lib/libmvnc.so
  ln -s mvnc/libmvnc_highclass.so.0 ${pkgdir}/usr/lib/libmvnc_highclass.so.0
  ln -s mvnc/libmvnc_highclass.so.0 ${pkgdir}/usr/lib/libmvnc_highclass.so

  # install Python api
  cd ${sdk_dir}/api
  python setup.py install --root="$pkgdir/" --optimize=1
  python2 setup.py install --root="$pkgdir/" --optimize=1

  # install udev rules
  install -dm755 ${pkgdir}/usr/lib/udev/rules.d
  install -m644 ${sdk_dir}/udev/97-usbboot.rules ${pkgdir}/usr/lib/udev/rules.d/97-usbboot.rules

  # install license and version file
  install -Dm644 ${sdk_dir}/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
  install -Dm644 ${srcdir}/NCSDK-${pkgver}/version.txt ${pkgdir}/usr/share/licenses/${pkgname}/version.txt

  # install examples
  cd "$srcdir/${pkgname}-${pkgver}"
  install -dm755 ${pkgdir}/usr/share/${pkgname}
  cp -dr --no-preserve=ownership examples/ ${pkgdir}/usr/share/ncsdk
}
