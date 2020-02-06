# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# shellcheck disable=SC2034

#to enforce cuda verison uncomment this line and update value of sm_xx model accordingly
#_cuda_capability+=(sm_30 sm_35 sm_37)
#_cuda_capability+=(sm_50 sm_52 sm_60 sm_61 sm_70 sm_75)
((TRAVIS)) && _cuda_capability+=(sm_50 sm_52 sm_60 sm_61 sm_70 sm_75) # suppress 3.x to prevent Travis build exceed time limit.

_branch="fracture_modifier"
_sufix=${_branch}
_fragment="#branch=${_branch}"
pkgname=blender-${_sufix}-git
pkgver=2.79b.r2169.g233ad61cb8d
_blenver=${pkgver:0:4}
pkgrel=1
pkgdesc="Development version of Blenders ${_branch} branch"
arch=('i686' 'x86_64')
url="https://blender.org/"
depends=('alembic' 'libgl' 'python' 'python-numpy' 'openjpeg' 'desktop-file-utils' 'hicolor-icon-theme'
         'ffmpeg' 'fftw' 'openal' 'freetype2' 'libxi' 'openimageio' 'opencolorio'
         'openvdb' 'opencollada' 'opensubdiv' 'openshadinglanguage' 'libtiff' 'libpng')

makedepends=('git' 'cmake' 'boost' 'mesa' 'llvm')
((DISABLE_NINJA)) ||  makedepends+=('ninja')
((DISABLE_CUDA)) && optdepends=('cuda: CUDA support in Cycles') || makedepends+=('cuda')
provides=("blender-${_sufix}")
conflicts=("blender-${_sufix}")
#options=(!makeflags)
license=('GPL')
install=blender.install
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
        blender-fracture_modifier.desktop
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
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         '0a4847775c9eec16a76ec7d3a03a678d'
         'a9b7fea83b66f4ced146b32ef4433479'
         'df6f12c3327678b0a05f9e48e9ace67c'
         '8679d9ab041141cf4fa1ae4da9389986'
         'bb325c8c879d677ad1f1c54797268716'
         'fe709e616e52c1acc47c1cc0f77c2694'
         '4e4423315f07bc724c7703c57c4481d7'
         'f98eb0576a8e00444cc3e936d31a9812'
         '1fafe7b27c376f0fd8b7bb7985deef6e'
         '54caa2acab217f8abb9a00ef05f1d0d7'
         '88097ddbca087f932f8805f0caa185f4')

pkgver() {
  cd "$srcdir/blender"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/blender"
  # update the submodules
  git submodule update --init --recursive --remote
  if [ -z "$_cuda_capability" ] && grep -q nvidia <(lsmod); then 
    git apply -v ${srcdir}/SelectCudaComputeArch.patch
  fi
  git apply -v ${srcdir}/gcc8.patch
  git apply -v ${srcdir}/ffmpeg.patch
  git apply -v ${srcdir}/openvdb.patch
  git apply -v ${srcdir}/collada1668.patch
  git apply -v ${srcdir}/gcc9.patch
  git apply -v ${srcdir}/oiio-2.0.patch
  git apply -v ${srcdir}/Cleanup-use-PyImport_GetModuleDict.patch
  git apply -v ${srcdir}/python3.8.patch
  sed -i "s/@@_sufix@@/${_sufix}/g" ${srcdir}/addon_path.patch
  git apply -v ${srcdir}/addon_path.patch
}

build() {
  mkdir -p "$srcdir/blender-build"
  cd "$srcdir/blender-build"

  _pyver=$(python -c "from sys import version_info; print(\"%d.%d\" % (version_info[0],version_info[1]))")
  msg "python version detected: ${_pyver}"

  # determine whether we can precompile CUDA kernels
  _CUDA_PKG=`pacman -Qq cuda 2>/dev/null` || true
  if [ "$_CUDA_PKG" != "" ]; then
      _EXTRAOPTS=(-DWITH_CYCLES_CUDA_BINARIES=ON \
                  -DCUDA_TOOLKIT_ROOT_DIR=/opt/cuda)
      if [ -v _cuda_capability ]; then
        _EXTRAOPTS+=(-DCYCLES_CUDA_BINARIES_ARCH=$(IFS=';'; echo "${_cuda_capability[*]}";))
      fi
  fi

  ((DISABLE_NINJA)) && generator="Unix Makefiles" || generator="Ninja"
  cmake -G "$generator" "$srcdir/blender" \
        -C${srcdir}/blender/build_files/cmake/config/blender_release.cmake \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DWITH_INSTALL_PORTABLE=OFF \
        -DWITH_PLAYER=OFF \
        -DWITH_ALEMBIC=ON \
        -DWITH_OPENCOLORIO=ON \
        -DWITH_FFTW3=ON \
        -DWITH_SYSTEM_GLEW=ON \
        -DWITH_CODEC_FFMPEG=ON \
        -DWITH_PYTHON_INSTALL=OFF \
        -DPYTHON_VERSION=${_pyver} \
        -DWITH_MOD_OCEANSIM=ON \
        -DWITH_CYCLES_OPENSUBDIV=ON \
        -DWITH_CYCLES_OSL=ON \
        -DWITH_LLVM=ON \
        -DWITH_IMAGE_OPENEXR=ON \
        -DWITH_OPENSUBDIV=ON \
        -DWITH_OPENVDB=ON \
        -DWITH_OPENVDB_BLOSC=ON \
        -DWITH_OPENCOLLADA=ON \
        ${_EXTRAOPTS[@]}
  export NINJA_STATUS="[%p | %f<%r<%u | %cbps ] "
  ((DISABLE_NINJA)) && make -j$(nproc) || ninja -d stats
}

package() {
  cd "$srcdir/blender-build"
  ((DISABLE_NINJA)) && make install DESTDIR="$pkgdir" || DESTDIR="$pkgdir" ninja install

  msg "install fracture-helper addon"  
  install ${srcdir}/blender-fracture-helper/*.py ${pkgdir}/usr/share/blender/${_blenver}_${_sufix}/scripts/addons/

  msg "add -${_sufix} sufix to desktop shortcut"
  sed -i "s/=blender/=blender-${_sufix}/g" ${pkgdir}/usr/share/applications/blender.desktop
  sed -i "s/=Blender/=Blender-${_sufix}/g" ${pkgdir}/usr/share/applications/blender.desktop
  mv ${pkgdir}/usr/share/applications/blender.desktop ${pkgdir}/usr/share/applications/blender-${_sufix}.desktop

  msg "add -${_sufix} sufix to binaries"
  mv ${pkgdir}/usr/bin/blender ${pkgdir}/usr/bin/blender-${_sufix}
  mv ${pkgdir}/usr/bin/blender-thumbnailer.py ${pkgdir}/usr/bin/blender-${_sufix}-thumbnailer.py
#  mv ${pkgdir}/usr/bin/blenderplayer ${pkgdir}/usr/bin/blenderplayer-${_sufix}

  msg "mv doc/blender to doc/blender-${_sufix}"
  mv ${pkgdir}/usr/share/doc/blender ${pkgdir}/usr/share/doc/blender-${_sufix}

  msg "add -${_sufix} sufix to all icons"  
  for icon in `find ${pkgdir}/usr/share/icons -type f`
  do
    # ${filename##/*.} extra extenssion from path
    # ${filename%.*} extract filename form path
    # look at bash "manipulatin string" 
    mv $icon ${icon%.*}-${_sufix}.${icon##/*.}
  done

  if [ -e "$pkgdir"/usr/share/blender/*/scripts/addons/cycles/lib/ ] ; then
    # make sure the cuda kernels are not stripped
    chmod 444 "$pkgdir"/usr/share/blender/*/scripts/addons/cycles/lib/*
  fi
}
# vim:set sw=2 ts=2 et:
