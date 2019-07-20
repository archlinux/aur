# Maintainer : bartus <arch-user-repoᘓbartus.33mail.com>
# shellcheck disable=SC2034

#to enforce cuda verison uncomment this line and update value of sm_xx model accordingly
#_cuda_capability+=(sm_30 sm_35 sm_37)
#_cuda_capability+=(sm_50 sm_52 sm_60 sm_61 sm_70 sm_75)
((TRAVIS)) && _cuda_capability+=(sm_50 sm_52 sm_60 sm_61 sm_70 sm_75) # suppress 3.x to prevent Travis build exceed time limit.

pkgname=blender-2.8-git
_fragment="#branch=master"
pkgver=2.80.r89204.105ae3be999
pkgrel=1
pkgdesc="Development version of Blender 2.8 branch"
arch=('i686' 'x86_64')
url="https://blender.org/"
depends=('alembic' 'libgl' 'python' 'python-numpy' 'openjpeg' 'desktop-file-utils' 'hicolor-icon-theme'
         'ffmpeg' 'fftw' 'openal' 'freetype2' 'libxi' 'openimageio' 'opencolorio'
         'openvdb' 'opencollada' 'opensubdiv' 'openshadinglanguage' 'libtiff' 'libpng')
optdepends=('cuda: CUDA support in Cycles')
makedepends=('git' 'cmake' 'boost' 'mesa' 'llvm')
((DISABLE_NINJA)) ||  makedepends+=('ninja')
((DISABLE_CUDA)) || makedepends+=('cuda')
provides=('blender=2.80')
conflicts=('blender')
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
        blender-2.8.desktop
        SelectCudaComputeArch.patch
        )
md5sums=('SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'SKIP'
         'cd108dca1c77607c6a7cc45aa284ea97'
         '4441d9a6db38b85b7dc5c3c9e6872951')

pkgver() {
  cd "$srcdir/blender"
  printf "2.80.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/blender"
  # update the submodules
  git submodule update --init --recursive --remote
  if [ -z "$_cuda_capability" ] && grep -q nvidia <(lsmod); then 
    git apply -v ${srcdir}/SelectCudaComputeArch.patch
  fi
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
        -DCMAKE_BUILD_TYPE=Release \
        -DWITH_INSTALL_PORTABLE=OFF \
        -DWITH_SYSTEM_GLEW=ON \
        -DWITH_PYTHON_INSTALL=OFF \
        -DPYTHON_VERSION=${_pyver} \
        -DWITH_LLVM=ON \
        ${_EXTRAOPTS[@]}
  export NINJA_STATUS="[%p | %f<%r<%u | %cbps ] "
  ((DISABLE_NINJA)) && make -j$(nproc) || ninja -d stats
}

package() {
  cd "$srcdir/blender-build"
  ((DISABLE_NINJA)) && make install DESTDIR="$pkgdir" || DESTDIR="$pkgdir" ninja install
  
  msg "add -2.8 sufix to desktop shortcut"
  sed -i 's/=blender/=blender-2.8/g' ${pkgdir}/usr/share/applications/blender.desktop
  sed -i 's/=Blender/=Blender-2.8/g' ${pkgdir}/usr/share/applications/blender.desktop
  mv ${pkgdir}/usr/share/applications/blender.desktop ${pkgdir}/usr/share/applications/blender-2.8.desktop

  msg "add -2.8 sufix to binaries"
  mv ${pkgdir}/usr/bin/blender ${pkgdir}/usr/bin/blender-2.8
  mv ${pkgdir}/usr/bin/blender-thumbnailer.py ${pkgdir}/usr/bin/blender-2.8-thumbnailer.py
#  mv ${pkgdir}/usr/bin/blenderplayer ${pkgdir}/usr/bin/blenderplayer-2.8

  msg "mv doc/blender to doc/blender-2.8"
  mv ${pkgdir}/usr/share/doc/blender ${pkgdir}/usr/share/doc/blender-2.8

  msg "add -2.8 sufix to all icons"  
  for icon in `find ${pkgdir}/usr/share/icons -type f`
  do
    # ${filename##/*.} extra extenssion from path
    # ${filename%.*} extract filename form path
    # look at bash "manipulatin string" 
    mv $icon ${icon%.*}-2.8.${icon##/*.}
  done

  if [ -e "$pkgdir"/usr/share/blender/*/scripts/addons/cycles/lib/ ] ; then
    # make sure the cuda kernels are not stripped
    chmod 444 "$pkgdir"/usr/share/blender/*/scripts/addons/cycles/lib/*
  fi
}
# vim:set sw=2 ts=2 et:
