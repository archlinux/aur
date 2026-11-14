# First maintainer: Hal Clark
# Now maintained by: Paolo Zaffino (p.zaffino@unicz.it)
# Plastimatch PI: Greg Sharp

pkgname=plastimatch
pkgver=master
pkgrel=4
pkgdesc='Tools for medical image reconstruction and registration.'
arch=('i686' 'x86_64')
url='http://plastimatch.org/'
license=('BSD-style')
conflicts=('plastimatch-static')
replaces=('plastimatch-static')
depends=('itk' 'intel-oneapi-mkl' 'eigen' 'dcmtk' 'libpng' 'zlib' 'libtiff' 'libjpeg-turbo' 'fftw' 'bash-completion')
makedepends=('cmake')
optdepends=('cuda')

source=("https://gitlab.com/plastimatch/plastimatch/-/archive/master/plastimatch-master.tar.gz")
md5sums=('SKIP')
sha1sums=('SKIP')

prepare() {
    cd "${srcdir}/plastimatch-${pkgver}"

    # Arch's ITK is built with ITK_LEGACY_REMOVE=ON, so the ITK 4 era API
    # still used by Plastimatch is gone. The blocks below port the affected
    # code to the ITK >= 5.1 names.

    # RANSAC multithreading.
    # Errors: 'PlatformMultiThreader' has no member named 'SetNumberOfThreads';
    #         'ThreadInfoStruct' in 'itk::PlatformMultiThreader' does not name a type
    # Fix: ThreadInfoStruct -> WorkUnitInfo (and its fields ThreadID ->
    #      WorkUnitID, NumberOfThreads -> NumberOfWorkUnits),
    #      SetNumberOfThreads -> SetNumberOfWorkUnits
    sed -i \
        -e 's/threader->SetNumberOfThreads(/threader->SetNumberOfWorkUnits(/' \
        -e 's/PlatformMultiThreader::ThreadInfoStruct/PlatformMultiThreader::WorkUnitInfo/' \
        -e 's/infoStruct->ThreadID/infoStruct->WorkUnitID/g' \
        -e 's/infoStruct->NumberOfThreads/infoStruct->NumberOfWorkUnits/g' \
        libs/ransac/RANSAC.txx

    # Registration worker thread.
    # Errors: 'ThreadInfoStruct' is not a member of 'itk::PlatformMultiThreader';
    #         'PlatformMultiThreader' has no member named 'SpawnThread'
    # Fix: SpawnThread has no ITK replacement, so the worker is launched with a
    #      detached std::thread and receives the Registration pointer directly
    #      instead of through ThreadInfoStruct::UserData
    sed -i \
        -e '1i #include <thread>' \
        -e '/itk::PlatformMultiThreader::ThreadInfoStruct/d' \
        -e 's/(Registration\*) info->UserData/(Registration*) param/' \
        -e 's/d_ptr->thread_no = d_ptr->threader->SpawnThread (/std::thread (/' \
        -e 's/registration_main_thread, (void\*) this);/registration_main_thread, (void*) this).detach ();/' \
        src/register/registration.cxx

    # Demons registration with masks.
    # Error: 'itk::SpatialObject<3>' has no member named 'IsInside'
    # Fix: SpatialObject::IsInside(point) -> IsInsideInWorldSpace(point).
    #      Restricted to objects whose name ends in "Mask", so that IsInside()
    #      of other classes (e.g. ImageRegion) is left untouched
    grep -rlE 'Mask(\(\))?->IsInside\(' src libs | xargs -r sed -E -i \
        's/Mask(\(\))?->IsInside\(/Mask\1->IsInsideInWorldSpace(/g'

    # Linear warp, origin of the inverse affine transform.
    # Error: conversion from 'itk::Vector<double, 3>' to non-scalar type
    #        'itk::Point<double, 3>' requested
    # Fix: the converting Point constructor is now explicit, so the expression
    #      is kept as a Point (Matrix * Point + Vector) instead of going
    #      through GetVectorFromOrigin(). The result is numerically identical
    sed -i 's/mat_inv \* pih->GetOrigin().GetVectorFromOrigin()/mat_inv * pih->GetOrigin()/' src/base/plm_warp.cxx

    # ITK transform file loading.
    # Error: invalid conversion from 'const TransformListType*' to
    #        'TransformListType' (non-const pointer)
    # Fix: TransformFileReader::GetTransformList() now returns a const
    #      pointer, so the type is deduced with auto
    sed -i 's/TransformListType transfList = transfReader->GetTransformList()/auto transfList = transfReader->GetTransformList()/' src/base/xform.cxx

    # Image IO and spatial orientation enums.
    # Errors: 'itk::ImageIOBase::IOPixelType' has not been declared;
    #         'itk::ImageIOBase::IOComponentType' has not been declared;
    #         'itk::SpatialOrientation' has not been declared
    # Fix: the legacy aliases nested in ImageIOBase become itk::IOPixelEnum and
    #      itk::IOComponentEnum (types and values), and the SpatialOrientation
    #      namespace becomes
    #      itk::SpatialOrientationEnums::ValidCoordinateOrientations
    local comp='UCHAR|CHAR|USHORT|SHORT|UINT|INT|ULONG|LONG|ULONGLONG|LONGLONG|FLOAT|DOUBLE|UNKNOWNCOMPONENTTYPE'
    local pix='SCALAR|RGB|RGBA|OFFSET|VECTOR|POINT|COVARIANTVECTOR|SYMMETRICSECONDRANKTENSOR|DIFFUSIONTENSOR3D|COMPLEX|FIXEDARRAY|MATRIX|UNKNOWNPIXELTYPE'

    grep -rlE 'ImageIOBase::|SpatialOrientation::' src libs | xargs sed -E -i \
        -e 's/itk::ImageIOBase::IOPixelType/itk::IOPixelEnum/g' \
        -e 's/itk::ImageIOBase::IOComponentType/itk::IOComponentEnum/g' \
        -e "s/itk::ImageIOBase::(${comp})\b/itk::IOComponentEnum::\1/g" \
        -e "s/itk::ImageIOBase::(${pix})\b/itk::IOPixelEnum::\1/g" \
        -e 's/itk::SpatialOrientation::ValidCoordinateOrientationFlags/itk::SpatialOrientationEnums::ValidCoordinateOrientations/g' \
        -e 's/itk::SpatialOrientation::(ITK_COORDINATE_ORIENTATION_[A-Z]+)/itk::SpatialOrientationEnums::ValidCoordinateOrientations::\1/g'
}


build() {
    cd "${srcdir}"
    rm -rf build
    mkdir build
    cd build

    cmake \
      -DCMAKE_INSTALL_PREFIX=/usr \
      -DCMAKE_BUILD_TYPE:STRING=Release \
      -DBUILD_TESTING:BOOL=OFF \
      -DBUILD_SHARED_LIBS:BOOL=OFF \
      -DPLM_CONFIG_ENABLE_CUDA=OFF \
      ../plastimatch-${pkgver}/

    make
}

package() {
    cd "${srcdir}"/build/
    make DESTDIR="${pkgdir}" install

    # Install bash completion
    install -Dm644 ${srcdir}/plastimatch-${pkgver}/extra/bash_completion/plastimatch \
        "$pkgdir/etc/bash_completion.d/plastimatch"
}
