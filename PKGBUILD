# Maintainer: Ashish Singh <ashish.singh1@live.in>
pkgname=salome-kernel
pkgver=9.14.0
pkgrel=1
pkgdesc="Implements general services of SALOME platform"
url="https://www.salome-platform.org"
license=('LGPL2+')
depends=('salome-configuration' 'python-psutil' 'omniorbpy' 'python-h5py-openmpi' 'salome-bootstrap' 'boost')
optdepends=('doxygen: Documentation'
            'graphviz: Documentation'
            'python-sphinx: Documentation')
makedepends=('cmake')
arch=('any')
source=("git+https://github.com/SalomePlatform/kernel.git")
md5sums=('SKIP')

prepare() {
  cd "$srcdir/kernel"
  sed -i '95s|#define array_type(a)          (int)(PyArray_TYPE(a))|#define array_type(a)          (int)(PyArray_TYPE((PyArrayObject *)a))|' \
    src/DSC/DSC_Python/calcium.i
  # Don't forget to escape * sign in sed search string.
  sed -i -e 's/PyArray_NOTYPE/NPY_NOTYPE/g' \
         -e 's/PyArray_INT/NPY_INT/g' \
         -e 's/PyArray_LONG/NPY_LONG/g' \
         -e 's/PyArray_FLOAT/NPY_FLOAT/g' \
         -e 's/PyArray_DOUBLE/NPY_DOUBLE/g' \
         -e 's/PyArray_CFLOAT/NPY_CFLOAT/g' \
         -e 's/PyArray_STRING/NPY_STRING/g' \
         -e 's|PyEval_CallObject(excc, (PyObject \*)NULL)|PyObject_CallNoArgs(excc)|g' \
         src/DSC/DSC_Python/calcium.i
  sed -i '27i #include "CalciumMacroCInterface.h"' src/DSC/DSC_User/Datastream/Calcium/CalciumC.c
  sed -i '46i //Following have been added for declaration\
InfoType ecp_fin_ (void * component, int code);\
InfoType ecp_cd_ (void * component, char* instanceName);' \
    src/DSC/DSC_User/Datastream/Calcium/CalciumC.c
  sed -i '61i \
CALCIUM_C2CPP_INTERFACE_C_(intc,int,int,float,)\
CALCIUM_C2CPP_INTERFACE_C_(long,long,long,float,)\
CALCIUM_C2CPP_INTERFACE_C_(integer,integer,cal_int,float,)\
CALCIUM_C2CPP_INTERFACE_C_(int2integer,integer,int,float,)\
CALCIUM_C2CPP_INTERFACE_C_(long2integer,integer, long,float,)\
CALCIUM_C2CPP_INTERFACE_C_(float,float,float,float, )\
CALCIUM_C2CPP_INTERFACE_C_(double,double,double,double,)\
CALCIUM_C2CPP_INTERFACE_C_(float2double,double,float,float, )\
CALCIUM_C2CPP_INTERFACE_C_(bool,bool,int,float,)\
CALCIUM_C2CPP_INTERFACE_C_(cplx,cplx,float,float,)\
CALCIUM_C2CPP_INTERFACE_C_(str,str,char*,float,)\' \
    src/DSC/DSC_User/Datastream/Calcium/CalciumC.c
  cat <<EOF > src/DSC/DSC_User/Datastream/Calcium/CalciumMacroCInterface.h
#define _CALCIUM_MACRO_C_INTERFACE_H_

#define CALCIUM_C2CPP_INTERFACE_C_(_name,_porttype,_type,_timeType,_qual)        \
  InfoType ecp_lecture_##_name (void * component, int dependencyType,            \
                                        _timeType * ti,                          \
                                        _timeType * tf, long * i,                \
                                        const char * const nomvar, size_t bufferLength,    \
                                        size_t * nRead, _type _qual ** data );   \
                                                                                 \
                                                                                 \
  void ecp_lecture_##_name##_free ( _type _qual * data);                         \
                                                                                 \
                                                                                 \
  InfoType ecp_ecriture_##_name (void * component, int dependencyType,           \
                                        _timeType *t,                            \
                                        long  i,                                 \
                                        const char * const nomvar, size_t bufferLength,     \
                                        _type _qual * data );                    \


EOF
  
}

build () {
  cd "$srcdir/kernel"
  [[ -d build ]] && rm -r build
  mkdir build && cd build
  # export PYTHONPATH=/usr/share/salome/__SALOME_BOOTSTRAP__/:$PYTHONPATH
  export SALOMEBOOTSTRAP_ROOT_DIR="/opt/salome"
  # Add SALOMEBOOTSTRAP libraries folder to LD_LIBRARY_PATH to enable finding of KERNELBasics library
  export LD_LIBRARY_PATH="$SALOMEBOOTSTRAP_ROOT_DIR/__RUN_SALOME__/lib/salome:$LD_LIBRARY_PATH"
  cmake -DCMAKE_BUILD_TYPE=Release -DSALOME_USE_MPI=ON -DCONFIGURATION_ROOT_DIR=/usr/share/salome/configuration -DOMNIORBPY_ROOT_DIR=/usr/lib/python3.13/site-packages/omniORB -DSALOME_BUILD_DOC=OFF -Wno-dev -DCMAKE_INSTALL_PREFIX=/opt/salome ../
  make
}

check() {
  cd "$srcdir/kernel/build"
  make test
}

package() {
  cd "$srcdir/kernel/build"
  make prefix=/opt/salome DESTDIR="$pkgdir" install
}