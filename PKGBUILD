#!/bin/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# shellcheck disable=SC2034,SC2154 # allow unused/unset variables
# shellcheck disable=SC2191 # preserve current _CMAKE_FLAGS initialization.

# Configuration.
_blenver="2.83"
_branch="blender-v${_blenver}-release"
_fragment=${FRAGMENT:-#branch=${_branch}}
[[ -v CUDA_ARCH ]] && _cuda_capability=${CUDA_ARCH}

#some extra, unofficially supported stuff goes here:
((TRAVIS)) && _cuda_capability+=(sm_50 sm_52 sm_60 sm_61 sm_70 sm_75) # Travis memory limit is not enough to build for arch 3.x.
_CMAKE_FLAGS+=( -DWITH_ALEMBIC_HDF5=ON )
((DISABLE_EMBREE)) || {
  _CMAKE_FLAGS+=( -DWITH_CYCLES_EMBREE=ON )
  depends+=(embree)
}
((DISABLE_USD)) || {
  _CMAKE_FLAGS+=( -DWITH_USD=ON
                -DUSD_ROOT=/usr )
  depends+=( usd19 )
}
((DISABLE_NINJA)) ||  makedepends+=('ninja')
#shellcheck disable=SC2015
((DISABLE_CUDA)) && optdepends+=('cuda: CUDA support in Cycles') || { makedepends+=('cuda') ; ((DISABLE_OPTIX)) || makedepends+=('optix70'); }

pkgname=blender-${_blenver}-git
pkgver=2.83.20.r1.g6f40a18ecc2
pkgrel=1
pkgdesc="LTS Maintenance version of ${_branch} branch"
changelog=blender.changelog
arch=('i686' 'x86_64')
url="https://blender.org/"
depends+=('alembic' 'libgl' 'python' 'python-numpy' 'openjpeg2' 'openexr'
         'ffmpeg' 'fftw' 'openal' 'freetype2' 'libxi' 'openimageio' 'opencolorio1'
         'openvdb' 'opencollada' 'opensubdiv' 'openshadinglanguage' 'libtiff' 'libpng')
depends+=('openimagedenoise')
makedepends+=('git' 'cmake' 'boost' 'mesa' 'llvm')
provides=("blender=${_blenver}")
conflicts=("blender=${_blenver}")
license=('GPL')
# NOTE: the source array has to be kept in sync with .gitmodules
# the submodules has to be stored in path ending with git to match
# the path in .gitmodules.
# More info:
#   http://wiki.blender.org/index.php/Dev:Doc/Tools/Git
source=("blender::git+https://github.com/blender/blender${_fragment}"
        'blender-addons::git+https://github.com/blender/blender-addons'
        'blender-addons-contrib::git+https://github.com/blender/blender-addons-contrib'
        'blender-translations::git+https://github.com/blender/blender-translations'
        'blender-dev-tools::git+https://github.com/blender/blender-dev-tools'
        SelectCudaComputeArch.patch
        usd_python.patch #add missing python headers when building against python enabled usd.
        embree.patch #add missing embree link.
        'cpp14.patch::https://git.blender.org/gitweb/gitweb.cgi/blender.git/patch/171c4fb238a2a65291540ac5406187bc69f3a6bc'
        'python39.patch::https://git.blender.org/gitweb/gitweb.cgi/blender.git/patch/56d0df51a36fdce7ec2d1fbb7b47b1d95b591b5f'
        'openexr3.patch'
        'opencolorio1.patch'
        'python310.patch' #back-ported commit dae445d94a7a5e1ad38719ea05e5bb0bc76ede84 6fe00939b0a471cc149ea5b3c63ca57b049b4a37
        )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '66b9bf3db441f35119ef0eb5f855142f2e773e8002ac0216e056bcc6f8ac409c'
            '333b6fd864d55da2077bc85c55af1a27d4aee9764a1a839df26873a9f19b8703'
            '42afe119529a5350034a489225958112bf4b84bdee38757a932e5caaa9bd5ed4'
            '41e745b8fb37464a83dfedc09ff2158369cec09b96fdc855b71001e16b6cbe75'
            '7ae5ac4d636934cd46213e3f29ea67013d17316e122d8f312daec288e4f90cd9'
            '4d7c2db0464287178f0663debb6e00b4e9358cd5833f2a2b025e8be3f541e997'
            'c17cb969e67854d2c588de1590f73330cfa44efffd996430e879829b1b6c2065'
            '2e081cc09600bf216298d10d752d3edf7368964dbb07cf2fde160210323d7d35')
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        '0024f04fd0061313010a61b88634a0b86ed69695a7c072ff40f50ebab6a274ccf8ed7ed3381e501b218503f08c82b23f3f743208eb0feb81d4735c2a0c93989f'
        'e60e8f47cd25d23e70c330ca0f69a9e60b0a525bf3fa53c98d9fa288fdb3235138f93c3fad66c710741196589594069387082ede788ec5bd62b03d8e6254504b'
        '62567f79f86684e7fd99b8879b692e862c7ea85317cfacae4539d3035fe3ffc71fd39b0aa385be1efc8c31c8fe9ccac86e4b20275905150540349ba5fe3f8cbb'
        '33f4b7e71153b272f0ae3b16c9eabdb65fb275c2344a6454866c660ac9bdf6da1207e75c6f9198c64c52cebeab71f816d2852425596c0cfbcfed0835e64403ff'
        '4b11df6d494644e740cfda654fbebb2988c430d18c093739724f331738099100925fd0399b94cf0a1188c4ae804081c8380424b64f35355f7cbfde6c7ee91b44'
        '3a3d31deceb2cbe838e5054f43c288a8e8d98aab0f4ae8a67b9bb361a991b355d3c8c680ce6fd6c8efd4e38b387ac3396a67eaaba70f0c4785826d33d86c0fbe'
        '325e8fef357b953e023dd6a0f317cd10baffa27233b439560b2188671b39f7ec27c667fce9490b9cb310ba11924d35c921fb8003dad619e8542b0673c7a3eea0'
        'bfb0d78a8c97f85a08fd7167724d36a50162b89dd0587aa75e7c2e2190307c13d9df4ab4056316cac53c4200ca7ea9ad62c0ffa3712b194ed1e6c130576ab876')

pkgver() {
  git -C "$srcdir"/blender describe --long --tags | sed -r 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
}

prepare() {
  # update the submodules
  git -C "$srcdir/blender" -c protocol.file.allow=always submodule update --init --recursive --remote
  if [ ! -v _cuda_capability ] && grep -q nvidia <(lsmod); then
    git -C "$srcdir/blender" apply -v "${srcdir}"/SelectCudaComputeArch.patch
  fi
  if [[ -v _suffix ]]; then
    git -C "$srcdir/blender" apply -v <(sed "s/@@_suffix@@/${_suffix}/g" "${srcdir}/addon_path.patch")
  fi
  ((DISABLE_USD)) || git -C "$srcdir/blender" apply -v "${srcdir}"/usd_python.patch
  ((DISABLE_EMBREE)) || git -C "$srcdir/blender" apply -v "${srcdir}"/embree.patch
  git -C "$srcdir/blender" apply -v "$srcdir"/{cpp14,python3{9,10},openexr3,opencolorio1}.patch
}

build() {
  _pyver=$(python -c "from sys import version_info; print(\"%d.%d\" % (version_info[0],version_info[1]))")
  msg "python version detected: ${_pyver}"

  # determine whether we can precompile CUDA kernels
  _CUDA_PKG=$(pacman -Qq cuda 2>/dev/null) || true
  if [ "$_CUDA_PKG" != "" ] && ! ((DISABLE_CUDA)) ; then
    _CMAKE_FLAGS+=( -DWITH_CYCLES_CUDA_BINARIES=ON
                  -DCUDA_TOOLKIT_ROOT_DIR=/opt/cuda )
    ((DISABLE_OPTIX)) || _CMAKE_FLAGS+=( -DOPTIX_ROOT_DIR=/opt/optix )
    if [[ -v _cuda_capability ]]; then
      _CMAKE_FLAGS+=( -DCYCLES_CUDA_BINARIES_ARCH="$(IFS=';'; echo "${_cuda_capability[*]}";)" )
    fi
    [ -f "/usr/lib/ccache/bin/nvcc-ccache" ] && _CMAKE_FLAGS+=( -DCUDA_NVCC_EXECUTABLE=/usr/lib/ccache/bin/nvcc-ccache )
    if _cuda_gcc=$(basename "$(readlink /opt/cuda/bin/gcc)") ; then
      [ -L "/usr/lib/ccache/bin/$_cuda_gcc" ] && _CMAKE_FLAGS+=( -DCUDA_HOST_COMPILER=/usr/lib/ccache/bin/"$_cuda_gcc" )
    fi
  fi

  ((DISABLE_NINJA)) && generator="Unix Makefiles" || generator="Ninja"
  cmake -G "$generator" -S "$srcdir/blender" -B "$srcdir/build" \
        -C "${srcdir}/blender/build_files/cmake/config/blender_release.cmake" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release \
        -DWITH_INSTALL_PORTABLE=OFF \
        -DWITH_SYSTEM_GLEW=ON \
        -DWITH_PYTHON_INSTALL=OFF \
        -DPYTHON_VERSION="${_pyver}" \
        "${_CMAKE_FLAGS[@]}"
  export NINJA_STATUS="[%p | %f<%r<%u | %cbps ] "
# shellcheck disable=SC2086 # allow MAKEFLAGS to split when multiple flags provided.
  if ((DISABLE_NINJA)); then make -C "$srcdir/build" ; else ninja -C "$srcdir/build" ${MAKEFLAGS:--j1}; fi
}

package() {
  local _suffix=${_blenver}${_suffix:+_$_suffix}
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
