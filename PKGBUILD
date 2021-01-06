# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# shellcheck disable=SC2034,SC2154,SC2164,SC2191

# To force cuda compute arch uncomment this line and update value of sm_xx model accordingly
#_cuda_capability+=(sm_30 sm_35 sm_37)
#_cuda_capability+=(sm_50 sm_52 sm_60 sm_61 sm_70 sm_75)
((TRAVIS)) && _cuda_capability+=(sm_50 sm_52 sm_60 sm_61 sm_70 sm_75) # Travis memory limit is not enough to build for arch 3.x.

# Configuration.
_branch="fracture_modifier"
_sufix=${_branch}
_fragment="#branch=${_branch}"

pkgname=blender-${_sufix}-git
pkgver=2.79.r70678.g233ad61cb8d
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
        'git+https://github.com/scorpion81/blender-fracture-helper.git'
        SelectCudaComputeArch.patch
        gcc8.patch
        gcc9.patch
        ffmpeg.patch
        openvdb.patch
        collada1668.patch
        oiio-2.0.patch
        Cleanup-use-PyImport_GetModuleDict.patch
        python3.8.patch
        addon_path.patch
        )
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            '39ab45862044a838e49720c93ef5d246c3192e1438bf3ceca169e3ed0439ea18'
            '6093024b0a27f1fd144f5f8a25121939f74f41bcc164d8b8b58f33d3c364e456'
            'ec95ba11ef9f41ca3123b330f25ab767f7916531f39943b4f92f28f36e1e0725'
            '450a3ec68360981e47503e734e8229a4ad06554ad009664b4abfb6bf317962d9'
            'e22d5908877165958991161c6800dac9f8810e2d92fb18c6fe09fe1a24e5d18c'
            'ba390c37ea5a63e603c97350f9401fe1794c54406243a48f860195cc0c6085ab'
            '5ff48d0e35025f21ee45274b56d1788b2e1768fa4d86b5032a40941057695176'
            'f4fea95b9d27fb5c30a13cd57ae22d8f3091d456719377e28572091793e941c2'
            '229853b98bb62e1dec835aea6b2eab4c3dabbc8be591206573a3c1b85f10be59'
            'e959c2ae13baa35e9ee6d9ff8f30fea55a60ccd59a0b8d047df134aee4b5424e')

pkgver() {
  blender_version=$(grep -Po "BLENDER_VERSION\s+\K[0-9]{3}" "$srcdir"/blender/source/blender/blenkernel/BKE_blender_version.h)
  printf "%d.%d.r%s.g%s" \
    $((blender_version/100)) \
    $((blender_version%100)) \
    "$(git -C "$srcdir/blender" rev-list --count HEAD)" \
    "$(git -C "$srcdir/blender" rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/blender"
  # update the submodules
  git submodule update --init --recursive --remote
  if [[ ! -v _cuda_capability ]] && grep -q nvidia <(lsmod); then
    git apply -v "${srcdir}/SelectCudaComputeArch.patch"
  fi
  git apply -v "${srcdir}/gcc8.patch"
  git apply -v "${srcdir}/ffmpeg.patch"
  git apply -v "${srcdir}/openvdb.patch"
  git apply -v "${srcdir}/collada1668.patch"
  git apply -v "${srcdir}/gcc9.patch"
  git apply -v "${srcdir}/oiio-2.0.patch"
  git apply -v "${srcdir}/Cleanup-use-PyImport_GetModuleDict.patch"
  git apply -v "${srcdir}/python3.8.patch"
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
    _EXTRAOPTS=( -DWITH_CYCLES_CUDA_BINARIES=ON \
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

  msg "install fracture-helper addon"
  install -Dm644 "${srcdir}"/blender-fracture-helper/*.py "${pkgdir}/usr/share/blender/${_blenver}_${_sufix}/scripts/addons/"

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
