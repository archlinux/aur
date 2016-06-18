pkgname=python2-orange
pkgver=2.7.2
pkgrel=1
pkgdesc="Open source data visualization and analysis for novice and experts. Data mining through visual programming or Python scripting."
arch=('i686' 'x86_64')
url="http://orange.biolab.si/"
license=('GPL3')
depends=('python2-matplotlib' 'python2-scikit-learn' 'python2-pyqt4')
makedepends=('python2-setuptools')
optdepends=('python2-pyqt4: GUI support')
source=("http://orange.biolab.si/download/files/archive/Orange-${pkgver}.tar.gz")
md5sums=('bd4a08784f0042c1d451ffbb00490629')

prepare() {
  cd "${srcdir}/Orange-${pkgver}"

  # redefined abs(double) conflicts with math.h
  sed -i "s|inline double abs(double x)|inline double zzzzzzzabs(double x)|g" source/include/stat.hpp

  # cannot convert ‘bool’ to ‘PyObject*’ in return
  sed -i 's|PYERROR(PyExc_TypeError, "negative base value", false)|PYERROR(PyExc_TypeError, "negative base value", 0)|g' source/orange/cls_value.cpp
  sed -i 's|PYERROR(PyExc_TypeError, "cannot negate non-continuous value", false)|PYERROR(PyExc_TypeError, "cannot negate non-continuous value", 0)|g' source/orange/cls_value.cpp
  sed -i 's|PYERROR(PyExc_TypeError, "cannot compute abs of non-continuous value", false)|PYERROR(PyExc_TypeError, "cannot compute abs of non-continuous value", 0)|g' source/orange/cls_value.cpp
  sed -i 's|PYERROR(PyExc_TypeError, "SubsetsGenerator.reset does not reset the generator (as it used to)", false)|PYERROR(PyExc_TypeError, "SubsetsGenerator.reset does not reset the generator (as it used to)", 0)|g' source/orange/lib_preprocess.cpp
  sed -i 's|PYERROR(PyExc_AttributeError, "list and optional compare function expected", false)|PYERROR(PyExc_AttributeError, "list and optional compare function expected", 0)|g' source/statc/statc.cpp

  # error: could not convert ‘false’ from ‘bool’ to ‘PIntList`
  sed -i "s|return false|return 0|g" source/orange/measures.cpp source/orange/lib_kernel.cpp
}

build() {
  cd "${srcdir}/Orange-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/Orange-${pkgver}"
  python2 setup.py install --root="${pkgdir}"
  mv "${pkgdir}"/usr/bin/orange-canvas "${pkgdir}"/usr/bin/orange2-canvas 
}

