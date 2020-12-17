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
  depends+=( usd=19.11 )
}
((DISABLE_NINJA)) ||  makedepends+=('ninja')
#shellcheck disable=SC2015
((DISABLE_CUDA)) && optdepends+=('cuda: CUDA support in Cycles') || { makedepends+=('cuda') ; ((DISABLE_OPTIX)) || makedepends+=('optix=7.0'); }

pkgname=blender-${_blenver}-git
pkgver=2.83.r95764.g02ff143f609
pkgrel=1
pkgdesc="LTS Maintenance version of ${_branch} branch"
changelog=blender.changelog
arch=('i686' 'x86_64')
url="https://blender.org/"
depends+=('alembic' 'libgl' 'python' 'python-numpy' 'openjpeg2'
         'ffmpeg' 'fftw' 'openal' 'freetype2' 'libxi' 'openimageio' 'opencolorio'
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
source=("git://git.blender.org/blender.git${_fragment}"
        'blender-addons.git::git://git.blender.org/blender-addons.git'
        'blender-addons-contrib.git::git://git.blender.org/blender-addons-contrib.git'
        'blender-translations.git::git://git.blender.org/blender-translations.git'
        'blender-dev-tools.git::git://git.blender.org/blender-dev-tools.git'
        SelectCudaComputeArch.patch
        usd_python.patch #add missing python headers when building against python enabled usd.
        embree.patch #add missing embree link.
        'cuda11.patch::https://git.blender.org/gitweb/gitweb.cgi/blender.git/patch/a9644c812fc17b38503828d6edf7d259b6fe0e74'
        'cpp14.patch::https://git.blender.org/gitweb/gitweb.cgi/blender.git/patch/171c4fb238a2a65291540ac5406187bc69f3a6bc'
        'python39.patch::https://git.blender.org/gitweb/gitweb.cgi/blender.git/patch/56d0df51a36fdce7ec2d1fbb7b47b1d95b591b5f'
        )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '66b9bf3db441f35119ef0eb5f855142f2e773e8002ac0216e056bcc6f8ac409c'
            '12bd6db5c1fe14244fd7321e3d740941a36aa545ec21b02325e7553c9214778a'
            '42afe119529a5350034a489225958112bf4b84bdee38757a932e5caaa9bd5ed4'
            '2e5cf80c760aaf7326505b81f408c90fb6c4ff22b8cbb3638397809011a13562'
            '44fad9ac2320d20d21b7aef46f70c05d55697ecde1446513f0a5842014a9d99c'
            '7ae5ac4d636934cd46213e3f29ea67013d17316e122d8f312daec288e4f90cd9')
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        '0024f04fd0061313010a61b88634a0b86ed69695a7c072ff40f50ebab6a274ccf8ed7ed3381e501b218503f08c82b23f3f743208eb0feb81d4735c2a0c93989f'
        'b3db637b8d12a00bf1bb1bee0111b7b540af83a4b91f4f31a0ba0240c0a0fcaa4732c88729031be04d50167413127a49ad41bf86454f2ed99ddac18d00d41868'
        '62567f79f86684e7fd99b8879b692e862c7ea85317cfacae4539d3035fe3ffc71fd39b0aa385be1efc8c31c8fe9ccac86e4b20275905150540349ba5fe3f8cbb'
        '81f85f3024ce9891faf3d83f164c7f3164b5eb13bdcbf055298e2fca2ee9380ead6241563cb47ea9b434d1af18a70c2f37ab42606776c8be8219650b12e28f6b'
        'eb1107f2506b51004455a5e56cade10577c553d822dbb60e0068030a2480e9e51a6d434ef3817d0ffc9fe197e46de6c471aa6650691a5201985447d316fee039'
        '4b11df6d494644e740cfda654fbebb2988c430d18c093739724f331738099100925fd0399b94cf0a1188c4ae804081c8380424b64f35355f7cbfde6c7ee91b44')

pkgver() {
  blender_version=$(grep -Po "BLENDER_VERSION \K[0-9]{3}" "$srcdir"/blender/source/blender/blenkernel/BKE_blender_version.h)
  printf "%d.%d.r%s.g%s" \
    $((blender_version/100)) \
    $((blender_version%100)) \
    "$(git -C "$srcdir/blender" rev-list --count HEAD)" \
    "$(git -C "$srcdir/blender" rev-parse --short HEAD)"
}

prepare() {
  # update the submodules
  git -C "$srcdir/blender" submodule update --init --recursive --remote
  if [ ! -v _cuda_capability ] && grep -q nvidia <(lsmod); then
    git -C "$srcdir/blender" apply -v "${srcdir}"/SelectCudaComputeArch.patch
  fi
  if [[ -v _suffix ]]; then
    git -C "$srcdir/blender" apply -v <(sed "s/@@_suffix@@/${_suffix}/g" "${srcdir}/addon_path.patch")
  fi
  ((DISABLE_USD)) || git -C "$srcdir/blender" apply -v "${srcdir}"/usd_python.patch
  ((DISABLE_EMBREE)) || git -C "$srcdir/blender" apply -v "${srcdir}"/embree.patch
  git -C "$srcdir/blender" apply -v "$srcdir/cuda11.patch"
  git -C "$srcdir/blender" apply -v "$srcdir/cpp14.patch"
  git -C "$srcdir/blender" apply -v "$srcdir/python39.patch"
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
