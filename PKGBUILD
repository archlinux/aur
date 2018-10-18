# Maintainer: jerry73204 <jerry73204@gmail.com>
# Co-maintainer: circle <az6980522@gmail.com>
pkgname=ncsdk
pkgver=2.08.01.02
pkgrel=1
pkgdesc='Software Development Kit for the Intel® Movidius™ Neural Compute Stick'
arch=('x86_64')
url='https://github.com/movidius/ncsdk/'
license=('Apache')
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
        "https://downloadmirror.intel.com/28191/eng/NCSDK-${pkgver}.tar.gz")
sha256sums=('055d71b696e14e44c411c88ead3ae1729d4e64e8202433dce2fc132c02a5e567'
            '9c1fa5c2f9d4f43411932a987333768482174fd0dbb66d039fa288f186d969b3')


package() {
  cd "$srcdir/${pkgname}-${pkgver}"

  # create directories
  install -dm755 ${pkgdir}/usr/bin
  install -dm755 ${pkgdir}/usr/include
  install -dm755 ${pkgdir}/usr/lib/mvnc

  # install toolkit
  sdk_dir="$srcdir/NCSDK-${pkgver}/ncsdk-x86_64"
  cp -drv --no-preserve=ownership ${sdk_dir}/tk ${pkgdir}/usr/bin/ncsdk
  ln -s ncsdk/mvNCCompile.py ${pkgdir}/usr/bin/mvNCCompile
  ln -s ncsdk/mvNCCheck.py ${pkgdir}/usr/bin/mvNCCheck
  ln -s ncsdk/mvNCProfile.py ${pkgdir}/usr/bin/mvNCProfile

  install -m644 ${sdk_dir}/fw/MvNCAPI-ma2450.mvcmd ${pkgdir}/usr/lib/mvnc/MvNCAPI-ma2450.mvcmd

  # install C api
  install -m644 ${sdk_dir}/api/c/libmvnc.so.0 ${pkgdir}/usr/lib/mvnc/libmvnc.so.0

  ln -s mvnc/libmvnc.so.0 ${pkgdir}/usr/lib/libmvnc.so.0
  ln -s mvnc/libmvnc.so.0 ${pkgdir}/usr/lib/libmvnc.so

  # install Python api
  cp -v ${sdk_dir}/api/setup.py ${srcdir}/${pkgname}-${pkgver}/api/setup.py
  cd ${srcdir}/${pkgname}-${pkgver}/api
  python setup.py install --root="${pkgdir}" --optimize=1
  python2 setup.py install --root="${pkgdir}" --optimize=1

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
