#!/bin/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# shellcheck disable=SC2034,SC2154 # allow unused/unset variables
# shellcheck disable=SC2191 # preserve current _CMAKE_FLAGS initialization.

# Configuration.
[[ -v CUDA_ARCH ]] && _cuda_capability=${CUDA_ARCH}

#some extra, unofficially supported stuff goes here:
((TRAVIS)) && _cuda_capability+=(sm_50 sm_52 sm_60 sm_61 sm_70 sm_75) # Travis memory limit is not enough to build for arch 3.x.
((DISABLE_NINJA)) ||  makedepends+=('ninja')
#shellcheck disable=SC2015
((DISABLE_CUDA)) && optdepends+=('cuda: CUDA support in Cycles') || makedepends+=('cuda')

pkgname=blender-2.7
pkgver=2.79b
pkgrel=4
pkgdesc="Keeping Blender 2.79b up-to-date with modern compiler and libs"
arch=('i686' 'x86_64')
url="https://blender.org/"
depends+=('alembic' 'libgl' 'python' 'python-numpy' 'openjpeg2' 'ffmpeg'
          'fftw' 'openal' 'freetype2' 'libxi' 'openimageio' 'opencolorio1'
          'openvdb' 'opencollada' 'opensubdiv' 'openshadinglanguage' 'libtiff'
          'libpng')
makedepends+=('cmake' 'boost' 'mesa' 'llvm')
provides=('blender-2.7')
license=('GPL')
source=('https://download.blender.org/source/blender-2.79b.tar.gz'
        SelectCudaComputeArch.patch
        opencolorio1.patch
        0000_misc.patch
        0001_openexr3.patch
        0002_opencollada1_6_68.patch
        0003_openvdb.patch
        0004_openimageio.patch
        0005_cycles.patch
        0006_python3_7.patch
        0007_python3_8.patch
        0008_python3_9.patch
        0009_python3_10.patch
        0010_python3_11.patch
        0011_ffmpeg.patch)
sha512sums=('2db21ace446168dd683cdb5aad9dec001f8888ae4e9603a04ddb44fb78489ded827deb07e83712b0f1118a0e7bf66f2a5d935dc4ebb3a6703d72672ff414367f'
            '15b10bf91c759a8ab6519f3c02f54e7d3ad105eb915663e0de2a65b38d1e42b55cc383bae96a1507f1eb55200eb14ebe904b6a7b772b4073aa6a53ac5d4dd194'
            '4126ddaaab2dc8c45cd850353a2e4a0e6ff2ef4476f9a533916e59fc57e426ca3110f7b3d38685fffd97b969208f941359122b693584c2a70a3f8420a832214b'
            'd7b6f1707ad902743a3f08c6423aabd7abd0841eb78404419884d7c0b02affc1b6c3eafea55f9db04bce5e27d22cfd0ec63153c61a5fa2c3227de54a09f0895d'
            '0a8bd2ad7e199f95145bd0a66471686e0c545b071c73e6a659b570c001a860504f0970818fd686f52be9f5c18bd294c0efbede5c058ac96a4682e54b6235aac0'
            '435e33926766a143cb6445a0c3219c9126b5d77e8114601a1f07848120b823ef2d1789bccb10079436b89eb9f894df54571ed50cde0713af857a8148be8f18ae'
            'fc86d7a9a46e521ec22b2d87dfb023a71bfde624c4a6ddcf137038c7f46b97d614f8cb99951489a251cb2ea28460690cc0e5eb9ac6f2ccacc27c0052d137dcc9'
            'c8bd5ee00f062760ae3a2493750b2eb66d0368955ebb443aad5313f91c1fd0680df239eb1ca957e79cda482c084a023efc60e4341c198d55f897415cf79de35d'
            '3e3bef5e27279fc9c4f66398cd04a51a1ed268b7b99df2cf0151ed63994b742e39917e525ddac666d12a3df02a3ecef7dbe03da52c6be1aa143a3be960acbc5f'
            '7c98cf29fa22e7e816789254e43ed0f5595529f8ed37c88abac8667a80bf2bee9f020fa204a45800586e4d0c2de977df9ceda6d8bc0b77c806743f761b6ffa9f'
            '7effbd675b2167cc4c25a36d58f08824b2770e7b57fee93fd909a715003ee076ffcfc7e91cf965b9836da2fa54246fb68bbe613e44d312702298a5386b124dfa'
            'a556445f27eaaba839d0efcfa70c530c269c7189e194c93b929044a54697f3606401dfdf5dbec05b181c26ba82d2b16560f2db7cd579104e0a0a322525cecaff'
            'ecae55f642bf7f08edc56f8740a9fec650a3617f0ce7c7ba5b3211994ad8c46dc8fbbe897405699d46cb01c15129c0d4d9184657daeaf41172533195cdbbb104'
            'de254cb5e43fe05c3b5e70df881c1ab847b58c383d8df28be6d044c058d4776a5a3d57f710eb3cf0a83b43c95fac29f772c446a23e0f9c2bf73d1dcc8b23b67c'
            'a0ff4f4dbc3624692c16d45f632cda1362173a5685c85e62d54af1d63d5a421867a5eb89b5b1c5b72bbceef98664d96b54901790470cbe67f701c582858af0ed')

prepare() {
  # Apply CUDA patch
  if [ ! -v _cuda_capability ] && grep -q nvidia <(lsmod); then
    patch -p1 < SelectCudaComputeArch.patch
  fi

  # Build with OpenColorIO 1 for now
  patch -p1 < opencolorio1.patch

  # Apply patches to build with modern libs and compiler
  patch -p1 < 0000_misc.patch
  patch -p1 < 0001_openexr3.patch
  patch -p1 < 0002_opencollada1_6_68.patch
  patch -p1 < 0003_openvdb.patch
  patch -p1 < 0004_openimageio.patch
  patch -p1 < 0005_cycles.patch
  patch -p1 < 0006_python3_7.patch
  patch -p1 < 0007_python3_8.patch
  patch -p1 < 0008_python3_9.patch
  patch -p1 < 0009_python3_10.patch
  patch -p1 < 0010_python3_11.patch
  patch -p1 < 0011_ffmpeg.patch
}

build() {
  _pyver=$(python -c "from sys import version_info; print(\"%d.%d\" % (version_info[0],version_info[1]))")
  msg "python version detected: ${_pyver}"

  # determine whether we can precompile CUDA kernels
  _CUDA_PKG=$(pacman -Qq cuda 2>/dev/null) || true
  if [ "$_CUDA_PKG" != "" ] && ! ((DISABLE_CUDA)) ; then
    _CMAKE_FLAGS+=( -DWITH_CYCLES_CUDA_BINARIES=ON
                  -DCUDA_TOOLKIT_ROOT_DIR=/opt/cuda )
    if [[ -v _cuda_capability ]]; then
      _CMAKE_FLAGS+=( -DCYCLES_CUDA_BINARIES_ARCH="$(IFS=';'; echo "${_cuda_capability[*]}";)" )
    fi
    [ -f "/usr/lib/ccache/bin/nvcc-ccache" ] && _CMAKE_FLAGS+=( -DCUDA_NVCC_EXECUTABLE=/usr/lib/ccache/bin/nvcc-ccache )
    if _cuda_gcc=$(basename "$(readlink /opt/cuda/bin/gcc)") ; then
      [ -L "/usr/lib/ccache/bin/$_cuda_gcc" ] && _CMAKE_FLAGS+=( -DCUDA_HOST_COMPILER=/usr/lib/ccache/bin/"$_cuda_gcc" )
    fi
  fi

  ((DISABLE_NINJA)) && generator="Unix Makefiles" || generator="Ninja"
  cmake -G "$generator" -S "$srcdir/blender-2.79b" -B "$srcdir/build" \
        -C "${srcdir}/blender-2.79b/build_files/cmake/config/blender_release.cmake" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DWITH_INSTALL_PORTABLE=OFF \
        -DWITH_GL_PROFILE_CORE=OFF \
        -DWITH_GL_PROFILE_ES20=OFF \
        -DWITH_SYSTEM_GLEW=ON \
        -DWITH_PYTHON_INSTALL=OFF \
        -DPYTHON_VERSION="${_pyver}" \
        -DWITH_LLVM=ON \
        -DWITH_CODEC_FFMPEG=ON \
        -DWITH_CYCLES=ON \
        -DWITH_OPENCOLLADA=ON \
        -DWITH_OPENCOLORIO=ON \
        -DWITH_OPENVDB=ON \
        -DWITH_OPENIMAGEIO=ON \
        -DWITH_GAMEENGINE=ON \
        -DWITH_PLAYER=ON \
        -DWITH_PYTHON_MODULE=OFF \
        -DWITH_CYCLES_OSL=NO
        "${_CMAKE_FLAGS[@]}"
  export NINJA_STATUS="[%p | %f<%r<%u | %cbps ] "
# shellcheck disable=SC2086 # allow MAKEFLAGS to split when multiple flags provided.
  if ((DISABLE_NINJA)); then make -C "$srcdir/build" ; else ninja -C "$srcdir/build" ${MAKEFLAGS:--j1}; fi
}

package() {
  _suffix=${pkgname##*-}
  export DESTDIR="$pkgdir"
  if ((DISABLE_NINJA)); then make -C "$srcdir/build" install; else ninja -C "$srcdir/build" install; fi

    msg "add -${_suffix} suffix to desktop shortcut"
    sed -i "s/=blender/=blender-${_suffix}/g" "${pkgdir}/usr/share/applications/blender.desktop"
    sed -i "s/=Blender/=Blender-${_suffix}/g" "${pkgdir}/usr/share/applications/blender.desktop"
    mv "${pkgdir}/usr/share/applications/blender.desktop" "${pkgdir}/usr/share/applications/blender-${_suffix}.desktop"

    msg "add -${_suffix} suffix to binaries"
    mv "${pkgdir}/usr/bin/blender" "${pkgdir}/usr/bin/blender-${_suffix}"
    mv "${pkgdir}/usr/bin/blender-thumbnailer.py" "${pkgdir}/usr/bin/blender-${_suffix}-thumbnailer.py"

    msg "mv doc/blender to doc/blender-${_suffix}"
    mv "${pkgdir}/usr/share/doc/blender" "${pkgdir}/usr/share/doc/blender-${_suffix}"

    msg "add -${_suffix} suffix to man page"
    mv "${pkgdir}/usr/share/man/man1/blender.1" "${pkgdir}/usr/share/man/man1/blender-${_suffix}.1"

    msg "add -${_suffix} suffix to all icons"
    while read -r icon
    do
      # ${filename##/*.} extra extenssion from path
      # ${filename%.*} extract filename form path
      # look at bash "manipulatin string"
      mv "$icon" "${icon%.*}-${_suffix}.${icon##/*.}"
    done < <(find "${pkgdir}/usr/share/icons" -type f)

  if [[ -e "$pkgdir/usr/share/blender/${_suffix}/scripts/addons/cycles/lib/" ]] ; then
    # make sure the cuda kernels are not stripped
    chmod 444 "$pkgdir"/usr/share/blender/${_suffix}/scripts/addons/cycles/lib/*
  fi
}
# vim:set sw=2 ts=2 et:
