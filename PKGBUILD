# Maintainer : George Eleftheriou <eleftg>
# Contributor: Xwang <xwaang1976@gmail.com>
 
_pkgname=SU2
pkgname=su2
pkgver=6.1.0
pkgrel=1
pkgdesc="Open-source collection of software tools written in C++ for performing Partial Differential Equation (PDE) analysis and solving PDE-constrained optimization problems"
url="https://su2code.github.io"
license=('LGPL')
depends=('python' 'python-mpi4py' 'openmpi' 'hdf5-openmpi' 'libaec'
    'zlib' 'jsoncpp' 'lapacke')
makedepends=('swig')
arch=('x86_64')
source=("https://github.com/su2code/SU2/archive/v${pkgver}.tar.gz")
install="${pkgname}".install
sha512sums=('7765b88d3e01a7ca968d6b19d662ce6952fe7f6a60055297d9f6aa5adb69f6709d5f9ea16c00467f58d43a65aad25fd7f19674517f586bb776c75fa9401612d5')

prepare() {
    ! [ -d build ] && mkdir build

    echo 'export SU2_RUN="/opt/'"${pkgname}"'/bin"' > su2_env.sh
    echo 'export PATH=${PATH}:${SU2_RUN}' >> su2_env.sh
    echo 'export PYTHONPATH=${PYTHONPATH}:${SU2_RUN}' >> su2_env.sh

    cd "${srcdir}/${_pkgname}-${pkgver}"
    sed -i 's/^LAPACKlib=liblapacke.a$/LAPACKlib=liblapacke.so/' configure.ac
    sed -i 's/^Jsoncpplib=libjson.a$/Jsoncpplib=libjsoncpp.a/' configure.ac
    sed -i 's/^ZLIBlib=libz.a$/ZLIBlib=libz.so/' configure.ac
    sed -i 's/^SZIPlib=libsz.a$/SZIPlib=libsz.so/' configure.ac
    sed -i 's/^HDF5lib=libhdf5.a$/HDF5lib=libhdf5.so/' configure.ac
    autoreconf -f -i
}

build() {
    cd "${srcdir}/build"

    ../"${_pkgname}-${pkgver}"/configure \
    --prefix="/opt/${pkgname}" \
    --enable-mpi \
    --enable-PY_WRAPPER \
    --enable-complex \
    --enable-normal \
    --enable-tecio \
    --enable-metis \
    --enable-parmetis \
    --enable-cgns \
    --with-cc=/usr/bin/mpicc \
    --with-cxx=/usr/bin/mpicxx \
    --with-HDF5-lib=/usr/lib \
    --with-HDF5-include=/usr/include \
    --with-SZIP-lib=/usr/lib \
    --with-SZIP-include=/usr/include \
    --with-ZLIB-lib=/usr/lib \
    --with-ZLIB-include=/usr/include \
    --with-Jsoncpp-lib=/usr/lib \
    --with-Jsoncpp-include=/usr/include \
    --with-LAPACK-lib=/usr/lib \
    --with-LAPACK-include=/usr/include
 
    # Automatic differentiation is controlled by a python script
    # which calls configure like:
    # ./preconfigure.py --enable-autodiff
    # and is supposed to download the 3rd party headers needed
    # but is quite limited in terms of config options
    #
    # ... hence disabling for now ...
    #--enable-codi-reverse \

    make
}

package() {
    cd "${srcdir}/build"
    # sadly DESTDIR does not work so we have to use prefix
    # make DESTDIR="${pkgdir}" install
    make prefix="${pkgdir}/opt/${pkgname}" install
    install -D -m644 "${srcdir}/su2_env.sh" "${pkgdir}/etc/profile.d/su2_env.sh"
    install -D -m644 "${srcdir}/${_pkgname}-${pkgver}/COPYING" "${pkgdir}"/usr/share/licenses/${pkgname}/LICENSE
}
