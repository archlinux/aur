#!/bin/hint/bash
# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# shellcheck disable=SC2034,SC2154 # allow unused/unset variables
# shellcheck disable=SC2191 # preserve current _CMAKE_FLAGS initialization.

# Configuration.
_blenver="2.80"
_branch="blender-v${_blenver}-release"
_fragment=${FRAGMENT:-#branch=${_branch}}
[[ -v CUDA_ARCH ]] && _cuda_capability=${CUDA_ARCH}

#some extra, unofficially supported stuff goes here:
((TRAVIS)) && _cuda_capability+=(sm_50 sm_52 sm_60 sm_61 sm_70 sm_75) # Travis memory limit is not enough to build for arch 3.x.
((DISABLE_NINJA)) ||  makedepends+=('ninja')
#shellcheck disable=SC2015
((DISABLE_CUDA)) && optdepends+=('cuda: CUDA support in Cycles') || makedepends+=('cuda')

pkgname=blender-${_blenver}-git
pkgver=2.80.r89282.gf6cb5f54494
pkgrel=1
pkgdesc="Maintenance version of ${_branch} branch"
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
        python3.8.patch
        'cuda11.patch'
        'cpp14.patch'
        'python.patch::https://git.blender.org/gitweb/gitweb.cgi/blender.git/patch/e413b39a936181cc954dfbf054b0a19794d8902c'
        'python39.patch::https://git.blender.org/gitweb/gitweb.cgi/blender.git/patch/56d0df51a36fdce7ec2d1fbb7b47b1d95b591b5f'
        'osl111.patch::https://git.blender.org/gitweb/gitweb.cgi/blender.git/patch/7d85b6431fc331d9869f945bf7c9f3353b7b8c95'
        )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '66b9bf3db441f35119ef0eb5f855142f2e773e8002ac0216e056bcc6f8ac409c'
            'e399be5e2646699e7fbde2bbb40a9d49b4019f942c9ad18b01b2ef8b9ee35959'
            '0316d92f180f2fa428a206074bd5adfd30968f9ae5d308efea05e42741dd53fd'
            'd2de635d751e65ec3a8375ab3ba061d0ceeab38027059a965a5f4fff93696c78'
            '21b45266503f71bd2245528a206cc215d9eb5cbcf0cd06977bbd529b09ee3a44'
            '7ae5ac4d636934cd46213e3f29ea67013d17316e122d8f312daec288e4f90cd9'
            '99b96f4f6d02cd3e226d814175f7915a85a43966216d5a522265c68091a3b73a')
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        '0024f04fd0061313010a61b88634a0b86ed69695a7c072ff40f50ebab6a274ccf8ed7ed3381e501b218503f08c82b23f3f743208eb0feb81d4735c2a0c93989f'
        '8f6627666bb42495cbe3d76e47cb5e200bc18691a348037ea1b65d43164d0eb95cbb70f0bfe283fb8807ca0e039fa4f4f513b564ab020c714b1d682124a9f1da'
        '6f7958fbea799f5ecdf556112e3adc497686c00df8d460a094a818b007292dd6894ff6d280de8f88bc81cea3c52a7e003f44ea1048af52ccf11b5514e75b89ea'
        'dd4e7423409432befd4937182f830c98ba6c981bf3e596e933fc95df4668ba9caf8882deed35ea9501aed67b0b9ee6cb920557b205ef86221bb285f68bb02b3a'
        'fd1c4a53803a9fb9cf64a23f43dbbf34629bc942759914422e700923c542f158ea3ff38463a4fde8ea488ac5c639e057b4b1c72515bbdbad1a6be1a97870f413'
        '4b11df6d494644e740cfda654fbebb2988c430d18c093739724f331738099100925fd0399b94cf0a1188c4ae804081c8380424b64f35355f7cbfde6c7ee91b44'
        'ab990d0771b593ec9e8637e330ba2721fe9d6c82c72eb2296f1580129da0e4de525e58921869fabd36c3b92ec4fc1754b7dc4cb2da1674b5baa5d26332eebdc8')

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
  git -C "$srcdir/blender" apply -v "$srcdir"/{cpp14,python{3.8,39},osl111}.patch
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
