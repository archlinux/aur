# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# shellcheck disable=SC2034,SC2154,SC2164,SC2191

# To force cuda compute arch uncomment this line and update value of sm_xx model accordingly
#_cuda_capability+=(sm_30 sm_35 sm_37)
#_cuda_capability+=(sm_50 sm_52 sm_60 sm_61 sm_70 sm_75)
((TRAVIS)) && _cuda_capability+=(sm_50 sm_52 sm_60 sm_61 sm_70 sm_75) # Travis memory limit is not enough to build for arch 3.x.

# Configuration.
_branch="new-object-types"
_sufix=${_branch}
_fragment="#branch=${_branch}"

pkgname=blender-${_sufix}-git
pkgver=2.83.r93772.gc41b5bddc34
_blenver=${pkgver:0:4}
pkgrel=1
pkgdesc="Development version of Blenders ${_branch} branch"
arch=('i686' 'x86_64')
url="https://blender.org/"
depends=('alembic' 'libgl' 'python' 'python-numpy' 'openjpeg'
         'ffmpeg' 'fftw' 'openal' 'freetype2' 'libxi' 'openimageio' 'opencolorio'
         'openvdb' 'opencollada' 'opensubdiv' 'openshadinglanguage' 'libtiff' 'libpng')

makedepends=('git' 'cmake' 'boost' 'mesa' 'llvm')
((DISABLE_NINJA)) ||  makedepends+=('ninja')
((DISABLE_CUDA)) && optdepends=('cuda: CUDA support in Cycles') || makedepends+=('cuda')
provides=("blender-${_sufix}")
conflicts=("blender-${_sufix}")
#options=(!makeflags)
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
        addon_path.patch
        )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '66b9bf3db441f35119ef0eb5f855142f2e773e8002ac0216e056bcc6f8ac409c'
            '81e0047ba48662ee0ec1da1ffd427641305a0edc68c7913da9460ae4c1fefe72')

pkgver() {
  cd "$srcdir/blender"
  printf "%s.r%s.g%s" "$(grep -Po "BLENDER_VERSION *\K[0-9]{3}" source/blender/blenkernel/BKE_blender_version.h|sed 's/./&./1')" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/blender"
  # update the submodules
  git submodule update --init --recursive --remote
  if [[ ! -v _cuda_capability ]] && grep -q nvidia <(lsmod); then
    git apply -v "${srcdir}/SelectCudaComputeArch.patch"
  fi
  if [[ -v _sufix ]]; then
    git apply -v <(sed "s/@@_sufix@@/${_sufix}/g" "${srcdir}/addon_path.patch")
  fi
}

build() {
  mkdir -p "$srcdir/blender-build"
  cd "$srcdir/blender-build"

  _pyver=$(python -c "from sys import version_info; print(\"%d.%d\" % (version_info[0],version_info[1]))")
  msg "python version detected: ${_pyver}"

  # determine whether we can precompile CUDA kernels
  if pacman -Qq cuda 2>&- ; then
    _EXTRAOPTS+=( -DWITH_CYCLES_CUDA_BINARIES=ON \
                  -DCUDA_TOOLKIT_ROOT_DIR=/opt/cuda )
    if [[ -v _cuda_capability ]]; then
      _EXTRAOPTS+=( -DCYCLES_CUDA_BINARIES_ARCH="$(IFS=';'; echo "${_cuda_capability[*]}";)" )
    fi
  fi

  ((DISABLE_NINJA)) && generator="Unix Makefiles" || generator="Ninja"
  cmake -G "$generator" "$srcdir/blender" \
        -C "${srcdir}/blender/build_files/cmake/config/blender_release.cmake" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DWITH_INSTALL_PORTABLE=OFF \
        -DWITH_PLAYER=OFF \
        -DWITH_ALEMBIC=ON \
        -DWITH_OPENCOLORIO=ON \
        -DWITH_FFTW3=ON \
        -DWITH_SYSTEM_GLEW=ON \
        -DWITH_CODEC_FFMPEG=ON \
        -DWITH_PYTHON_INSTALL=OFF \
        -DPYTHON_VERSION="${_pyver}" \
        -DWITH_MOD_OCEANSIM=ON \
        -DWITH_CYCLES_OPENSUBDIV=ON \
        -DWITH_CYCLES_OSL=ON \
        -DWITH_LLVM=ON \
        -DWITH_IMAGE_OPENEXR=ON \
        -DWITH_OPENSUBDIV=ON \
        -DWITH_OPENVDB=ON \
        -DWITH_OPENVDB_BLOSC=ON \
        -DWITH_OPENCOLLADA=ON \
        "${_EXTRAOPTS[@]}"
  export NINJA_STATUS="[%p | %f<%r<%u | %cbps ] "
# shellcheck disable=SC2086 # allow MAKEFLAGS to split when multiple flags provided.
  if ((DISABLE_NINJA)); then make; else ninja ${MAKEFLAGS:--j1}; fi
}

package() {
  cd "$srcdir/blender-build"
  export DESTDIR="$pkgdir"
  if ((DISABLE_NINJA)); then make install; else ninja install; fi

  if [[ -v _sufix ]]; then
    msg "add -${_sufix} sufix to desktop shortcut"
    sed -i "s/=blender/=blender-${_sufix}/g" "${pkgdir}/usr/share/applications/blender.desktop"
    sed -i "s/=Blender/=Blender-${_sufix}/g" "${pkgdir}/usr/share/applications/blender.desktop"
    mv "${pkgdir}/usr/share/applications/blender.desktop" "${pkgdir}/usr/share/applications/blender-${_sufix}.desktop"

    msg "add -${_sufix} sufix to binaries"
    mv "${pkgdir}/usr/bin/blender" "${pkgdir}/usr/bin/blender-${_sufix}"
    mv "${pkgdir}/usr/bin/blender-thumbnailer.py" "${pkgdir}/usr/bin/blender-${_sufix}-thumbnailer.py"

    msg "mv doc/blender to doc/blender-${_sufix}"
    mv "${pkgdir}/usr/share/doc/blender" "${pkgdir}/usr/share/doc/blender-${_sufix}"

    msg "add -${_sufix} sufix to man page"
    mv "${pkgdir}/usr/share/man/man1/blender.1" "${pkgdir}/usr/share/man/man1/blender-${_sufix}.1"

    msg "add -${_sufix} sufix to all icons"
    while read -r icon
    do
      # ${filename##/*.} extra extenssion from path
      # ${filename%.*} extract filename form path
      # look at bash "manipulatin string"
      mv "$icon" "${icon%.*}-${_sufix}.${icon##/*.}"
    done < <(find "${pkgdir}/usr/share/icons" -type f)
  fi

  if [[ -e "$pkgdir/usr/share/blender/${_blenver}${_sufix:+_$_sufix}/scripts/addons/cycles/lib/" ]] ; then
    # make sure the cuda kernels are not stripped
    chmod 444 "$pkgdir"/usr/share/blender/${_blenver}${_sufix:+_$_sufix}/scripts/addons/cycles/lib/*
  fi
}
# vim:set sw=2 ts=2 et:
